resource "azurerm_kubernetes_cluster" "exam" {
  name                = var.cluster.name
  location            = azurerm_resource_group.exam.location
  resource_group_name = azurerm_resource_group.exam.name
  dns_prefix          = var.cluster.dns_prefix

  default_node_pool {
    name       = var.cluster.node_name
    node_count = var.cluster.node_count
    vm_size    = var.cluster.vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = var.environment
  }
}
