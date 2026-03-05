
# -------------------------
# VCN
# -------------------------
resource "oci_core_vcn" "main_vcn" {
  cidr_block     = "10.0.0.0/16"
  compartment_id = var.compartment_id
  display_name   = "main-vcn"
  dns_label = "innovationday" # DNS label must be 1-15 chars, lowercase letters/numbers, start with letter.
}

# -------------------------
# Internet Gateway
# -------------------------
resource "oci_core_internet_gateway" "igw" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.main_vcn.id
  display_name   = "internet-gateway"
  enabled        = true
}

# -------------------------
# NAT Gateway
# -------------------------
resource "oci_core_nat_gateway" "nat" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.main_vcn.id
  display_name   = "nat-gateway"
}

# -------------------------
# Service Gateway
# -------------------------
resource "oci_core_service_gateway" "sgw" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.main_vcn.id
  display_name   = "service-gateway"

  services {
    service_id = data.oci_core_services.all_oci_services.services[0].id
  }
}

data "oci_core_services" "all_oci_services" {}

# -------------------------
# Route Table - Public Subnet
# -------------------------
resource "oci_core_route_table" "public_rt" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.main_vcn.id
  display_name   = "public-route-table"

  route_rules {
    network_entity_id = oci_core_internet_gateway.igw.id
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
  }
}

# -------------------------
# Route Table - Private Subnet
# -------------------------
resource "oci_core_route_table" "private_rt" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.main_vcn.id
  display_name   = "private-route-table"

  route_rules {
    network_entity_id = oci_core_nat_gateway.nat.id
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
  }

  route_rules {
    network_entity_id = oci_core_service_gateway.sgw.id
    destination       = data.oci_core_services.all_oci_services.services[0].cidr_block
    destination_type  = "SERVICE_CIDR_BLOCK"
  }
}

# -------------------------
# Public Subnet
# -------------------------
resource "oci_core_subnet" "public_subnet" {
  cidr_block        = "10.0.1.0/24"
  compartment_id    = var.compartment_id
  vcn_id            = oci_core_vcn.main_vcn.id
  display_name      = "public-subnet"
  route_table_id    = oci_core_route_table.public_rt.id
  prohibit_public_ip_on_vnic = false
  security_list_ids = [
    oci_core_security_list.allow_all_outbound_tcp.id
  ]
}

# -------------------------
# Private Subnet
# -------------------------
resource "oci_core_subnet" "private_subnet" {
  cidr_block        = "10.0.2.0/24"
  compartment_id    = var.compartment_id
  vcn_id            = oci_core_vcn.main_vcn.id
  display_name      = "private-subnet"
  route_table_id    = oci_core_route_table.private_rt.id
  prohibit_public_ip_on_vnic = true
}

# -------------------------
# Network Security Group
# -------------------------
resource "oci_core_network_security_group" "app_nsg" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.main_vcn.id
  display_name   = "app-nsg"
}

# Allow inbound 80, 8080, 8081
resource "oci_core_network_security_group_security_rule" "allow_web_ports" {
  for_each = {
    "80"   = 80
    "8080" = 8080
    "8081" = 8081
  }

  network_security_group_id = oci_core_network_security_group.app_nsg.id
  direction                 = "INGRESS"
  protocol                  = "6" # TCP

  tcp_options {
    destination_port_range {
      min = each.value
      max = each.value
    }
  }

  source      = "0.0.0.0/0"
  source_type = "CIDR_BLOCK"
}

resource "oci_core_network_security_group_security_rule" "egress_https" {
  network_security_group_id = oci_core_network_security_group.app_nsg.id
  direction                  = "EGRESS"
  protocol                   = "6" # TCP

  destination      = "0.0.0.0/0"
  destination_type = "CIDR_BLOCK"

  tcp_options {
    destination_port_range {
      min = 443
      max = 443
    }
  }
}

resource "oci_core_security_list" "allow_all_outbound_tcp" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.main_vcn.id
  display_name   = "allow-all-outbound-tcp"

  egress_security_rules {
    protocol    = "6"            # TCP
    destination = "0.0.0.0/0"    # Anywhere
  }

}



