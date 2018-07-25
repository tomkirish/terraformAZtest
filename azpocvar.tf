# Configure variables for azpocmain.tf

variable "Client" {
  description = "Please provide the name of the client."
  default = "STATPOC"
}

# Configure the Azure Provider
variable "Subscription_id" {
  description = "This is the Azure subscription to use. This is mapped to Azure appid."
}
variable "Client_id" {
  description = "The client id. This is mapped to the Azure name field which includes the http address."
}
variable "Client_Secret" {
  description = "The password for the account being used. This is mapped to the Azure password field."
}
variable "Tenant_id" {
  description = "The tenant id. This is mapped to the Azure tenant field"
}

# Create a resource group
variable "resource_group_name" {
  description = "The name of the resource group"
  default = "${join("RG_POC", var.Client)}"
}
variable "region" {
  description = "Please provide the name of the region."
  default = "West US"
}

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