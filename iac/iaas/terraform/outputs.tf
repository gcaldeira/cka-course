output "master_nodes_ips" {
  value = [azurerm_public_ip.master.*.ip_address]
}

output "worker_nodes_ips" {
  value = [azurerm_public_ip.worker.*.ip_address]
}