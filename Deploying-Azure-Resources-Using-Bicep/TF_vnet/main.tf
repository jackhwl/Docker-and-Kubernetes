#build azure resource group
resource "azurerm_resource_group" "main" {
  location = var.resource_group_location
  name     = var.resource_group_name
}

resource "azurerm_virtual_network" "mainnetwork" {
  name                = var.vnet_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  address_space       = ["10.0.0.0/16"]
}

#build devsubnet and link to mainnetwork virtual network
resource "azurerm_subnet" "devsubnet" {
  name                 = "dev-subnet"
  resource_group_name  = azurerm_resource_group.main.name
  address_prefixes     = ["10.0.1.0/24"]
  virtual_network_name = azurerm_virtual_network.mainnetwork.name
}

#build testsubnet and link to mainnetwork virtual network
resource "azurerm_subnet" "testsubnet" {
  name                 = "test-subnet"
  resource_group_name  = azurerm_resource_group.main.name
  address_prefixes     = ["10.0.2.0/24"]
  virtual_network_name = azurerm_virtual_network.mainnetwork.name
}