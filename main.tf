terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "3.0.2-rc05"
    }
  }
}

provider "proxmox" {
  pm_api_url = "https://ank.haxwith.casa:8006/api2/json"
  pm_user = var.proxmox_user
  pm_password = var.proxmox_password
}

resource "proxmox_vm_qemu" "molecule_test" {
  name = "molecule-${var.distro}-${var.molecule_scenario}"
  target_node = var.proxmox_target_node
  clone = var.proxmox_template_id
  full_clone = false
  memory = var.memory_size
  cpu {
    cores = var.cpu_cores
  }
  tags = "tofu,molecule,${var.distro},${var.molecule_scenario}"
  agent = 1
  skip_ipv6 = true
  agent_timeout = 300

  network {
    id = 0
    bridge = var.bridge_nic
    model = "virtio"
  }

  disk {
    slot = "virtio0"
    storage = var.proxmox_storage_pool
    size = var.disk_size
  }
}


output "vmid" {
  value = proxmox_vm_qemu.molecule_test.vmid
}

output "instance" {
  value = var.molecule_instance
}

output "ipv4_address" {
  sensitive = true
  value = proxmox_vm_qemu.molecule_test.default_ipv4_address
}

output "ipv6_address" {
  sensitive = true
  value = proxmox_vm_qemu.molecule_test.default_ipv6_address
}
