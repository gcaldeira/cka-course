resource "azurerm_public_ip" "master" {
  count               = var.master_nodes
  name                = "k8s-master-${count.index+1}-pip"
  resource_group_name = azurerm_resource_group.this.name
  location            = var.location
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "master" {
  count               = var.master_nodes
  name                = "k8s-master-${count.index+1}-nic"
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.k8s.id
    private_ip_address            = "10.0.64.10${count.index+1}"
    private_ip_address_allocation = "Static"
    public_ip_address_id          = azurerm_public_ip.master[count.index].id
  }
}

resource "azurerm_linux_virtual_machine" "master" {
  count = var.master_nodes
  name                = "k8s-master-${count.index+1}"
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  size                = var.master_node_size
  admin_username      = var.node_user
  network_interface_ids = [
    azurerm_network_interface.master[count.index].id,
  ]

  admin_ssh_key {
    username   = var.node_user
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

resource "azurerm_public_ip" "worker" {
  count               = var.worker_nodes
  name                = "k8s-worker-${count.index+1}-pip"
  resource_group_name = azurerm_resource_group.this.name
  location            = var.location
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "worker" {
  count = var.worker_nodes
  name                = "k8s-worker-${count.index+1}-nic"
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.k8s.id
    private_ip_address            = "10.0.64.20${count.index+1}"
    private_ip_address_allocation = "Static"
    public_ip_address_id          = azurerm_public_ip.worker[count.index].id
  }
}

resource "azurerm_linux_virtual_machine" "worker" {
  count = var.worker_nodes
  name                = "k8s-worker-${count.index+1}"
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  size                = var.worker_node_size
  admin_username      = var.node_user
  network_interface_ids = [
    azurerm_network_interface.worker[count.index].id,
  ]

  admin_ssh_key {
    username   = var.node_user
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