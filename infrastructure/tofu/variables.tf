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

variable "talos_cluster_config" {
  description = "Talos cluster configuration"
  type = object({
    name                         = string
    gateway                      = string
    talos_version = string
    proxmox_cluster              = string
  })
}

variable "talos_nodes" {
  description = "Talos cluster node configuration"
  type = map(
    object({
      host_node     = string
      machine_type  = string
      vm_id = number
      ip            = string
      cpu           = number
      ram = number
      igpu          = optional(bool, false)
    })
  )
  validation {
    // @formatter:off
    condition     = length([for n in var.talos_nodes : n if contains(["control", "worker"], n.machine_type)]) == length(var.talos_nodes)
    error_message = "Node machine_type must be either 'control' or 'worker'."
    // @formatter:on
  }
}
