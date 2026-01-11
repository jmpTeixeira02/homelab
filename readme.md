- Baremetal Proxmox
- Terraform to create worker Proxmox VMs. Create N VMs in K8s

# Architecture
- Baremetal Proxmox Machine
    - 1 SSD Boot Drive for Proxmox, ISOs and VM images
    - HDDs for shared content (File Server, Media, etc.)
- Operations on Proxmox with Ansible
- Create VMs with OpenTofu
- K8s Orchestrator (?)
- TalosOS K8 Worker

# Setup

1. Install [Proxmox](https://proxmox.com/en/)
2. Get the IP from the Proxmox Host
3. Run make add-node and add the proxmox host
4. Run make playbook
5. Run make vm-up

```
# TODO 
- Remove hardcoded password
- Automate ansible and tofu for multiple hosts
- Add services to TalosOS VMs
