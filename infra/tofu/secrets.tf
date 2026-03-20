data "sops_file" "secrets" {
  source_file = "../../secrets.json"
}

locals {
  clusters_access = {
    for k, v in jsondecode(data.sops_file.secrets.raw)["clusters_access"] : k => {
      ip = tostring(v["ip"])
      proxmox_user     = tostring(v["proxmox_user"])
      proxmox_password = tostring(v["proxmox_password"])
      proxmox_endpoint = tostring(v["proxmox_endpoint"])
      proxmox_insecure = tobool(try(v["proxmox_insecure"], false))
      node_user        = tostring(v["node_user"])
      node_password    = tostring(try(v["node_password"], ""))
      node_keys        = tolist(try(v["node_keys"], []))
    }
  }
}
