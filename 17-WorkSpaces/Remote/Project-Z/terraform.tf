terraform {
  required_version = ">= 1.9"

  required_providers {
    google = ">= 6.4.0 ,<= 6.6.0"
  }

  backend "gcs" {
    bucket      = "terraform-demo-ericsson-16oct2024"
    prefix      = "terraform/project-Z/tfstate"
    credentials = "/root/.gcp-account.json"
  }



}
