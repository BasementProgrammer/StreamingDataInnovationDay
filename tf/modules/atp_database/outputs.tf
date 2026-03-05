output "admin_password_secret_ocid" {
  value = oci_database_autonomous_database.atp_database.id
}

output "connection_strings" {
  value = oci_database_autonomous_database.atp_database.connection_strings
}