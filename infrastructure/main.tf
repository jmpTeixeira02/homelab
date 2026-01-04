module "talos_cluster" {
  source = "./module/kubernetes/"
  target_node = "proxmox"
}
