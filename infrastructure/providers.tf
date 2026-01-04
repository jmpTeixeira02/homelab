terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "3.0.2-rc07"
    }
  }
}

provider "proxmox" {
  pm_tls_insecure = true # By default Proxmox Virtual Environment uses self-signed certificates.
  pm_user = var.pm_user
  pm_password = var.pm_password
  pm_api_url = var.pm_api_url
}
