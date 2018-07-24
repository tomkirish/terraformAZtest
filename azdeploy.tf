# Configure the Azure Provider
provider "azurerm" {
  Subscription_id = "9e760693-21d4-4276-9fbb-dd773d120d61"
  Client_id       = "azure-cli-2018-07-24-17-05-28"
  Client_Secret   = "143b23fd-0c9c-401c-af8e-476a11dccde3"
  Tenant_id       = "23fbe4e5-5a13-46db-a8f6-8fa9bb97fac0"
}

# Create a resource group
resource "azurerm_resource_group" "network" {
  name     = "RG_Statera"
  location = "West US"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "network" {
  name                = "Statera-production-network"
  address_space       = ["10.0.0.0/16"]
  location            = "${azurerm_resource_group.network.location}"
  resource_group_name = "${azurerm_resource_group.network.name}"

  subnet {
    name           = "Statera-subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "Statera-subnet2"
    address_prefix = "10.0.2.0/24"
  }

  subnet {
    name           = "Statera-subnet3"
    address_prefix = "10.0.3.0/24"
  }
}
