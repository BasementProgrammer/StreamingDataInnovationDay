variable "compartment_id"           { type = string }
variable "subnet_id"                { 
    description = "Subnet OCID (public or private, determined by configuration)"
    type = string 
}
variable "availability_domain"      { type = string }
variable "shape" { default =  "CI.Standard.E4.Flex" }
variable "ocpus" { default = 1 }
variable "memory_in_gbs" { default = 1 }
variable "container_display_name" { default = "idtest_container_instance" }
variable "assign_public_ip"         { default = true }
variable "container_environment_variables" { default = {} }
variable "container_restart_policy" { default = "ALWAYS" }
variable "freeform_tags" { default = {} }

variable "incoming_stream_id" {
  description = "OCID of the incoming stream"
  type        = string
}

variable "incoming_stream_endpoint" {
  description = "Endpoint for the incoming stream"
  type        = string
}

variable "network_security_group_id" {
  description = "OCID of the Network Security Group to associate with the container instance's VNIC"
  type        = string
}

variable "reg_user" {
  type = string
  default = "aWR4bGZodHJ2ZnNhL2ltYWdlcHVsbAo="
}

variable "reg_password" {
  type = string
  default = "TG5ma0R1XTU2SzBHYnZQVGRGSDsK"
}

variable "image_url" {
  description = "Container image repository URL (public DockerHub recommended for Free Tier)"
  type        = string
  default     = "iad.ocir.io/idxlfhtrvfsa/publicrepo/datasenderweb:v2"
}