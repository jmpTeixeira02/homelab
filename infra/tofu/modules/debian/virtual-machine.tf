locals {
  nodes = {
    for k, n in var.nodes : k => merge(n, {
      cluster = var.clusters[n.cluster]
      cluster_access = var.clusters_access[n.cluster]
    })
  }
}

resource "proxmox_virtual_environment_vm" "this" {
  for_each  = local.nodes
  name      = each.key
  node_name = each.value.cluster.datacenter
  vm_id     = each.value.vm_id

  cpu {
    cores = each.value.cpu
    type  = "host"
  }

  memory {
    dedicated = each.value.ram
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }


  disk {
    datastore_id = each.value.datastore_id
    file_id      = proxmox_virtual_environment_download_file.this[each.value.cluster.datacenter].id
    interface    = "virtio0"
    discard      = "on"
  }

  initialization {
    datastore_id = each.value.datastore_id
    user_account {
      username = each.value.cluster_access.node_user
      password = each.value.cluster_access.node_password
      keys     = each.value.cluster_access.node_keys
    }
    ip_config {
      ipv4 {
        address = "${each.value.ip}/${each.value.cluster.subnet_mask}"
        gateway = each.value.cluster.gateway
      }
    }
  }
}
