terraform {
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.68"
    }
  }
}

provider "tfe" {
}
