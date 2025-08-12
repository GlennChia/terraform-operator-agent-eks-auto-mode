output "kubernetes_crd_namespace_name" {
  description = "The name of the K8s CRD namespace"
  value       = kubernetes_namespace.crd.metadata[0].name
}