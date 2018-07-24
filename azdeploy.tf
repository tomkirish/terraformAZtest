# Configure the Azure Provider
provider "azurerm" {
  Subscription_id = "88e4f36d-c2df-4e9f-982e-79a3a64e4882"
  Client_id       = "azure-cli-2018-07-24-17-05-28"
  Client_Secret   = "143b23fd-0c9c-401c-af8e-476a11dccde3"
  Tenant_id       = "23fbe4e5-5a13-46db-a8f6-8fa9bb97fac0"
}

# Create a resource group
resource "RG_Statera_Test" "network" {
  name     = "production"
  location = "West US"
}

# Create a virtual network within the resource group
resource "Statera_virtual_network" "network" {
  name                = "Statera-production-network"
  address_space       = ["10.0.0.0/16"]
  location            = "${RG_Statera_Test.network.location}"
  resource_group_name = "${RG_Statera_Test.network.name}"

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
