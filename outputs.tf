output primary_network_interface_id {
value = ibm_is_instance.instance.primary_network_interface[0].id
}

output ips {
  value = ibm_is_instance.instance.primary_network_interface[*].id
  }
