resource "tfe_team" "k8op_agents" {
  name         = "k8sop-agents"
  organization = var.tf_organization_name

  organization_access {
    manage_agent_pools = true
    read_workspaces    = true # Operator v2.9.0 needs this permission to get workspace settings
  }
}

resource "tfe_team_token" "k8op_agents" {
  team_id = tfe_team.k8op_agents.id
}