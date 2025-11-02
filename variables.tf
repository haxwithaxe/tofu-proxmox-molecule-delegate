variable "node" {
  type = string
  default = "ank"
  description = "Host Proxmox cluster node"
}
variable "storage_pool" {
  type = string
  default = "base-images"
  description = "The base image storage pool"
}
variable "template_id" {
  type = string
  description = "The VM template ID"
}
variable "distro" {
  type = string
  description = "The distro of the test VM"
}
variable "scenario" {
  type = string
  description = "The name of the molecule scenario that created the VM"
}
variable "proxmox_user" {
  type = string
}
variable "proxmox_password" {
  type = string
  sensitive = true
}
