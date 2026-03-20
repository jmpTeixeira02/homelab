terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.95.1-rc1"
    }
    sops = {
      source  = "carlpett/sops"
      version = "~> 1.0"
    }
  }
}

provider "proxmox" {
  alias    = "core"
  endpoint = local.clusters_access["core"].proxmox_endpoint
  username = local.clusters_access["core"].proxmox_user
  password = local.clusters_access["core"].proxmox_password
  insecure = local.clusters_access["core"].proxmox_insecure
}

provider "proxmox" {
  alias    = "process"
  endpoint = local.clusters_access["process"].proxmox_endpoint
  username = local.clusters_access["process"].proxmox_user
  password = local.clusters_access["process"].proxmox_password
  insecure = local.clusters_access["process"].proxmox_insecure
}
