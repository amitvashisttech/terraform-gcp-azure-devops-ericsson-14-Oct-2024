terraform {
  required_version = ">= 1.9"

  required_providers {
    google = {
      version = ">= 6.4.0 ,<= 6.6.0"
    }

    aws = {
      version = ">= 5.60.0 ,<= 5.71.0"
    }

    azurerm = {
      version = ">= 4.4.0 ,<= 4.5.0"
    }
  }
}

 