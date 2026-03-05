# Vault
resource "oci_kms_vault" "idtest_vault" {
  compartment_id = var.compartment_id  # THIS will be the new compartment's OCID!
  display_name   = var.vault_display_name
  vault_type     = "DEFAULT" # Could be variable for HSM/Virtualized, but DEFAULT (Virtual Vault) is most common and affordable ; Note: Cannot be changed after creation.
}

# Key
resource "oci_kms_key" "idtest_key" {
  compartment_id = var.compartment_id  # THIS will be the new compartment's OCID!
  display_name   = var.key_display_name
  management_endpoint = oci_kms_vault.idtest_vault.management_endpoint #Reference vault as the management endpoint.
  key_shape {
    algorithm = "AES"
    length    = 32
  }
  # Could add more parameters for key shape/customizability
}

#Secret - ATP Admin Password Generatiom
resource "oci_vault_secret" "admin_password" {
  compartment_id = var.compartment_id
  secret_name    = var.secret_name
  vault_id       = oci_kms_vault.idtest_vault.id
  key_id         = oci_kms_key.idtest_key.id
  description    = "ATP Admin Password"
  secret_content {
    content_type = "BASE64"
    content      = base64encode(var.db_password)
  }
}