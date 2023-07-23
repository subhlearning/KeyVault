terraform {
  required_providers {
    azurerm = {
      source  = "registry.terraform.io/hashicorp/azurerm"
      version = "~> 3.58.0"
    }
    random = {
      source  = "registry.terraform.io/hashicorp/random"
      version = "~> 3.5.1"
    }
    tls ={
      source  = "registry.terraform.io/hashicorp/tls"
      version = "~> 4.0.4"
    }
  }
}

provider "azurerm" {
  features {
     key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}
