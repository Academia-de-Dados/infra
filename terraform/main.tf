terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "exam" {
  name     = var.resource_group.name
  location = var.resource_group.location
}

provider "kubernetes" {
  host                   = local.k8s_host
  client_certificate     = local.k8s_client_certificate
  client_key             = local.k8s_client_key
  cluster_ca_certificate = local.k8s_cluster_ca_certificate
}

resource "local_file" "kube_config" {
  content  = azurerm_kubernetes_cluster.exam.kube_config_raw
  filename = "kubeconfig.yml"
}
