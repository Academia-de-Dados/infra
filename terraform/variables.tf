variable "environment" {
  type        = string
  description = "Enviroment"
  default     = "Development"
}

variable "resource_group" {
  type = object({
    name     = string
    location = string
  })
  description = "Resource group configurations"
  default = {
    name     = "academia-de-dados"
    location = "West Europe"
  }
}

variable "cluster" {
  type = object({
    name       = string
    node_name  = string
    node_count = number
    vm_size    = string
    dns_prefix = string
  })
  description = "Cluster configurations"
  default = {
    name       = "academia-de-dados"
    node_name  = "default"
    node_count = 2
    vm_size    = "Standard_D2_v2"
    dns_prefix = "academiadedados"
  }
}
