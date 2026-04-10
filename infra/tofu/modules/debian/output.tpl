debian:
    hosts:
%{ for name, node in nodes ~}
        ${name}:
          ansible_host: ${node.ip}
          cluster: ${node.cluster}
          ansible_ssh_common_args: '-J root@${node.cluster_ip}'
%{ endfor ~}
