nodes = {
    "debian-core" = {
        vm_id = 100
        ip = "192.168.1.11"
        cpu = 4
        ram = 2048
        cluster = "core"
        module = "debian"
    }
}

clusters = {
    "core" = {
        gateway = "192.168.1.254"
        datacenter = "pve"
    }
}
