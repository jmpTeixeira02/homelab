resource "proxmox_virtual_environment_vm" "this" {
  for_each = var.nodes

  name = "talos-${each.key}"
  node_name = each.value.host_node
  description = each.value.machine_type == "control" ? "Talos Controller" : "Talos Worker"
  tags        = each.value.machine_type == "control" ? ["k8s", "control-plane"] : ["k8s", "worker"]
  on_boot     = true
  bios          = "seabios"
  vm_id       = each.value.vm_id

  cpu {
    cores = each.value.cpu
    type  = "host"
  }

  memory  {
    dedicated = each.value.ram
  }

  agent {
    enabled = true
  }

  network_device {
    bridge = "vmbr0"
  } 

  disk {
    datastore_id = each.value.datastore_id
    file_id = proxmox_virtual_environment_download_file.this.id
    interface    = "virtio0"
    discard      = "on"
    size         = 20
    file_format  = "raw"
  }


  initialization {
    datastore_id = each.value.datastore_id
    ip_config {
      ipv4 {
        address = "${each.value.ip}/${var.cluster.subnet_mask}"
        gateway = var.cluster.gateway
      }
    }  
  }

   dynamic "hostpci" {
    for_each = each.value.igpu ? [1] : []
    content {
      # Passthrough iGPU
      device  = "hostpci0"
      mapping = "iGPU"
      pcie    = true
      rombar  = true
      xvga    = false
    }
  }
}

