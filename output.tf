output "public_ip" {
  value = azurerm_public_ip.this_publicip.ip_address
}