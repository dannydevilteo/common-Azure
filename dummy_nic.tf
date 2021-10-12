resource "azurerm_network_interface" "dummy-nic-ip-reservation" {
  name                = var.nic_name
  location            = var.sea
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = format("private-", var.nic_name)
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation
  }
}