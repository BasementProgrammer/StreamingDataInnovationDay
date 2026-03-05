data "oci_identity_availability_domains" "ad_list" {
  # Use the compartment OCID where you want to list the ADs (often the tenancy OCID)
  compartment_id = var.compartment_id 
}
# Define a data source for the specific availability domain to use (e.g., the first one in the list)
data "oci_identity_availability_domain" "ad" {
  ad_number      = 1
  compartment_id = var.compartment_id
}

resource "time_sleep" "wait_for_network" {
  create_duration = "120s"
}

resource "oci_container_instances_container_instance" "innovation_day_container_instance" {
  compartment_id      = var.compartment_id
  availability_domain = data.oci_identity_availability_domain.ad.name
  shape               = var.shape
  display_name        = var.container_display_name
  depends_on          = [time_sleep.wait_for_network]
  
  shape_config {
    ocpus            = var.ocpus
    memory_in_gbs    = var.memory_in_gbs
  }
    
  vnics {
    subnet_id      = var.subnet_id
    is_public_ip_assigned = true     # Allows Public IP to be assigned for the container instance resource.
    display_name   = "innovation_day_primary_vnic"
    nsg_ids         = [var.network_security_group_id]
    # hostname_label = "innovation-day-container-hostname" 
    # Hostname label must only have lowercase letters, numbers, and hyphens,
    # start/end with letter/number, max 63 chars.
  }

  containers {
    image_url = var.image_url
    # Setting the actual ENV for your app
    environment_variables = {
      streamid       = var.incoming_stream_id          # OCID of Innovation Day Incoming Stream
      endpointconfiguration = var.incoming_stream_endpoint
      # ATP_ADMIN_PASSWORD_SECRET_OCID = var.atp_admin_password_secret_id                    
    }
  }

  // Credentials for pulling the image from OCIR
  image_pull_secrets {
        registry_endpoint = "iad.ocir.io"
        secret_type = "BASIC"
        username = var.reg_user
        password = var.reg_password 
    }
  
   container_restart_policy = var.container_restart_policy

   freeform_tags    = var.freeform_tags
  } 


  


