resource "azurerm_resource_group" "rg_project" {
    name = var.rg_name
    location = var.rg_location
    tags = {
      environment = var.rg_env
    }
  }
resource "azurerm_virtual_network" "vnetwork" {
    name = var.rg_network_name
    location = azurerm_resource_group.rg_project.location
    resource_group_name = azurerm_resource_group.rg_project.name
    address_space = ["10.0.0.0/24"]
}
resource "azurerm_subnet" "sn" {
    name = var.rg_subnet_name
    resource_group_name = azurerm_resource_group.rg_project.name
    virtual_network_name = azurerm_virtual_network.vnetwork.name
    address_prefixes = ["10.0.0.0/28"]
}
resource "azurerm_public_ip" "public_ip" {
    name = "santech-public-ip"
    resource_group_name = azurerm_resource_group.rg_project.name
    location = azurerm_resource_group.rg_project.location
    allocation_method = "Static"
    sku = "Standard"
    tags = {
        environment = var.rg_env
    } 
}
resource "azurerm_network_security_group" "nsg" {
    name = "santech_nsg"
    resource_group_name = azurerm_resource_group.rg_project.name
    location = azurerm_resource_group.rg_project.location
    dynamic "security_rule" {
    for_each = local.santech_nsg
        content {
          name = security_rule.key
          destination_port_range = security_rule.value.destination_port_range
          priority = security_rule.value.priority
          description = security_rule.value.description
          access = "Allow"
          direction = "Inbound"
          protocol = "Tcp"
          source_port_range = "*"
          source_address_prefix = "*"
          destination_address_prefix = "*"
        }
   }
}
resource "azurerm_network_interface" "lan_card" {
    name = "santech_nic"
    resource_group_name = azurerm_resource_group.rg_project.name
    location = azurerm_resource_group.rg_project.location
    ip_configuration {
      name = "web_vm_ip"
      subnet_id = azurerm_subnet.sn.id
      private_ip_address_allocation = "Static"
      private_ip_address = "10.0.0.4"
      public_ip_address_id = azurerm_public_ip.public_ip.id
    }
}
resource "azurerm_network_interface_security_group_association" "nic_nsg" {
  network_interface_id      = azurerm_network_interface.lan_card.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
resource "azurerm_linux_virtual_machine" "web_vm" {
    name = "linux-vm"
    computer_name = "linux-vm"
    resource_group_name = azurerm_resource_group.rg_project.name
    location = azurerm_resource_group.rg_project.location
    size = "Standard_B2ats_v2"
    admin_username = "sanjeev"
    admin_password = var.vm_password
    disable_password_authentication = false
    network_interface_ids = [azurerm_network_interface.lan_card.id]
    os_disk {
            name = "linux_vm_os_disk"    
            caching = "ReadWrite"
            storage_account_type = "Standard_LRS"
            disk_size_gb = 30
            }
    source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
    }
}