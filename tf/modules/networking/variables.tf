#
# * ----------- * Networking Variables * ----------- * 
#
variable "compartment_id" {
  description = "OCID of the compartment to place network resources."
  type        = string
}
variable "region" {
  description = "Region where to create resources."
  type        = string
  default     = "us-ashburn-1"
}
# Variable for the Availability Domain (AD) to be used
variable "availability_domain" {
  description = "The Availability Domain in which to launch resources."
  type        = string
  default     = "buYP:US-ASHBURN-AD-1"  # Replace with your AD if needed
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
  type        = bool
  default     = true
  # Why: This allows users to enable or disable Service Gateway creation by setting a flag in terraform.tfvars or via the CLI.
}


