resource "oci_streaming_stream_pool" "idtest_pool" {
  compartment_id = var.compartment_id
  name           = "${var.stream_name}-pool"
}

resource "oci_streaming_stream" "idtest_database_stream" {
  name            = var.stream_name
  partitions      = var.partitions
  retention_in_hours = var.retention_in_hours
  stream_pool_id  = oci_streaming_stream_pool.idtest_pool.id   
}