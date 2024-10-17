terraform {
  required_version = ">= 1.9"

  required_providers {
    google = ">= 6.4.0 ,<= 6.6.0"
  }

  backend "local" {
    path = "/tmp/terraform/local-backend/remote-state/demo/terraform.tfstate"
  }


}