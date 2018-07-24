# Configure the Azure Provider
provider "azurerm" {}

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
