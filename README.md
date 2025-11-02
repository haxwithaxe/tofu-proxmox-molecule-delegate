# OpenTofu Proxmox Test VM Plan

A tofu plan to deploy test VMs on Proxmox with Molecule.

If you are using this with my [delegated Molecule scenario example](https://github.com/haxwithaxe/molecule-delegated-tofu-examplhttps://github.com/haxwithaxe/molecule-delegated-tofu-examplee) use the `example` branch of this repo.

## Variables
- `node` - Your Proxmox node to run VMs on. I left the default to what I use internally.
- `storage_pool` - The storage pool to stick the test VM dives on. I left the default to what I use internally.
- `template_id` - The name of the VM template.
- `distro` - The distro to label the VM with
- `scenario` - The name of the Molecule scenario to label the VM with.
- `proxmox_user` - The Proxmox API user.
- `proxmox_password` - The Proxmox API user password.

## Dependencies
- https://search.opentofu.org/provider/telmate/proxmox/latest

## Examples

### CLI
```sh
tofu apply \
    -var 'node=pve0' \
    -var 'storage_pool=base-images' \
    -var 'template_id=debian-13-latest' \
    -var 'distro=debian-13' \
    -var 'scenario=hello-delegated' \
    -var 'proxmox_user=tofu@pve' \
    -var 'proxmox_password=supersecretpassword'
```

### Molecule
https://github.com/haxwithaxe/molecule-delegated-tofu-example
