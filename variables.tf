# Required
variable "distro" {
  type = string
  description = "The distro of the test VM"
}
variable "molecule_scenario" {
  type = string
  description = "The name of the molecule scenario that created the VM"
}
variable "proxmox_password" {
  type = string
  sensitive = true
}
variable "proxmox_user" {
  type = string
}
variable "proxmox_template_id" {
  type = string
  description = "The VM template ID"
}

# Optional
variable "bridge_nic" {
  type = string
  default = "vmbr0"
  description = "The network bridge interface name"
}
variable "cpu_cores" {
  type = number
  # Single core testing sucks
  default = 2
  description = "CPU core count"
}
variable "disk_size" {
  type = string
  # The template VMs start with an 8G disk so this bypasses the need to resize
  default = "8G"
  description = "Disk size as a string in bytes or suffixed with `T`, `G`, `M`, or `K`"
}
variable "memory_size" {
  type = number
  # A sane default for most stuff I test
  default = 512
  description = "Memory size in Megabytes"
}
variable "proxmox_target_node" {
  type = string
  default = "ank"
  description = "Host Proxmox cluster node"
}
variable "proxmox_storage_pool" {
  type = string
  # This is where the templates are so a full clone goes a little faster
  default = "base-images"
  description = "The name of the Proxmox storage pool on `proxmox_target_node`"
}
