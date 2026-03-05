output "passwword" {
  value = random_password.atp_admin.result
  sensitive = true
}

output "Incoming_Stream_ID" {
  value = module.incoming_stream.stream_id
}

output "streaming_endpoint" {
  value = module.incoming_stream.stream_endpoint
}

output "compartment_id" {
  value = module.compartments.compartment_id
}

output "container_instance_id" {
  value = module.container_instance.container_instance_id
}

output "Tennancy-OCID" {
  value = var.tenancy_ocid
}

output "user_ocid" {
  value = var.current_user_ocid
}

