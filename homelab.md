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
2. Run Proxmox Post-Install Script
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/tools/pve/post-pve-install.sh)"
```
3. Download [TalosOS](https://factory.talos.dev/https://factory.talos.dev/)
    - Cloud Server
    - NoCloud
    - QEMU guest agent
4. Setup [OpenTofu](https://search.opentofu.org/provider/telmate/proxmox/latest)
```bash
pveum role add TerraformProv -privs "Datastore.AllocateSpace Datastore.AllocateTemplate Datastore.Audit Pool.Allocate Pool.Audit Sys.Audit Sys.Console Sys.Modify VM.Allocate VM.Audit VM.Clone VM.Config.CDROM VM.Config.Cloudinit VM.Config.CPU VM.Config.Disk VM.Config.HWType VM.Config.Memory VM.Config.Network VM.Config.Options VM.Migrate VM.PowerMgmt SDN.Use"
pveum user add terraform-prov@pve --password <password>
pveum aclmod / -user terraform-prov@pve -role TerraformProv
```
