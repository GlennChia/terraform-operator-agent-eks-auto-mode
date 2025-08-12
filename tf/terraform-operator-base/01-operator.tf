resource "kubernetes_namespace" "tfc_operator_system" {
  metadata {
    name = "tfc-operator-system"
  }
}

resource "kubernetes_namespace" "crd" {
  metadata {
    name = "crd"
  }
}

resource "helm_release" "operator" {
  name       = "demo"
  repository = "https://helm.releases.hashicorp.com"
  chart      = "hcp-terraform-operator"
  version    = "2.9.2"

  namespace        = kubernetes_namespace.tfc_operator_system.metadata[0].name
  create_namespace = true

  set = [
    {
      name  = "operator.watchedNamespaces"
      value = "{${kubernetes_namespace.crd.metadata[0].name}}"
    }
  ]
}