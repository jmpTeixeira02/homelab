module "debian" {
  source = "./modules/debian"

  providers = {
    proxmox = proxmox.core
  }

  nodes    = { for k, n in var.nodes : k => n if n.module == "debian" }
  clusters = var.clusters
  clusters_access = local.clusters_access
}
