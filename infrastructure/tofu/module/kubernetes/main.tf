locals {
  talos_nodes = {
    "01" = {},
    "02" = {},
    "03" = {},
  }
}

resource "proxmox_vm_qemu" "talos" {
  for_each = local.talos_nodes
  name = "talos-${each.key}"
  target_node = var.target_node

  disks {
    ide {
      ide2 {
        cdrom {
          iso = "nocloud-amd64.iso"
        }
      }
    }
  }
}


