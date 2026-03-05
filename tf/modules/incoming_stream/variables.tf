variable "compartment_id" {
  description = "Compartment OCID for the stream pool"
  type        = string
}
variable "stream_pool_id" {  
  description = "Stream Pool OCID to create stream inside a custom pool named idtest_pool"
  type        = string
  default     = null
}
variable "stream_name" {}
variable "partitions" { default = 1 }
variable "retention_in_hours" { default = 24 }