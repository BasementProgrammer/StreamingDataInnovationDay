output "vault_id"        { value = oci_kms_vault.idtest_vault.id }
output "key_id"          { value = oci_kms_key.idtest_key.id }
output "secret_id" {
  value = oci_vault_secret.admin_password.id
}