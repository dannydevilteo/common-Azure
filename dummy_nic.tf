resource "azurerm_network_interface" "dummy-nic-ip-reservation" {
  name                = "${var.nic_name}"
  location            = "${var.location}"
  resource_group_name = "${var.rg_name}"

  ip_configuration {
    name                          = "private-.${var.nic_name}"
    subnet_id                     = "${data.azurerm_subnet.example.id}"
    private_ip_address_allocation = "${var.private_ip_address_allocation}"
    private_ip_address            = "${var.private_ip_address}"
  }

  tags = {
    BusinessApplication = "${var.biz_application}"
    ApplicationService = "${var.application_service}"
    CostCenter = "${var.costcester}"
    CreatedOnDate = "${var.creationdate}"
  }
}

data "azurerm_subnet" "example" {
  name                 = "subnet-A"
  virtual_network_name = "common-vnet"
  resource_group_name  = "${var.rg_name}"
}