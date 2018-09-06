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
