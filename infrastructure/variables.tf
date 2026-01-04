variable "pm_api_url" {
  type        = string
  description = "The Proxmox API URL (e.g., https://192.168.1.10:8006/api2/json)"
}

variable "pm_user" {
  type        = string
  description = "Proxmox username (e.g., terraform-prov@pve)"
}

variable "pm_password" {
  type        = string
  description = "Proxmox password"
  sensitive   = true
}
