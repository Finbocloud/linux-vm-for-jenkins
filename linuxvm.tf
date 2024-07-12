
resource "azurerm_linux_virtual_machine" "this_linux_vm" {
  name                = "solar"
  resource_group_name = azurerm_resource_group.this_rg.name
  location            = azurerm_resource_group.this_rg.location
  size                = "Standard_F2"
  admin_username      = "Eka"
  network_interface_ids = [
    azurerm_network_interface.this_vm_nic.id,
  ]

  admin_ssh_key {
    username   = "Eka"
    public_key = file("~/.ssh/azure_terraform_key.pub")
     #ssh-keygen -t rsa -b 4096 -f ~/.ssh/azure_terraform_key -C "vitaliseaka@ymail.com"
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  custom_data = filebase64("${path.module}/cloud-init.yml")
}
#ssh -i ~/.ssh/azure_terraform_key Eka@51.145.8.84


