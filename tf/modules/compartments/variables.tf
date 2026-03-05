#
# * ----------- * Compartment Variables * ----------- *
#
variable "compartment_name" {
  description = "Name of the compartment."
  type        = string
  default     = "InnovationDays-Compartment"  # Hardcoded default for convenience, but can be overridden by user.
}

variable "compartment_ocid" {
  description = "The OCID of the compartment to place network resources."
  type        = string
}

variable "compartment_description" {
  description = "Description of the compartment."
  type        = string
  default     = "Managed by Terraform"      # Hardcoded default for convenience, but can be overridden by user.
}

