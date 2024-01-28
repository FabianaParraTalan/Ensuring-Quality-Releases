resource "azurerm_network_interface" "test_nic" {
  name                = "${var.application_type}-${var.resource_type}-nic"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"
  ip_configuration {
    name                          = "internal"
    subnet_id                     = "${var.subnet_id}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${var.public_ip_address_id}"
  }
}

resource "azurerm_linux_virtual_machine" "test_vm" {
  name                = "${var.application_type}-VM"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"
  size                = "Standard_DS2_v2"
  admin_username      = "adminuser"
  network_interface_ids = [azurerm_network_interface.test_nic.id]
  source_image_id       = "/subscriptions/a4b11da3-2642-4ae2-b8e0-ba40545a13d6/resourceGroups/Azuredevops/providers/Microsoft.Compute/images/myPackerImage"
  admin_ssh_key {
    username   = "adminuser"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDqzp1GmizRRP6C3/VXYGzWpcb/XHQQ8LTSYG68jOZIR7qnytn/NePvi1tOjyL44EdwTzIAhL4O3chz7k46tDgRTbfz6/rwRxIgc4i74HA7AJd1ogL2uzJBr9leme4466xgmV2yrFy++w6Nq4xO4O593Bd+VLoOxHQKhz9qwpKNH+MCQpH9+aHxtqdpw47R37XnZwKrZTUC4PHwYBiqTXmnz7a1O6Xfd6oGmOtQf1M/Dl1sVNx0m71bEf7u77574WZgZjV9TSIzLvDJdXyb2aItlM4r2Nfe1YfcD/A0bBcB4M/D6U9L8mf9LrqjakFsVQzzG788K7VsVCv7/bEno5FBjMpH7PV8/SX6zQLCHqNgLl1uLkBwvGmZsfYbPPBhyk48XdL0TODWX4cj11A0HBlgqlieHuwFWTbHWO2L8Yl5TnytCEnEUFMdXgqwvLq1qR+59eRFYpz/XAaFNp/+67A+3Wn+WBBXdeNVnAlfvscHH37DObw0G93jbk3HaekMH5U= odl_user@SandboxHost-638420397593009346"
  }
  os_disk {
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
/*   source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  } */
}
