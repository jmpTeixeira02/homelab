locals {
  datacenters = {
    for k, n in var.nodes : var.clusters[n.cluster].datacenter => var.clusters[n.cluster]...
  }
}

resource "proxmox_virtual_environment_download_file" "this" {
  for_each  = local.datacenters

  content_type            = "iso"
  datastore_id            = "local"
  node_name = each.key
  url                     = "https://cloud.debian.org/images/cloud/trixie/latest/debian-13-genericcloud-amd64.qcow2"
  file_name    = "debian-13-genericcloud-amd64.img"
}
