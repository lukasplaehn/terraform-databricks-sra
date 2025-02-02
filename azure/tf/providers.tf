terraform {
  required_providers {
    azurerm = {
      source  = "registry.terraform.io/hashicorp/azurerm"
      version = "4.16.0" # Developed when at Latest Version == 4.16.0
    }
    databricks = {
      source  = "databricks/databricks"
      version = ">=1.52.0"
    }
  }
  cloud {
    organization = "Lukas-Plaehn"
    workspaces {
      name = "databricks-sra"
    }
    hostname = "app.terraform.io"
    token = var.terraform_token
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

provider "databricks" {
  host       = "https://accounts.azuredatabricks.net"
  account_id = var.databricks_account_id
  auth_type  = "azure-cli"
}
