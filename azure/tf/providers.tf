terraform {
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

# Need to run az login for this to work as expected
# TODO: Figure out how to loging with service principal instead
provider "databricks" {
  # alias      = "adb-account"
  host       = "http://accounts.cloud.databricks.com"
  
  client_id     = var.databricks_client_id
  client_secret = var.databricks_client_secret
  account_id    = var.databricks_account_id
}

# provider "databricks" {
#   alias                       = "adb-workspace"
#   host                        = azurerm_databricks_workspace.this.workspace_url
#   azure_workspace_resource_id = azurerm_databricks_workspace.this.id
#   azure_client_id             = var.client_id
#   azure_client_secret         = var.client_secret
#   azure_tenant_id             = var.tenant_id
# }

