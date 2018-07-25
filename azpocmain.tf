# Main tf configuration file. Variable file name = azpocvar.tf.
# Configure the Azure Provider
provider "azurerm" {
  Subscription_id = "${var.Subscription_id}"
  Client_id       = "${var.Client_id}"
  Client_Secret   = "${var.Client_Secret}"
  Tenant_id       = "${var.Tenant_id}"
}

# Create a resource group
resource "azurerm_resource_group" "network" {
  name     = "${var.resource_group_name}"
  location = "${var.region}"
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
