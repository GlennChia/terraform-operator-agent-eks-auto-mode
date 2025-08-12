resource "kubernetes_secret" "tfc_owner_team_token" {
  metadata {
    name      = "tfc-owner"
    namespace = data.terraform_remote_state.terraform_operator_base.outputs.kubernetes_crd_namespace_name
  }

  data = {
    token = data.terraform_remote_state.hcp_team_token.outputs.tf_team_k8op_agents_token
  }
}

resource "kubernetes_manifest" "agent_pool" {
  manifest = {
    apiVersion = "app.terraform.io/v1alpha2"
    kind       = "AgentPool"

    metadata = {
      name      = var.agent_pool_name
      namespace = data.terraform_remote_state.terraform_operator_base.outputs.kubernetes_crd_namespace_name
    }

    spec = {
      organization = data.terraform_remote_state.hcp_team_token.outputs.tf_organization_name
      token = {
        secretKeyRef = {
          name = kubernetes_secret.tfc_owner_team_token.metadata[0].name
          key  = "token"
        }
      }
      deletionPolicy = "destroy"
      name           = var.agent_pool_name
      agentTokens = [
        {
          name = "pool-demo-token"
        }
      ]
      agentDeployment = {
        replicas = 1
        spec = {
          containers = [
            {
              name  = "tfc-agent"
              image = "hashicorp/tfc-agent:1.23.1"
            }
          ]
        }
      }
      autoscaling = {
        minReplicas = 5
        maxReplicas = 50
      }
    }
  }

  field_manager {
    name            = "manager"
    force_conflicts = true
  }
}