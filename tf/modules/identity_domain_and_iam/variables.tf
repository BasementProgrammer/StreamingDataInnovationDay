variable "compartment_id" {
  type        = string
  description = "Compartment where the identity domain will be created"
}
variable "tenancy_ocid" {
  type        = string
  description = "The root tenancy OCID"
}
variable "identity_domain_display_name" {
  type        = string
  description = "Display name for the identity domain"
}
variable "identity_domain_description" {
  type        = string
  description = "Description for the identity domain"
}
variable "license_type" {
  type        = string
  default     = "free"
  description = "OCI Identity Domain license type"
}
variable "home_region" {
  type        = string
  description = "Home region for the identity domain. Should match a supported identity region short code (e.g. 'us-ashburn-1')."
}
#variable "admin_first_name" {
#  type        = string
#  description = "Admin user first name"
#}
#variable "admin_last_name" {
#  type        = string
#  description = "Admin user last name"
#}
#variable "admin_user_name" {
#  type        = string
#  description = "Admin user name"
#}
#variable "admin_email" {
#  type        = string
#  description = "Admin email"
#}
#variable "admin_password" {
#  type        = string
#  description = "Admin password"
#  sensitive   = true
#}

#variable "dynamic_group_name" {
#  type        = string
#  description = "Dynamic group name"
#}
#variable "dynamic_group_description" {
#  type        = string
#  description = "Dynamic group description"
#}
#variable "stream_compartment_id" { # Where streams reside, to attach policy for stream-push
#  type = string
#  description = "The compartment OCID for the stream resource"
#}
#variable "vault_compartment_id" { # Where vault/secrets reside, to attach policy for secret access
#  type = string
#  description = "The compartment OCID for the vault resource"
#}

