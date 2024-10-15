// Provider Block for Google
provider "google" {
  credentials = file("/root/.gcp-account.json")
  project     = "cognixia-1607499012052"
  region      = "us-central1"
}

// Provider Block for Azure
provider "azurerm" {
  features {}
}

// Provider Block for AWS
provider "aws" {
  region = "us-east-2"
}