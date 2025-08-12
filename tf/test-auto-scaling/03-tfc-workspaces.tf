resource "tfe_project" "this" {
  organization = data.terraform_remote_state.hcp_team_token.outputs.tf_organization_name
  name         = "agent-test"
}

resource "tfe_workspace" "this" {
  depends_on = [github_repository_file.main_tf]

  for_each = { for i in range(1, var.number_of_test_workspaces + 1) : tostring(i) => i }

  name           = "example-${each.key}"
  organization   = data.terraform_remote_state.hcp_team_token.outputs.tf_organization_name
  queue_all_runs = false
  project_id     = tfe_project.this.id
  force_delete   = true

  vcs_repo {
    branch         = local.github_branch
    identifier     = github_repository.this.full_name
    oauth_token_id = tfe_oauth_client.github.oauth_token_id
  }
}

resource "tfe_workspace_settings" "agent" {
  for_each = tfe_workspace.this

  workspace_id   = each.value.id
  agent_pool_id  = data.tfe_agent_pool.eks_agent_pool.id
  execution_mode = "agent"
}

# As of Operator v2.9.2, must use workspace setting for the run to pick up
# https://github.com/hashicorp/hcp-terraform-operator/blob/main/internal/controller/agentpool_controller_autoscaling.go
resource "tfe_workspace_run" "this" {
  depends_on = [tfe_workspace_settings.agent]

  for_each = tfe_workspace.this

  workspace_id = each.value.id

  apply {
    manual_confirm    = false
    wait_for_run      = false
    retry_attempts    = 5
    retry_backoff_min = 5
  }

  # Comment out to not wait for destroy
  # destroy {
  #   manual_confirm    = false
  #   wait_for_run      = true
  #   retry_attempts    = 3
  #   retry_backoff_min = 10
  # }
}
