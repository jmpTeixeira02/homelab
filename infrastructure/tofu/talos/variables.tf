variable "cluster" {
  description = "Cluster configuration"
  type = object({
    name            = string
    gateway         = string
    subnet_mask                  = optional(string, "24")
    talos_version   = string
    proxmox_cluster = string
  })
}

variable "nodes" {
  description = "Configuration for cluster nodes"
  type = map(object({
    host_node     = string
    machine_type  = string
    vm_id  = number
    datastore_id = optional(string, "local-lvm")
    ip            = string
    cpu           = number
    ram = number
    igpu = optional(bool, false)
  }))
}
