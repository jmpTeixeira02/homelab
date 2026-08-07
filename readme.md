# Architecture

## Machines

### Core Node
This node holds the storage, acting as a NAS to the network and runs the memory intensive tasks
It has affinity with services that are RAM heavy
- i7-4790k
- 42GB RAM DDR3
- 256GB Management SSD
- 2TB HDD Storage
- OS: Proxmox
    - Core VM - Debian Bookworm
        - Network Infra (NetBird, Traefik, Adguard, Authelia, DDNS-Updater)
        - ArrStack (Sonarr, Radarr, Prowlarr, qBitTorrent, Bazarr)
        - Immich Server
        - Monitoring Stack
        - NAS
    - Lab VMs

### Processing Node
This is a processing node which contains a better iGPU and faster CPU
It has affinity with services that have HW Acceleration
- i5-8700T
- 16GB RAM DDR4
- 256GB Management M.2 SSD
- OS: Proxmox
    - Jellyfin
    - Paperless NGX
    - Immich AI Worker
    - Dashboard

## Technologies
- Ansible for Proxmox Initial Setup
- OpenTofu to create VMs and LXCs in Proxmox
- Ansible for service deployment

# Setup 
- Install Proxmox on the clusters
- Create a key pair in ~/.ssh/homelab on the remote machine
- Create a key pair `ssh-keygen -t ed25519 -f ~/.ssh/homelab -C "homelab"`
- Copy the key to the proxmox host `ssh-copy-id -i ~/.ssh/homelab.pub root@<proxmox-ip>`
- Run make tofu apply
- Add the hosts to `~/.ssh/config`
```
Host <proxmox-ip>
    HostName <proxmox-ip>
    User root
    IdentityFile ~/.ssh/homelab
    IdentitiesOnly yes

Host <vm-ip>
    HostName <vm-ip>
    User core
    IdentityFile ~/.ssh/homelab
    IdentitiesOnly yes
```
- Run make init-proxmox
- Run make init-debian

## Notes
This repo contains a vault using [SOPS](https://github.com/getsops/sops) and [Age](https://github.com/FiloSottile/age)
- To use ensure the private key is stored in `$XDG_CONFIG_HOME/sops/age/keys.txt`
- To edit the secrets use `sops edit <file>`


# TODO 
- Automatic Adguard Config
    - For now need to go to port 3000 over HTTP for initial setup
- Enable DNS over TLS Encryption on Adguard
- Core
    - Add Netbird
    - Add Sonarr, Radarr, Prowlarr, qBitTorrent, Bazarr
    - Add Loki, Graphana, Prometheus using OpenTolemetry
    - Add Immich Server
    - Samba Server
    - Open Printer CUPS
- Processing Node
    - Add Jellyfin
    - Add Paperless NgX
    - Add Immich AI Worker
