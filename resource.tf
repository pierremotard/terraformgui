# Create a new VCN
resource "oci_core_virtual_network" "" {
  cidr_block = "${var.VCN-CIDR}"
  compartment_id = "${var.compartment_id}"
  display_name = ""
  dns_label = ""
}

# Create a new Internet Gateway
resource "oci_core_internet_gateway" "" {
  compartment_id = "${var.compartment_id}"
  display_name = ""
  vcn_id = "${oci_core_virtual_network..id}"
}

# Create a new Route Table
resource "oci_core_route_table" "" {
  compartment_id = "${var.compartment_id}"
  vcn_id = "${oci_core_virtual_network..id}"
  display_name = " "
  route_rules {
    cidr_block = "0.0.0.0/0"
    network_entity_id = "${oci_core_internet_gateway..id}"
  }
}

