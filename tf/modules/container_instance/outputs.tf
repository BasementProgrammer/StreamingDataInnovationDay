output "container_instance_id" {
  description = "ID of the container instance"
  value       = oci_container_instances_container_instance.innovation_day_container_instance.id
}

output "state" {
  description = "Current state"
  value       = oci_container_instances_container_instance.innovation_day_container_instance.state
}

output "vnic_details" {
  description = "Details of the attached vnics"
  value       = oci_container_instances_container_instance.innovation_day_container_instance.vnics
}



