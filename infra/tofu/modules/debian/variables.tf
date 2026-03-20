variable "clusters" {
  description = "Cluster configuration"
  type = map(object({
    gateway         = string
    subnet_mask     = optional(string, "24")
    datacenter = string
  }))
}

variable "clusters_access" {
  sensitive = true
  description = "Cluster access configuration"
  type = map(object({
    ip = string
    proxmox_user = string
    proxmox_password = string
    proxmox_endpoint = string
    proxmox_insecure = optional(bool, false)

    node_user = string
    node_password = optional(string)
    node_keys     = optional(list(string), [])
  }))
}

variable "nodes" {
  description = "Configuration for cluster nodes"
  type = map(object({
    vm_id  = number
    datastore_id = optional(string, "local-lvm")
    ip            = string
    cpu           = number
    ram = number
    cluster = string # references cluster
  }))
}
