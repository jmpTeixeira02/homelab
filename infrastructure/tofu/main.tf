module "talos" {
  source = "./talos"

  providers = {
    proxmox = proxmox
  }

  cluster = var.talos_cluster_config
  nodes   = var.talos_nodes
}
