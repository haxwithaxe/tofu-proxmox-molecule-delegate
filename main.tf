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
  name        = "molecule-${var.distro}-${var.scenario}"
  target_node = var.node
  clone = var.template_id
  full_clone = false
  memory = 1024
  cpu {
    cores = 2
  }
  tags = "tofu,molecule,${var.distro},${var.scenario}"
  agent = 1

  network {
    id = 0
    bridge = "vmbr0"
    model = "virtio"
  }

  disk {
    slot = "virtio0"
    storage = var.storage_pool
    size = "8G"
  }
}


output "vmid" {
  value = proxmox_vm_qemu.molecule_test.id
}

output "ipv4_address" {
  sensitive = true
  value = proxmox_vm_qemu.molecule_test.default_ipv4_address
}

output "ipv6_address" {
  sensitive = true
  value = proxmox_vm_qemu.molecule_test.default_ipv6_address
}
