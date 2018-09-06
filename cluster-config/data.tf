# Gets a list of Availability Domains
data "oci_identity_availability_domains" "ADs" {
  compartment_id = "${var.tenancy_ocid}"
}

# Get the OCID for the more recent **Gen2** Oracle Linux 7.5 disk image
data "oci_core_images" "OL7gen2ImageOCID" {
  compartment_id = "${var.compartment_id}"
  operating_system = "Oracle Linux"
  operating_system_version = "7.5"
  #compatible shape:
  shape = "VM.Standard2.1"
}

# Get the OCID for the more recent **Gen1** Oracle Linux 7.5 disk image
data "oci_core_images" "OL7gen1ImageOCID" {
  compartment_id = "${var.compartment_id}"
  operating_system = "Oracle Linux"
  operating_system_version = "7.5"
  #compatible shape:
  shape = "VM.Standard1.1"
}

# Get the OCID for the more recent **Gen 2** Windows Server 2012 disk image
data "oci_core_images" "WS2012gen2ImageOCID" {
  compartment_id = "${var.compartment_id}"
  operating_system = "Windows"
  operating_system_version = "Server 2012 R2 Standard"
  #compatible shape:
  shape = "VM.Standard2.1"
  # get exact image:
  #display_name  = "Windows-Server-2012-R2-Standard-Edition-VM-Gen2-2018.07.19-0"
}

# Get the OCID for the more recent **Gen 1** Windows Server 2012 disk image
data "oci_core_images" "WS2012gen1ImageOCID" {
  compartment_id = "${var.compartment_id}"
  operating_system = "Windows"
  operating_system_version = "Server 2012 R2 Standard"
  #compatible shape:
  shape = "VM.Standard1.1"
  # get exact image:
  #display_name  = "Windows-Server-2012-R2-Standard-Edition-VM-2018.07.19-0"
}# Gets a list of Availability Domains
data "oci_identity_availability_domains" "ADs" {
  compartment_id = "${var.tenancy_ocid}"
}

# Get the OCID for the more recent **Gen2** Oracle Linux 7.5 disk image
data "oci_core_images" "OL7gen2ImageOCID" {
  compartment_id = "${var.compartment_id}"
  operating_system = "Oracle Linux"
  operating_system_version = "7.5"
  #compatible shape:
  shape = "VM.Standard2.1"
}

# Get the OCID for the more recent **Gen1** Oracle Linux 7.5 disk image
data "oci_core_images" "OL7gen1ImageOCID" {
  compartment_id = "${var.compartment_id}"
  operating_system = "Oracle Linux"
  operating_system_version = "7.5"
  #compatible shape:
  shape = "VM.Standard1.1"
}

# Get the OCID for the more recent **Gen 2** Windows Server 2012 disk image
data "oci_core_images" "WS2012gen2ImageOCID" {
  compartment_id = "${var.compartment_id}"
  operating_system = "Windows"
  operating_system_version = "Server 2012 R2 Standard"
  #compatible shape:
  shape = "VM.Standard2.1"
  # get exact image:
  #display_name  = "Windows-Server-2012-R2-Standard-Edition-VM-Gen2-2018.07.19-0"
}

# Get the OCID for the more recent **Gen 1** Windows Server 2012 disk image
data "oci_core_images" "WS2012gen1ImageOCID" {
  compartment_id = "${var.compartment_id}"
  operating_system = "Windows"
  operating_system_version = "Server 2012 R2 Standard"
  #compatible shape:
  shape = "VM.Standard1.1"
  # get exact image:
  #display_name  = "Windows-Server-2012-R2-Standard-Edition-VM-2018.07.19-0"
}# Gets a list of Availability Domains
data "oci_identity_availability_domains" "ADs" {
  compartment_id = "${var.tenancy_ocid}"
}

# Get the OCID for the more recent **Gen2** Oracle Linux 7.5 disk image
data "oci_core_images" "OL7gen2ImageOCID" {
  compartment_id = "${var.compartment_id}"
  operating_system = "Oracle Linux"
  operating_system_version = "7.5"
  #compatible shape:
  shape = "VM.Standard2.1"
}

# Get the OCID for the more recent **Gen1** Oracle Linux 7.5 disk image
data "oci_core_images" "OL7gen1ImageOCID" {
  compartment_id = "${var.compartment_id}"
  operating_system = "Oracle Linux"
  operating_system_version = "7.5"
  #compatible shape:
  shape = "VM.Standard1.1"
}

# Get the OCID for the more recent **Gen 2** Windows Server 2012 disk image
data "oci_core_images" "WS2012gen2ImageOCID" {
  compartment_id = "${var.compartment_id}"
  operating_system = "Windows"
  operating_system_version = "Server 2012 R2 Standard"
  #compatible shape:
  shape = "VM.Standard2.1"
  # get exact image:
  #display_name  = "Windows-Server-2012-R2-Standard-Edition-VM-Gen2-2018.07.19-0"
}

# Get the OCID for the more recent **Gen 1** Windows Server 2012 disk image
data "oci_core_images" "WS2012gen1ImageOCID" {
  compartment_id = "${var.compartment_id}"
  operating_system = "Windows"
  operating_system_version = "Server 2012 R2 Standard"
  #compatible shape:
  shape = "VM.Standard1.1"
  # get exact image:
  #display_name  = "Windows-Server-2012-R2-Standard-Edition-VM-2018.07.19-0"
}# Gets a list of Availability Domains
data "oci_identity_availability_domains" "ADs" {
  compartment_id = "${var.tenancy_ocid}"
}

# Get the OCID for the more recent **Gen2** Oracle Linux 7.5 disk image
data "oci_core_images" "OL7gen2ImageOCID" {
  compartment_id = "${var.compartment_id}"
  operating_system = "Oracle Linux"
  operating_system_version = "7.5"
  #compatible shape:
  shape = "VM.Standard2.1"
}

# Get the OCID for the more recent **Gen1** Oracle Linux 7.5 disk image
data "oci_core_images" "OL7gen1ImageOCID" {
  compartment_id = "${var.compartment_id}"
  operating_system = "Oracle Linux"
  operating_system_version = "7.5"
  #compatible shape:
  shape = "VM.Standard1.1"
}

# Get the OCID for the more recent **Gen 2** Windows Server 2012 disk image
data "oci_core_images" "WS2012gen2ImageOCID" {
  compartment_id = "${var.compartment_id}"
  operating_system = "Windows"
  operating_system_version = "Server 2012 R2 Standard"
  #compatible shape:
  shape = "VM.Standard2.1"
  # get exact image:
  #display_name  = "Windows-Server-2012-R2-Standard-Edition-VM-Gen2-2018.07.19-0"
}

# Get the OCID for the more recent **Gen 1** Windows Server 2012 disk image
data "oci_core_images" "WS2012gen1ImageOCID" {
  compartment_id = "${var.compartment_id}"
  operating_system = "Windows"
  operating_system_version = "Server 2012 R2 Standard"
  #compatible shape:
  shape = "VM.Standard1.1"
  # get exact image:
  #display_name  = "Windows-Server-2012-R2-Standard-Edition-VM-2018.07.19-0"
}# Gets a list of Availability Domains
data "oci_identity_availability_domains" "ADs" {
  compartment_id = "${var.tenancy_ocid}"
}

# Get the OCID for the more recent **Gen2** Oracle Linux 7.5 disk image
data "oci_core_images" "OL7gen2ImageOCID" {
  compartment_id = "${var.compartment_id}"
  operating_system = "Oracle Linux"
  operating_system_version = "7.5"
  #compatible shape:
  shape = "VM.Standard2.1"
}

# Get the OCID for the more recent **Gen1** Oracle Linux 7.5 disk image
data "oci_core_images" "OL7gen1ImageOCID" {
  compartment_id = "${var.compartment_id}"
  operating_system = "Oracle Linux"
  operating_system_version = "7.5"
  #compatible shape:
  shape = "VM.Standard1.1"
}

# Get the OCID for the more recent **Gen 2** Windows Server 2012 disk image
data "oci_core_images" "WS2012gen2ImageOCID" {
  compartment_id = "${var.compartment_id}"
  operating_system = "Windows"
  operating_system_version = "Server 2012 R2 Standard"
  #compatible shape:
  shape = "VM.Standard2.1"
  # get exact image:
  #display_name  = "Windows-Server-2012-R2-Standard-Edition-VM-Gen2-2018.07.19-0"
}

# Get the OCID for the more recent **Gen 1** Windows Server 2012 disk image
data "oci_core_images" "WS2012gen1ImageOCID" {
  compartment_id = "${var.compartment_id}"
  operating_system = "Windows"
  operating_system_version = "Server 2012 R2 Standard"
  #compatible shape:
  shape = "VM.Standard1.1"
  # get exact image:
  #display_name  = "Windows-Server-2012-R2-Standard-Edition-VM-2018.07.19-0"
}# Gets a list of Availability Domains
data "oci_identity_availability_domains" "ADs" {
  compartment_id = "${var.tenancy_ocid}"
}

# Get the OCID for the more recent **Gen2** Oracle Linux 7.5 disk image
data "oci_core_images" "OL7gen2ImageOCID" {
  compartment_id = "${var.compartment_id}"
  operating_system = "Oracle Linux"
  operating_system_version = "7.5"
  #compatible shape:
  shape = "VM.Standard2.1"
}

# Get the OCID for the more recent **Gen1** Oracle Linux 7.5 disk image
data "oci_core_images" "OL7gen1ImageOCID" {
  compartment_id = "${var.compartment_id}"
  operating_system = "Oracle Linux"
  operating_system_version = "7.5"
  #compatible shape:
  shape = "VM.Standard1.1"
}

# Get the OCID for the more recent **Gen 2** Windows Server 2012 disk image
data "oci_core_images" "WS2012gen2ImageOCID" {
  compartment_id = "${var.compartment_id}"
  operating_system = "Windows"
  operating_system_version = "Server 2012 R2 Standard"
  #compatible shape:
  shape = "VM.Standard2.1"
  # get exact image:
  #display_name  = "Windows-Server-2012-R2-Standard-Edition-VM-Gen2-2018.07.19-0"
}

# Get the OCID for the more recent **Gen 1** Windows Server 2012 disk image
data "oci_core_images" "WS2012gen1ImageOCID" {
  compartment_id = "${var.compartment_id}"
  operating_system = "Windows"
  operating_system_version = "Server 2012 R2 Standard"
  #compatible shape:
  shape = "VM.Standard1.1"
  # get exact image:
  #display_name  = "Windows-Server-2012-R2-Standard-Edition-VM-2018.07.19-0"
}# Gets a list of Availability Domains
data "oci_identity_availability_domains" "ADs" {
  compartment_id = "${var.tenancy_ocid}"
}

# Get the OCID for the more recent **Gen2** Oracle Linux 7.5 disk image
data "oci_core_images" "OL7gen2ImageOCID" {
  compartment_id = "${var.compartment_id}"
  operating_system = "Oracle Linux"
  operating_system_version = "7.5"
  #compatible shape:
  shape = "VM.Standard2.1"
}

# Get the OCID for the more recent **Gen1** Oracle Linux 7.5 disk image
data "oci_core_images" "OL7gen1ImageOCID" {
  compartment_id = "${var.compartment_id}"
  operating_system = "Oracle Linux"
  operating_system_version = "7.5"
  #compatible shape:
  shape = "VM.Standard1.1"
}

# Get the OCID for the more recent **Gen 2** Windows Server 2012 disk image
data "oci_core_images" "WS2012gen2ImageOCID" {
  compartment_id = "${var.compartment_id}"
  operating_system = "Windows"
  operating_system_version = "Server 2012 R2 Standard"
  #compatible shape:
  shape = "VM.Standard2.1"
  # get exact image:
  #display_name  = "Windows-Server-2012-R2-Standard-Edition-VM-Gen2-2018.07.19-0"
}

# Get the OCID for the more recent **Gen 1** Windows Server 2012 disk image
data "oci_core_images" "WS2012gen1ImageOCID" {
  compartment_id = "${var.compartment_id}"
  operating_system = "Windows"
  operating_system_version = "Server 2012 R2 Standard"
  #compatible shape:
  shape = "VM.Standard1.1"
  # get exact image:
  #display_name  = "Windows-Server-2012-R2-Standard-Edition-VM-2018.07.19-0"
}# Gets a list of Availability Domains
data "oci_identity_availability_domains" "ADs" {
  compartment_id = "${var.tenancy_ocid}"
}

# Get the OCID for the more recent **Gen2** Oracle Linux 7.5 disk image
data "oci_core_images" "OL7gen2ImageOCID" {
  compartment_id = "${var.compartment_id}"
  operating_system = "Oracle Linux"
  operating_system_version = "7.5"
  #compatible shape:
  shape = "VM.Standard2.1"
}

# Get the OCID for the more recent **Gen1** Oracle Linux 7.5 disk image
data "oci_core_images" "OL7gen1ImageOCID" {
  compartment_id = "${var.compartment_id}"
  operating_system = "Oracle Linux"
  operating_system_version = "7.5"
  #compatible shape:
  shape = "VM.Standard1.1"
}

# Get the OCID for the more recent **Gen 2** Windows Server 2012 disk image
data "oci_core_images" "WS2012gen2ImageOCID" {
  compartment_id = "${var.compartment_id}"
  operating_system = "Windows"
  operating_system_version = "Server 2012 R2 Standard"
  #compatible shape:
  shape = "VM.Standard2.1"
  # get exact image:
  #display_name  = "Windows-Server-2012-R2-Standard-Edition-VM-Gen2-2018.07.19-0"
}

# Get the OCID for the more recent **Gen 1** Windows Server 2012 disk image
data "oci_core_images" "WS2012gen1ImageOCID" {
  compartment_id = "${var.compartment_id}"
  operating_system = "Windows"
  operating_system_version = "Server 2012 R2 Standard"
  #compatible shape:
  shape = "VM.Standard1.1"
  # get exact image:
  #display_name  = "Windows-Server-2012-R2-Standard-Edition-VM-2018.07.19-0"
}# Gets a list of Availability Domains
data "oci_identity_availability_domains" "ADs" {
  compartment_id = "${var.tenancy_ocid}"
}

# Get the OCID for the more recent **Gen2** Oracle Linux 7.5 disk image
data "oci_core_images" "OL7gen2ImageOCID" {
  compartment_id = "${var.compartment_id}"
  operating_system = "Oracle Linux"
  operating_system_version = "7.5"
  #compatible shape:
  shape = "VM.Standard2.1"
}

# Get the OCID for the more recent **Gen1** Oracle Linux 7.5 disk image
data "oci_core_images" "OL7gen1ImageOCID" {
  compartment_id = "${var.compartment_id}"
  operating_system = "Oracle Linux"
  operating_system_version = "7.5"
  #compatible shape:
  shape = "VM.Standard1.1"
}

# Get the OCID for the more recent **Gen 2** Windows Server 2012 disk image
data "oci_core_images" "WS2012gen2ImageOCID" {
  compartment_id = "${var.compartment_id}"
  operating_system = "Windows"
  operating_system_version = "Server 2012 R2 Standard"
  #compatible shape:
  shape = "VM.Standard2.1"
  # get exact image:
  #display_name  = "Windows-Server-2012-R2-Standard-Edition-VM-Gen2-2018.07.19-0"
}

# Get the OCID for the more recent **Gen 1** Windows Server 2012 disk image
data "oci_core_images" "WS2012gen1ImageOCID" {
  compartment_id = "${var.compartment_id}"
  operating_system = "Windows"
  operating_system_version = "Server 2012 R2 Standard"
  #compatible shape:
  shape = "VM.Standard1.1"
  # get exact image:
  #display_name  = "Windows-Server-2012-R2-Standard-Edition-VM-2018.07.19-0"
}# Gets a list of Availability Domains
data "oci_identity_availability_domains" "ADs" {
  compartment_id = "${var.tenancy_ocid}"
}

# Get the OCID for the more recent **Gen2** Oracle Linux 7.5 disk image
data "oci_core_images" "OL7gen2ImageOCID" {
  compartment_id = "${var.compartment_id}"
  operating_system = "Oracle Linux"
  operating_system_version = "7.5"
  #compatible shape:
  shape = "VM.Standard2.1"
}

# Get the OCID for the more recent **Gen1** Oracle Linux 7.5 disk image
data "oci_core_images" "OL7gen1ImageOCID" {
  compartment_id = "${var.compartment_id}"
  operating_system = "Oracle Linux"
  operating_system_version = "7.5"
  #compatible shape:
  shape = "VM.Standard1.1"
}

# Get the OCID for the more recent **Gen 2** Windows Server 2012 disk image
data "oci_core_images" "WS2012gen2ImageOCID" {
  compartment_id = "${var.compartment_id}"
  operating_system = "Windows"
  operating_system_version = "Server 2012 R2 Standard"
  #compatible shape:
  shape = "VM.Standard2.1"
  # get exact image:
  #display_name  = "Windows-Server-2012-R2-Standard-Edition-VM-Gen2-2018.07.19-0"
}

# Get the OCID for the more recent **Gen 1** Windows Server 2012 disk image
data "oci_core_images" "WS2012gen1ImageOCID" {
  compartment_id = "${var.compartment_id}"
  operating_system = "Windows"
  operating_system_version = "Server 2012 R2 Standard"
  #compatible shape:
  shape = "VM.Standard1.1"
  # get exact image:
  #display_name  = "Windows-Server-2012-R2-Standard-Edition-VM-2018.07.19-0"
}