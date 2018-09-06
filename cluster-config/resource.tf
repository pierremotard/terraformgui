# Create a new VCN
resource "oci_core_virtual_network" "vcnDelete" {
  cidr_block = "${var.VCN-CIDR}"
  compartment_id = "${var.compartment_id}"
  display_name = "vcnDelete"
  dns_label = ""
}

# Create a new Internet Gateway
resource "oci_core_internet_gateway" "" {
  compartment_id = "${var.compartment_id}"
  display_name = ""
  vcn_id = "${oci_core_virtual_network.vcnDelete.id}"
}

# Create a new Route Table
resource "oci_core_route_table" "" {
  compartment_id = "${var.compartment_id}"
  vcn_id = "${oci_core_virtual_network.vcnDelete.id}"
  display_name = " "
  route_rules {
    cidr_block = "0.0.0.0/0"
    network_entity_id = "${oci_core_internet_gateway..id}"
  }
}


resource "oci_core_security_list" "sl-workers" {
  compartment_id = "${var.compartment_id}"
  display_name = "sl-workers"
  vcn_id = "${oci_core_virtual_network.null.id}"

  ingress_security_rules {
    protocol = "0"   // all
    source = "0.0.0.0/0"
    stateless = false

    all_options {
      source_port_range {
        "min" = 
        "max" = 
      }
    }
  }

  egress_security_rules {
    protocol  = "0"   // all
    destination = "0.0.0.0/0"
    stateless = false

    all_options {
      destination_port_range {
        "min" = 
        "max" = 
      }
    }
  }

} 

resource "oci_core_security_list" "sl-lb" {
  compartment_id = "${var.compartment_id}"
  display_name = "sl-lb"
  vcn_id = "${oci_core_virtual_network.null.id}"

0"   // all
    source = "9999"
    stateless = false

    all_options {
      source_port_range {
        "min" = null
        "max" = null
      }
    }
  }

6"   // tcp
    source = "0.0.0.0"
    stateless = true

    tcp_options {
      source_port_range {
        "min" = 22
        "max" = 22
      }
    }
  }

} 

resource "oci_core_security_list" "sl-lb2" {
  compartment_id = "${var.compartment_id}"
  display_name = "sl-lb2"
  vcn_id = "${oci_core_virtual_network.null.id}"

  ingress_security_rules {
    protocol = "all
    source = "0000"
    stateless = false

    all_options {
      source_port_range {
        "min" = null
        "max" = null
      }
    }
  }

  ingress_security_rules {
    protocol = "6"   // tcp
    source = "0000"
    stateless = true

    tcp_options {
      source_port_range {
        "min" = 22
        "max" = 22
      }
    }
  }

} 

resource "oci_core_security_list" "sl" {
  compartment_id = "${var.compartment_id}"
  display_name = "sl"
  vcn_id = "${oci_core_virtual_network.null.id}"

  egress_security_rules {
    protocol  = "all"
    destination = ""
    stateless = true

  }

  egress_security_rules {
    protocol  = "6"   // tcp
    destination = ""
    stateless = false

    tcp_options {
      destination_port_range {
        "min" = 22
        "max" = 22
      }
    }
  }

} 
resource "oci_core_subnet" "subnetadded" {
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD - 1],"name")}"
  prohibit_public_ip_on_vnic = true
  cidr_block = "${var.subnetadded-CIDR}"
  display_name = "subnetadded"
  dns_label = "dns"
  compartment_id = "${var.compartment_id}"
  vcn_id = "${oci_core_virtual_network.null.id}"
  route_table_id = "${oci_core_route_table.routetable.id}"
  security_list_ids = ["${oci_core_security_list.sl-workers.id}"]
  dhcp_options_id = "${oci_core_virtual_network.null.default_dhcp_options_id}"
}

resource "oci_core_instance" "instwind" {
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD - 1],"name")}"
  compartment_id = "${var.compartment_id}"
  display_name = "instwind"
  hostname_label = "instwind"
  image = "${lookup(data.oci_core_images.WS2012gen1ImageOCID.images[0], "id")}"
  shape = "VM.Standard1.1"
  subnet_id = "${oci_core_subnet.subnetadded.id}"
  metadata {
    ssh_authorized_keys = "${file(var.ssh_public_key_path)}"
  }

}
