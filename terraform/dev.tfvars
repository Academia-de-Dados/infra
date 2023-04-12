environment = "Development"

resource_group = {
  name     = "academia-de-dados"
  location = "West Europe"
}


cluster = {
  name       = "academia-de-dados"
  node_name  = "default"
  node_count = 2
  vm_size    = "Standard_D2_v2"
  dns_prefix = "academiadedados"
}
