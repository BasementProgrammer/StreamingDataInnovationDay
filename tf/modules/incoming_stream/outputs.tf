output "stream_id" {
  value = oci_streaming_stream.idtest_stream.id
}

output "stream_endpoint" {
  value = oci_streaming_stream.idtest_stream.messages_endpoint
}