variable "number_of_test_workspaces" {
  description = "Number of test workspaces to create"
  type        = number
  default     = 50
}

variable "github_token" {
  description = "A GitHub OAuth / Personal Access Token."
  type        = string
  sensitive   = true
}