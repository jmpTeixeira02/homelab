module "debian" {
  source = "./modules/debian"

  providers = {
    proxmox = proxmox
  }

  nodes    = { for k, n in var.nodes : k => n if n.module == "debian" }
  clusters = var.clusters
}
