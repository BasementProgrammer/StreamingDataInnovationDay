variable "compartment_ocid" { type = string }
variable "compute_count" { type = number }
variable "compute_model" { type = string }
variable "data_storage_size_in_tbs" { type = number }
variable "db_name" { type = string }
variable "db_version" {}
variable "db_workload" {}
variable "atp_display_name" { type = string }
variable "is_dedicated" {
  type    = bool
  default = false
}
variable "is_mtls_connection_required" {
  type    = bool
  default = true
}
variable "license_model" { type = string }
variable "is_data_guard_enabled" {
  type    = bool
  default = false
}
variable "is_local_data_guard_enabled" {
  type    = bool
  default = false
}
variable "admin_password" {
  type = string
  description = "OCID of the Vault Secret containing ATP admin password secret in OCI Vault (ocid1.vaultsecret.oc1...)"
}
variable "freeform_tags" {
  type    = map(string)
  default = {}
}
variable "whitelisted_ips" {
  type    = list(string)
  default = []
  description = "List of IP addresses/CIDRs allowed to connect to ATP. Defaults to open (not recommended for production)."
}
variable "subnet_id" { description = "Subnet for ATP endpoint" } 