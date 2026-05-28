output "Resource_Group_Name" {
  value = azurerm_resource_group.rg_project.name
}
output "Resource_Group_Location" {
    value = azurerm_resource_group.rg_project.location
}
output "Linux_Virtual_Machine" {
    value = azurerm_linux_virtual_machine.web_vm.name
}
output "virtual_network_name" {
    value = azurerm_virtual_network.vnetwork.name
}
output "Linux_Virtual_Machine_IP" {
    value = azurerm_network_interface.lan_card.private_ip_addresses
}
output "public_ip_address" {
  value = azurerm_public_ip.public_ip.ip_address
}