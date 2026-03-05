#
# * ----------- * Compartment Outputs * ----------- * 
#
output "compartment_id" {
  value       = oci_identity_compartment.idtestcompartment.id
  description = "The OCID of the new compartment."
}

output "compartment_name" {
  value       = oci_identity_compartment.idtestcompartment.name
  description = "The name of the new compartment."
}

