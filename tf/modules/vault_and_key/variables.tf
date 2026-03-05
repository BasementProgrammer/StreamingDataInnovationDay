variable "compartment_id" { 
    description = "Compartment OCID for Vault/Key" 
    type = string 
    }
variable "vault_display_name" { 
    description = "Vault name" 
    type = string 
    default = "idtest_vault" 
    }
variable "key_display_name" { 
    description = "Key name" 
    type = string 
    default = "idtest_key" 
    }
variable "secret_name" { 
    description = "Generate a random password?"
     type = string
    default = true 
    }
variable "db_password"        { 
    type = string
    sensitive = true 
    description = "ATP admin password. Should be securely generated (not hard-coded)."
    }