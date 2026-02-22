resource "proxmox_virtual_environment_download_file" "this" {
  content_type            = "iso"
  datastore_id            = "local"
  node_name               = "proxmox"
  decompression_algorithm = "gz"
  overwrite               = false

  # Image contains QEMU, and Intel iGPU support
  url                     = "https://factory.talos.dev/image/95d432d6bb450a67e801a6ae77c96a67e38820b62ba4159ae7e997e1695207f7/v1.12.4/nocloud-amd64.raw.gz"
  file_name               = "talos-v1.12.4-nocloud-amd64.img"
}
