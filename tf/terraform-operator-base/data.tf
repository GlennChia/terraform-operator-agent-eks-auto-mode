data "terraform_remote_state" "aws_eks" {
  backend = "local"

  config = {
    path = "../aws-eks/terraform.tfstate"
  }
}
