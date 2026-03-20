variable "clusters" {
  description = "Cluster configuration"
  type = map(object({
    gateway         = string
    subnet_mask     = optional(string, "24")
    datacenter = string
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
    module       = string
  }))
}

