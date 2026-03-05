resource "oci_identity_domain" "innovation_day_domain" {
  compartment_id  = var.compartment_id
  display_name    = var.identity_domain_display_name
  description     = var.identity_domain_description
  license_type    = var.license_type
  home_region       = var.home_region 
  #admin_first_name = var.admin_first_name
  #admin_last_name  = var.admin_last_name
  #admin_user_name  = var.admin_user_name
  #admin_email      = var.admin_email
  #admin_password   = var.admin_password
}

#resource "oci_identity_dynamic_group" "innovation_day_dg" {
#  compartment_id = var.tenancy_ocid 
#  name           = var.dynamic_group_name
#  description    = var.dynamic_group_description
#  
#  # can refer to any compartment's OCID (including those you create during the same Terraform run) to target the right resources.
#  matching_rule  = "ALL {resource.type='computecontainerinstance', resource.compartment.id='${var.compartment_id}'}"
#}

#resource "oci_identity_policy" "innovation_day_policy" {
#  name           = "InnovationDayPolicy"
#  description    = "Policy for Innovation Day Dynamic Group"
#  compartment_id = var.compartment_id  # policies are at the compartment level (target this compartment)
#  statements = [
#    "Allow dynamic-group ${oci_identity_dynamic_group.innovation_day_dg.name} to read secret-family in compartment id ${var.vault_compartment_id}",
#    "Allow dynamic-group ${oci_identity_dynamic_group.innovation_day_dg.name} to use stream-push in compartment id ${var.stream_compartment_id}"
#  ]
#}