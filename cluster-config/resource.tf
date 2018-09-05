# Create a new VCN
resource "oci_core_virtual_network" "vcnName" {
  cidr_block = "${var.VCN-CIDR}"
  compartment_id = "${var.compartment_id}"
  display_name = "vcnName"
  dns_label = ""
}

# Create a new Internet Gateway
resource "oci_core_internet_gateway" "" {
  compartment_id = "${var.compartment_id}"
  display_name = ""
  vcn_id = "${oci_core_virtual_network.vcnName.id}"
}

# Create a new Route Table
resource "oci_core_route_table" "" {
  compartment_id = "${var.compartment_id}"
  vcn_id = "${oci_core_virtual_network.vcnName.id}"
  display_name = " "
  route_rules {
    cidr_block = "0.0.0.0/0"
    network_entity_id = "${oci_core_internet_gateway..id}"
  }
}


resource "oci_core_security_list" "secList1" {
  compartment_id = "${var.compartment_id}"
  display_name = "secList1"
  vcn_id = "${oci_core_virtual_network.vcnName.id}"

} 
resource "oci_core_subnet" "subnet1" {
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD - 1],"name")}"
  prohibit_public_ip_on_vnic = null
  cidr_block = "${var.subnetDMZ-CIDR}"
  display_name = "subnet1"
  dns_label = ""
  compartment_id = "${var.compartment_id}"
  vcn_id = "${oci_core_virtual_network.vcnName.id}"
  route_table_id = "${oci_core_route_table.routetable.id}"
  security_list_ids = ["${oci_core_security_list.null.id}"]
  dhcp_options_id = "${oci_core_virtual_network.vcnName.default_dhcp_options_id}"
}

resource "oci_core_instance" "instance" {
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD - 1],"name")}"
  compartment_id = "${var.compartment_id}"
  display_name = "instance"
  hostname_label = "instance"
  image = "${lookup(data.oci_core_images.OL7gen2ImageOCID.images[0], "id")}"
  shape = "VM.Standard2.1"
  subnet_id = "${oci_core_subnet.subnet1.id}"
  metadata {
    ssh_authorized_keys = "${file(var.ssh_public_key_path)}"
  }

}
