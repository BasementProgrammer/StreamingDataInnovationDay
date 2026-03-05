
resource "oci_database_autonomous_database" "atp_database" {
  compartment_id                   = var.compartment_ocid
  compute_count                    = var.compute_count
  compute_model                    = var.compute_model
  data_storage_size_in_tbs         = var.data_storage_size_in_tbs
  is_auto_scaling_enabled          = false
  db_workload                      = "OLTP"
  db_name                          = var.db_name
  db_version                       = var.db_version
  display_name                     = var.atp_display_name
  is_free_tier                     = false # Make True for Innovation Day Demo
  is_dedicated                     = var.is_dedicated
  is_mtls_connection_required      = true   # Default/recommended for Always Free Tier
  license_model                    = var.license_model
  is_data_guard_enabled            = var.is_data_guard_enabled  
  is_local_data_guard_enabled      = var.is_local_data_guard_enabled
  admin_password                   =  var.admin_password
  freeform_tags                    = var.freeform_tags

# NOTE: No subnet_id or network_acl_id arguments
# whitelisted_ips omitted or set as an empty list
    # whitelisted_ips = []
}

