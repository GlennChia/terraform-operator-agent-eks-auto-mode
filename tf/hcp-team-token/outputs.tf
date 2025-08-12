output "tf_team_k8op_agents_token" {
  description = "The token to use manage agent pools"
  value       = nonsensitive(tfe_team_token.k8op_agents.token) # Marked nonsensitive for demo purposes - do not do this in a real environment
}

output "tf_organization_name" {
  description = "The TF Organization Name"
  value       = var.tf_organization_name
}