resource "azurerm_network_interface" "dummy-nic-ip-reservation" {
  name                = "${var.nic_name}"
  location            = "${var.location}"
  resource_group_name = "${var.rg_name}"

  ip_configuration {
    name                          = "private-.${var.nic_name}"
    subnet_id                     = "${data.azurerm_subnet.subnetdata.id}"
    private_ip_address_allocation = "Static"
    private_ip_address            = "${var.private_ip_address}"
  }

  tags = {
    BusinessApplication = "${var.biz_application}"
    ApplicationService = "${var.application_service}"
    CostCenter = "${var.costcester}"
    CreatedOnDate = "${var.creationdate}"
  }
}

data "azurerm_subnet" "subnetdata" {
  name                 = "${var.subnet_name.rendered}"
  virtual_network_name = "${var.vnet_name.rendered}"
  resource_group_name  = "${var.rg_name}"
}