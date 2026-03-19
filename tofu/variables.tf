variable "proxmox" {
  description = "Proxmox provider configuration"
  type = object({
    cluster_name = string
    endpoint     = string
    insecure     = bool
    username     = string
  })
}

variable "proxmox_password" {
  description = "Password for Proxmox user"
  type        = string
  sensitive   = true
}

variable "clusters" {
  description = "Cluster configuration"
  type = map(object({
    gateway         = string
    subnet_mask     = optional(string, "24")
    datacenter = string # Proxmox Datacenter
    user        = object({
      username = string
      password = optional(string)
      keys     = optional(list(string), [])
    })
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
