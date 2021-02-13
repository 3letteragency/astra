output "flight_ip_addresses" {
  value = vultr_server.astra_node.*.main_ip
}
