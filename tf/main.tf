module "compartments" {
  source                  = "./modules/compartments"
  compartment_name        = var.compartment_name
  compartment_description = var.compartment_description
  compartment_ocid        = var.compartment_ocid
}

module "networking" {
  source                 = "./modules/networking"
  compartment_id         = module.compartments.compartment_id
  region                 = var.region
  vcn_cidr               = var.vcn_cidr
  public_subnet_cidr     = var.public_subnet_cidr
  enable_service_gateway = var.enable_service_gateway # Pass flag here
}

# Having random_password in the root module makes password available to multiple child modules if needed
resource "random_password" "atp_admin" {
  length  = 20
  special = true
}


module "incoming_stream" {
  source          = "./modules/incoming_stream"
  stream_name     = var.incoming_stream_name
  partitions      = var.incoming_stream_partitions
  retention_in_hours = var.incoming_stream_retention_in_hours
  compartment_id      = module.compartments.compartment_id
}

module "database_stream" {
  source          = "./modules/database_stream"
  stream_name     = var.database_stream_name
  partitions      = var.database_stream_partitions
  retention_in_hours = var.database_stream_retention_in_hours
  compartment_id      = module.compartments.compartment_id
}

module "atp_database" {
  source                       = "./modules/atp_database"
  compartment_ocid             = module.compartments.compartment_id
  
  compute_count                = var.compute_count
  compute_model                = var.compute_model
  data_storage_size_in_tbs     = var.data_storage_size_in_tbs
  db_name                      = var.db_name
  db_version                   = var.db_version
  db_workload                  = var.db_workload
  atp_display_name             = var.atp_display_name
  is_dedicated                 = var.is_dedicated
  is_mtls_connection_required  = var.is_mtls_connection_required
  license_model                = var.license_model 
  is_data_guard_enabled        = var.is_data_guard_enabled
  is_local_data_guard_enabled  = var.is_local_data_guard_enabled
  admin_password               = random_password.atp_admin.result
  freeform_tags                = var.freeform_tags
  subnet_id                    = module.networking.public_subnet_id
}

module "container_instance" {
  source           = "./modules/container_instance"
  compartment_id   = module.compartments.compartment_id
  subnet_id        = module.networking.public_subnet_id 
  availability_domain = var.availability_domain
  shape            = "CI.Standard.E4.Flex" #In this case we are using the CI.Standard.E4.Flex which is noyt included in Always Free Tier # CI.Standard.AI.Flex or "CI.Standard.E3.Flex" for Always Free
  ocpus            = 1    # Minimum: 1 OCPU; Maximum: 76 OCPUs (though your free usage is limited to the equivalent of 4 OCPUs monthly)
  memory_in_gbs    = 2    # Minimum: 1 GB (or a value matching the number of OCPUs, whichever is greater); Maximum: 64 GB per OCPU, up to a total of 488 GB per container instance (again, limited by your overall free tier capacity) 
  container_display_name    = var.container_display_name
  assign_public_ip = true  # instructs the container instance to request a public IP on creation (which is needed for images to be pulled from the internet when not using NAT GW).
  container_environment_variables = var.container_environment_variables
  container_restart_policy        = var.container_restart_policy
  freeform_tags                   = var.freeform_tags
  incoming_stream_id = module.incoming_stream.stream_id
  incoming_stream_endpoint = module.incoming_stream.stream_endpoint
  network_security_group_id = module.networking.network_security_group_id
  depends_on = [ module.networking ]
}

module "identity_domain_and_iam" {
  source = "./modules/identity_domain_and_iam"
  compartment_id = module.compartments.compartment_id  # child compartment for domain/policy 
  tenancy_ocid   = var.tenancy_ocid                    # <-- make sure this is the tenancy OCID, not a compartment
  identity_domain_display_name = var.identity_domain_display_name
  identity_domain_description  = var.identity_domain_description
  license_type = "free"
  home_region = var.region     # or set explicitly if you want a fixed value       
}
