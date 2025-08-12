data "terraform_remote_state" "hcp_team_token" {
  backend = "local"

  config = {
    path = "../hcp-team-token/terraform.tfstate"
  }
}

data "terraform_remote_state" "terraform_operator_agent" {
  backend = "local"

  config = {
    path = "../terraform-operator-crd-agent/terraform.tfstate"
  }
}

data "tfe_agent_pool" "eks_agent_pool" {
  name         = data.terraform_remote_state.terraform_operator_agent.outputs.agent_pool_name
  organization = data.terraform_remote_state.hcp_team_token.outputs.tf_organization_name
}