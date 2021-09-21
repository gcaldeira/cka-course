resource "azurerm_network_interface" "k8s" {
  count = var.nodes
  name                = "k8s-node${count.index+1}-nic"
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.k8s.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "k8s" {
  count = var.nodes
  name                = "k8s-node${count.index+1}"
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  size                = var.node_size
  admin_username      = var.admin_user
  network_interface_ids = [
    azurerm_network_interface.k8s[count.index].id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}