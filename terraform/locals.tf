
locals {
  k8s_host = azurerm_kubernetes_cluster.exam.kube_config.0.host
  k8s_client_certificate = base64decode(azurerm_kubernetes_cluster.exam.kube_config.0.client_certificate)
  k8s_client_key = base64decode(azurerm_kubernetes_cluster.exam.kube_config.0.client_key)
  k8s_cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.exam.kube_config.0.cluster_ca_certificate)
}
