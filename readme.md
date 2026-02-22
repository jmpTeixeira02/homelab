# Architecture
- Baremetal Proxmox Machine
    - 1 SSD Boot Drive for Proxmox, ISOs and VM images
    - HDDs for shared content (File Server, Media, etc.)
- Proxmox baremetal machine post-setup with Ansible
- OpenTofu to create TalosOS K8 controller and worker VMs

# Setup
1. Install [Proxmox](https://proxmox.com/en/)
2. Get the IP from the Proxmox Host
3. Run make add-node and add the proxmox host
4. Run make playbook

```
# TODO 
- Add services to TalosOS VMs
- Certificates ?
- More modular
