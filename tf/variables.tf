# Automatic variables
variable "tenancy_ocid" {
  description = "The OCID of the root compartment (tenancy)."
  type        = string
}
variable "compartment_ocid" {
  description = "The OCID of the compartment to place network resources."
  type        = string
}
variable "region" {
  description = "The region to deploy resources."
  type        = string
}
variable "current_user_ocid" {
  description = "The OCID of the current user."
  type        = string
}

variable "compartment_name" {
  description = "Name of the compartment."
  type        = string
  default     = "InnovationDays-Compartment"
}

variable "compartment_description" {
  description = "Description of the compartment."
  type        = string
  default     = "Compartment for all innovation day resources"      # Hardcoded default for convenience, but can be overridden by user.
}

variable "vcn_cidr" {
  description = "VCN CIDR block."
  type        = string
  default     = "10.0.0.0/16"
}
variable "public_subnet_cidr" {
  description = "Public subnet CIDR block."
  type        = string
  default     = "10.0.1.0/24"
}
variable "enable_service_gateway" {
  description = "Whether to create a Service Gateway for private subnet access to Oracle Services"
  default     = true
# If you want it always set, remove default and specify the value in your root terraform.tfvars.
}

variable "vault_display_name" {
  description = "Display name for the Vault"
  type        = string
  default     = "Innovation Day Vault"
}
variable "key_display_name" {
  description = "Display name for KMS Key"
  type        = string
  default     = "Innovation Day KMS Key"
}


variable "incoming_stream_name" { default = "Incoming Stream" }
variable "incoming_stream_partitions" { default = 1 }
variable "incoming_stream_retention_in_hours" { default = 24 }


variable "database_stream_name" { default = "Database Stream" }
variable "database_stream_partitions" { default = 1 }
variable "database_stream_retention_in_hours" { default = 24 }

variable "compute_count" { default = 1 }
variable "compute_model" { default = "ECPU" } # or "CPU"
variable "data_storage_size_in_tbs" { default = 1 }
variable "db_name" { default = "InnovationDay" }
variable "db_version" { default = "19c" }
variable "db_workload" { default = "OLTP" }
variable "atp_display_name" { default = "Innovation Day ATPDB" }
variable "is_dedicated" { default = false }
variable "is_mtls_connection_required" { default = false }
variable "license_model" { default = "LICENSE_INCLUDED" }
variable "is_data_guard_enabled" { default = false }
variable "is_local_data_guard_enabled" { default = false }

variable "freeform_tags" {
      type    = map(string)
        default = {}
        }

variable "container_display_name" {
  description = "Display name for the container instance"
  type        = string
  default     = "Innovation Day Container Instance"
}

variable "assign_public_ip" {
  description = "Should the container instance receive a public IP?"
  type        = bool
  default     = true
}

variable "container_environment_variables" {
  description = "Key-Value environment variables passed to the container"
  type        = map(string)
  default     = {}
}

variable "container_restart_policy" {
  description = "Container restart policy: ALWAYS, NEVER, ON_FAILURE"
  type        = string
  default     = "ALWAYS"
}

#Identity Domain Variables
variable "identity_domain_display_name" {
  type        = string
  default     = "InnovationDayDomain"
  description = "Display name for the identity domain"
}

variable "identity_domain_description" {
  type        = string
  default     = "Identity domain for Innovation Day"
}

variable "license_type" {
  type    = string
  default = "free"
  description = "Identity Domain license type"
}

variable "availability_domain" {
  description = "The Availability Domain in which to launch resources."
  type        = string
  default     = "buYP:US-ASHBURN-AD-1"  # Replace with your AD if needed
}