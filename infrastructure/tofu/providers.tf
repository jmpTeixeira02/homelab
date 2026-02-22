terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.95.1-rc1"
    }
  }
}

provider "proxmox" {
  endpoint = var.proxmox.endpoint
  username = var.proxmox.username
  password = var.proxmox_password
  insecure = var.proxmox.insecure
}
