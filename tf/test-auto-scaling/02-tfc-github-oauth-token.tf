resource "tfe_oauth_client" "github" {
  organization        = data.terraform_remote_state.hcp_team_token.outputs.tf_organization_name
  organization_scoped = true
  api_url             = "https://api.github.com"
  http_url            = "https://github.com"
  oauth_token         = var.github_token
  service_provider    = "github"
}