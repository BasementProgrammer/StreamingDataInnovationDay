#
# * ----------- * Networking outputs * ----------- * 
#
output "vcn_id"            { 
  value = oci_core_vcn.main_vcn.id
  }
output "public_subnet_id"  { 
  value = oci_core_subnet.public_subnet.id
  }
output "internet_gateway_id" {
  value = oci_core_internet_gateway.igw.id
}
output "service_gateway_id" {
  value = oci_core_service_gateway.sgw.id
}

output "network_security_group_id" {
  value = oci_core_network_security_group.app_nsg.id
}
