resource "github_repository" "this" {
  name               = "tf-agent-auto-scale-test"
  description        = "Repo with basic resources to test TF Operator auto scaling"
  auto_init          = true # produces an initial commit
  gitignore_template = "Terraform"
  visibility         = "private"
}

resource "github_repository_file" "main_tf" {
  repository          = github_repository.this.name
  branch              = local.github_branch
  commit_message      = "feat: sleep config"
  overwrite_on_create = true
  file                = "main.tf"
  content             = file("./tf-github-bootstrap/main.tf")
}
