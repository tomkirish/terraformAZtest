# Configure variables for azpocmain.tf
# Configure the Azure Provider
provider "azurerm" {
  Subscription_id = "9e"
  Client_id       = "az"
  Client_Secret   = "14"
  Tenant_id       = "23"
}

# Create a resource group
resource "azurerm_resource_group" "network" {
  name     = "RG_POCClient"
  location = "West US"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "network" {
  name                = "Client-POC-network"
  address_space       = ["10.0.0.0/16"]
  location            = "${azurerm_resource_group.network.location}"
  resource_group_name = "${azurerm_resource_group.network.name}"

  subnet {
    name           = "SNWEB-POCClient"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "SNAPP-POCClient"
    address_prefix = "10.0.2.0/24"
  }

  subnet {
    name           = "SNDB-POCClient"
    address_prefix = "10.0.3.0/24"
  }
}