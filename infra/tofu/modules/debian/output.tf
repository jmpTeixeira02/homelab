resource "local_file" "this" {
  content = templatefile("${path.module}/output.tpl", {
    nodes = { for k, n in var.nodes : k => {
      ip      = n.ip
      cluster = n.cluster
      cluster_ip = var.clusters_access[n.cluster].ip
    }}
  })
  filename = "${path.module}/../../../ansible/inventory/generated/debian.yml"
}
