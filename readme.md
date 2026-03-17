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
    - OpenMediaVault VM
    - Services VM - Debian Bookworm
        - Network Infra (NetBird, Traefik, Pi-Hole)
        - ArrStack (Sonarr, Radarr, Prowlarr, qBitTorrent, Bazarr)
        - Immich Server
        - Monitoring Stack
    - Lab VMs

### Processing Node
This is a processing node which contains a better iGPU and faster CPU
It has affinity with services that have HW Acceleration
- i5-8700T
- 16GB RAM DDR3
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
