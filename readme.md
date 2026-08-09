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
- Ansible for Docker Services Setup
- OpenTofu to create Lab VMs
- Ansible for service deployment

# Setup 
- Install Debian on the Server
- Create a key pair `ssh-keygen -t ed25519 -f ~/.ssh/homelab -C "homelab"`
- Copy the key to the server user `ssh-copy-id -i ~/.ssh/homelab.pub user@<ip>`
- Run Ansible Setup Script on Server (might need to install git first)
    ```
    apt install -y git ansible make
    git clone https://www.github.com/jmpTeixeira02/homelab
    cd homelab && make setup
    ```
- Run make 

## Notes
This repo contains a vault using [SOPS](https://github.com/getsops/sops) and [Age](https://github.com/FiloSottile/age)
- To use ensure the private key is stored in `$XDG_CONFIG_HOME/sops/age/keys.txt`
- To edit the secrets use `sops edit <file>`


# TODO 
- Create Pre-Seed Script for Debian install
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
