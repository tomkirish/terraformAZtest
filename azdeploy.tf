# Configure the Azure Provider
provider "azurerm" {}

# Create a resource group
resource "azurerm_resource_group" "network" {
  name     = "production"
  location = "West US"
}

#New Line
#Another

