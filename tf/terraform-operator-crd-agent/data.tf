data "terraform_remote_state" "aws_eks" {
  backend = "local"

  config = {
    path = "../aws-eks/terraform.tfstate"
  }
}

data "terraform_remote_state" "hcp_team_token" {
  backend = "local"

  config = {
    path = "../hcp-team-token/terraform.tfstate"
  }
}

data "terraform_remote_state" "terraform_operator_base" {
  backend = "local"

  config = {
    path = "../terraform-operator-base/terraform.tfstate"
  }
}