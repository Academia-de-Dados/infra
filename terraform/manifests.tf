# resource "kubernetes_manifest" "namespace" {
#   manifest = yamldecode(file("../manifests/namespace.yml"))
# }
#
# resource "kubernetes_manifest" "configmap" {
#   manifest = yamldecode(file("../manifests/configmap.yml"))
# }
#
# resource "kubernetes_manifest" "mongodb_volume" {
#   manifest = yamldecode(file("../manifests/mongo/volume.yml"))
# }
#
# resource "kubernetes_manifest" "mongodb_deployment" {
#   manifest = yamldecode(file("../manifests/mongo/deployment.yml"))
# }
#
# resource "kubernetes_manifest" "mongodb_service" {
#   manifest = yamldecode(file("../manifests/mongo/service.yml"))
# }
#
# resource "kubernetes_manifest" "crawler_cronjob" {
#   manifest = yamldecode(file("../manifests/crawler/cronjob.yml"))
# }
