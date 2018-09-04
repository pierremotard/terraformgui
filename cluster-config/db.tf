# Create OCI DB System

variable "db_system_shape" {default = "VM.Standard2.2"}
#variable "cpu_core_count" {default = "2"}
variable "db_edition" {default = "ENTERPRISE_EDITION"}
variable "db_admin_password" {default = "BEstrO0ng_#11"}
variable "db_name" {default = "AMOSdb"}
variable "db_version" {default = "11.2.0.4"}
variable "db_home_display_name" {default = "AMOSDBHome"}
variable "db_disk_redundancy" {default = "HIGH"}
variable "db_system_display_name" {default = "AmosDBSystem"}
variable "hostname" {default = "amosdb1"}
variable "host_user_name" {default = "opc"}
variable "n_character_set" {default = "AL16UTF16"}
variable "character_set" {default = "AL32UTF8"}
variable "db_workload" {default = "OLTP"}
#variable "pdb_name" {default = "PDB1"}
variable "data_storage_size_in_gb" {default = "512"}
variable "license_model" {default = "BRING_YOUR_OWN_LICENSE"}
variable "node_count" {default = "1"}
variable "data_storage_percentage" {default = "40"}

resource "oci_database_db_system" "tf-demo01-DB" {
    availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD - 1],"name")}"
    compartment_id = "${var.compartment_id}"
    #cpu_core_count = "${lookup(data.oci_database_db_system_shapes.test_db_system_shapes.db_system_shapes[0], "minimum_core_count")}"
    #cpu_core_count = 2
    database_edition = "${var.db_edition}"
    db_home {
        database {
            admin_password = "${var.db_admin_password}"
            db_name = "${var.db_name}"
            character_set = "${var.character_set}"
            ncharacter_set = "${var.n_character_set}"
            db_workload = "${var.db_workload}"
            #pdb_name = "${var.pdb_name}"
            db_backup_config {
                auto_backup_enabled = true    
            }
        }
        db_version = "${var.db_version}"
        display_name = "${var.db_home_display_name}"
    }
    disk_redundancy = "${var.db_disk_redundancy}"
    shape = "${var.db_system_shape}"
    subnet_id = "${oci_core_subnet.tf-demo01-private-subnetDB.id}"
    ssh_public_keys = ["${file(var.ssh_public_key_path)}"]
    display_name = "${var.db_system_display_name}"
    hostname = "${var.hostname}"
    data_storage_percentage = "${var.data_storage_percentage}"
    data_storage_size_in_gb = "${var.data_storage_size_in_gb}"
    license_model = "${var.license_model}"
    #node_count = "${lookup(data.oci_database_db_system_shapes.test_db_system_shapes.db_system_shapes[0], "minimum_node_count")}"
    node_count = "${var.node_count}"
}
# Create OCI DB System

variable "db_system_shape" {default = "VM.Standard2.2"}
#variable "cpu_core_count" {default = "2"}
variable "db_edition" {default = "ENTERPRISE_EDITION"}
variable "db_admin_password" {default = "BEstrO0ng_#11"}
variable "db_name" {default = "AMOSdb"}
variable "db_version" {default = "11.2.0.4"}
variable "db_home_display_name" {default = "AMOSDBHome"}
variable "db_disk_redundancy" {default = "HIGH"}
variable "db_system_display_name" {default = "AmosDBSystem"}
variable "hostname" {default = "amosdb1"}
variable "host_user_name" {default = "opc"}
variable "n_character_set" {default = "AL16UTF16"}
variable "character_set" {default = "AL32UTF8"}
variable "db_workload" {default = "OLTP"}
#variable "pdb_name" {default = "PDB1"}
variable "data_storage_size_in_gb" {default = "512"}
variable "license_model" {default = "BRING_YOUR_OWN_LICENSE"}
variable "node_count" {default = "1"}
variable "data_storage_percentage" {default = "40"}

resource "oci_database_db_system" "tf-demo01-DB" {
    availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD - 1],"name")}"
    compartment_id = "${var.compartment_id}"
    #cpu_core_count = "${lookup(data.oci_database_db_system_shapes.test_db_system_shapes.db_system_shapes[0], "minimum_core_count")}"
    #cpu_core_count = 2
    database_edition = "${var.db_edition}"
    db_home {
        database {
            admin_password = "${var.db_admin_password}"
            db_name = "${var.db_name}"
            character_set = "${var.character_set}"
            ncharacter_set = "${var.n_character_set}"
            db_workload = "${var.db_workload}"
            #pdb_name = "${var.pdb_name}"
            db_backup_config {
                auto_backup_enabled = true    
            }
        }
        db_version = "${var.db_version}"
        display_name = "${var.db_home_display_name}"
    }
    disk_redundancy = "${var.db_disk_redundancy}"
    shape = "${var.db_system_shape}"
    subnet_id = "${oci_core_subnet.tf-demo01-private-subnetDB.id}"
    ssh_public_keys = ["${file(var.ssh_public_key_path)}"]
    display_name = "${var.db_system_display_name}"
    hostname = "${var.hostname}"
    data_storage_percentage = "${var.data_storage_percentage}"
    data_storage_size_in_gb = "${var.data_storage_size_in_gb}"
    license_model = "${var.license_model}"
    #node_count = "${lookup(data.oci_database_db_system_shapes.test_db_system_shapes.db_system_shapes[0], "minimum_node_count")}"
    node_count = "${var.node_count}"
}
# Create OCI DB System

variable "db_system_shape" {default = "VM.Standard2.2"}
#variable "cpu_core_count" {default = "2"}
variable "db_edition" {default = "ENTERPRISE_EDITION"}
variable "db_admin_password" {default = "BEstrO0ng_#11"}
variable "db_name" {default = "AMOSdb"}
variable "db_version" {default = "11.2.0.4"}
variable "db_home_display_name" {default = "AMOSDBHome"}
variable "db_disk_redundancy" {default = "HIGH"}
variable "db_system_display_name" {default = "AmosDBSystem"}
variable "hostname" {default = "amosdb1"}
variable "host_user_name" {default = "opc"}
variable "n_character_set" {default = "AL16UTF16"}
variable "character_set" {default = "AL32UTF8"}
variable "db_workload" {default = "OLTP"}
#variable "pdb_name" {default = "PDB1"}
variable "data_storage_size_in_gb" {default = "512"}
variable "license_model" {default = "BRING_YOUR_OWN_LICENSE"}
variable "node_count" {default = "1"}
variable "data_storage_percentage" {default = "40"}

resource "oci_database_db_system" "tf-demo01-DB" {
    availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD - 1],"name")}"
    compartment_id = "${var.compartment_id}"
    #cpu_core_count = "${lookup(data.oci_database_db_system_shapes.test_db_system_shapes.db_system_shapes[0], "minimum_core_count")}"
    #cpu_core_count = 2
    database_edition = "${var.db_edition}"
    db_home {
        database {
            admin_password = "${var.db_admin_password}"
            db_name = "${var.db_name}"
            character_set = "${var.character_set}"
            ncharacter_set = "${var.n_character_set}"
            db_workload = "${var.db_workload}"
            #pdb_name = "${var.pdb_name}"
            db_backup_config {
                auto_backup_enabled = true    
            }
        }
        db_version = "${var.db_version}"
        display_name = "${var.db_home_display_name}"
    }
    disk_redundancy = "${var.db_disk_redundancy}"
    shape = "${var.db_system_shape}"
    subnet_id = "${oci_core_subnet.tf-demo01-private-subnetDB.id}"
    ssh_public_keys = ["${file(var.ssh_public_key_path)}"]
    display_name = "${var.db_system_display_name}"
    hostname = "${var.hostname}"
    data_storage_percentage = "${var.data_storage_percentage}"
    data_storage_size_in_gb = "${var.data_storage_size_in_gb}"
    license_model = "${var.license_model}"
    #node_count = "${lookup(data.oci_database_db_system_shapes.test_db_system_shapes.db_system_shapes[0], "minimum_node_count")}"
    node_count = "${var.node_count}"
}
# Create OCI DB System

variable "db_system_shape" {default = "VM.Standard2.2"}
#variable "cpu_core_count" {default = "2"}
variable "db_edition" {default = "ENTERPRISE_EDITION"}
variable "db_admin_password" {default = "BEstrO0ng_#11"}
variable "db_name" {default = "AMOSdb"}
variable "db_version" {default = "11.2.0.4"}
variable "db_home_display_name" {default = "AMOSDBHome"}
variable "db_disk_redundancy" {default = "HIGH"}
variable "db_system_display_name" {default = "AmosDBSystem"}
variable "hostname" {default = "amosdb1"}
variable "host_user_name" {default = "opc"}
variable "n_character_set" {default = "AL16UTF16"}
variable "character_set" {default = "AL32UTF8"}
variable "db_workload" {default = "OLTP"}
#variable "pdb_name" {default = "PDB1"}
variable "data_storage_size_in_gb" {default = "512"}
variable "license_model" {default = "BRING_YOUR_OWN_LICENSE"}
variable "node_count" {default = "1"}
variable "data_storage_percentage" {default = "40"}

resource "oci_database_db_system" "tf-demo01-DB" {
    availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD - 1],"name")}"
    compartment_id = "${var.compartment_id}"
    #cpu_core_count = "${lookup(data.oci_database_db_system_shapes.test_db_system_shapes.db_system_shapes[0], "minimum_core_count")}"
    #cpu_core_count = 2
    database_edition = "${var.db_edition}"
    db_home {
        database {
            admin_password = "${var.db_admin_password}"
            db_name = "${var.db_name}"
            character_set = "${var.character_set}"
            ncharacter_set = "${var.n_character_set}"
            db_workload = "${var.db_workload}"
            #pdb_name = "${var.pdb_name}"
            db_backup_config {
                auto_backup_enabled = true    
            }
        }
        db_version = "${var.db_version}"
        display_name = "${var.db_home_display_name}"
    }
    disk_redundancy = "${var.db_disk_redundancy}"
    shape = "${var.db_system_shape}"
    subnet_id = "${oci_core_subnet.tf-demo01-private-subnetDB.id}"
    ssh_public_keys = ["${file(var.ssh_public_key_path)}"]
    display_name = "${var.db_system_display_name}"
    hostname = "${var.hostname}"
    data_storage_percentage = "${var.data_storage_percentage}"
    data_storage_size_in_gb = "${var.data_storage_size_in_gb}"
    license_model = "${var.license_model}"
    #node_count = "${lookup(data.oci_database_db_system_shapes.test_db_system_shapes.db_system_shapes[0], "minimum_node_count")}"
    node_count = "${var.node_count}"
}
# Create OCI DB System

variable "db_system_shape" {default = "VM.Standard2.2"}
#variable "cpu_core_count" {default = "2"}
variable "db_edition" {default = "ENTERPRISE_EDITION"}
variable "db_admin_password" {default = "BEstrO0ng_#11"}
variable "db_name" {default = "AMOSdb"}
variable "db_version" {default = "11.2.0.4"}
variable "db_home_display_name" {default = "AMOSDBHome"}
variable "db_disk_redundancy" {default = "HIGH"}
variable "db_system_display_name" {default = "AmosDBSystem"}
variable "hostname" {default = "amosdb1"}
variable "host_user_name" {default = "opc"}
variable "n_character_set" {default = "AL16UTF16"}
variable "character_set" {default = "AL32UTF8"}
variable "db_workload" {default = "OLTP"}
#variable "pdb_name" {default = "PDB1"}
variable "data_storage_size_in_gb" {default = "512"}
variable "license_model" {default = "BRING_YOUR_OWN_LICENSE"}
variable "node_count" {default = "1"}
variable "data_storage_percentage" {default = "40"}

resource "oci_database_db_system" "tf-demo01-DB" {
    availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD - 1],"name")}"
    compartment_id = "${var.compartment_id}"
    #cpu_core_count = "${lookup(data.oci_database_db_system_shapes.test_db_system_shapes.db_system_shapes[0], "minimum_core_count")}"
    #cpu_core_count = 2
    database_edition = "${var.db_edition}"
    db_home {
        database {
            admin_password = "${var.db_admin_password}"
            db_name = "${var.db_name}"
            character_set = "${var.character_set}"
            ncharacter_set = "${var.n_character_set}"
            db_workload = "${var.db_workload}"
            #pdb_name = "${var.pdb_name}"
            db_backup_config {
                auto_backup_enabled = true    
            }
        }
        db_version = "${var.db_version}"
        display_name = "${var.db_home_display_name}"
    }
    disk_redundancy = "${var.db_disk_redundancy}"
    shape = "${var.db_system_shape}"
    subnet_id = "${oci_core_subnet.tf-demo01-private-subnetDB.id}"
    ssh_public_keys = ["${file(var.ssh_public_key_path)}"]
    display_name = "${var.db_system_display_name}"
    hostname = "${var.hostname}"
    data_storage_percentage = "${var.data_storage_percentage}"
    data_storage_size_in_gb = "${var.data_storage_size_in_gb}"
    license_model = "${var.license_model}"
    #node_count = "${lookup(data.oci_database_db_system_shapes.test_db_system_shapes.db_system_shapes[0], "minimum_node_count")}"
    node_count = "${var.node_count}"
}
# Create OCI DB System

variable "db_system_shape" {default = "VM.Standard2.2"}
#variable "cpu_core_count" {default = "2"}
variable "db_edition" {default = "ENTERPRISE_EDITION"}
variable "db_admin_password" {default = "BEstrO0ng_#11"}
variable "db_name" {default = "AMOSdb"}
variable "db_version" {default = "11.2.0.4"}
variable "db_home_display_name" {default = "AMOSDBHome"}
variable "db_disk_redundancy" {default = "HIGH"}
variable "db_system_display_name" {default = "AmosDBSystem"}
variable "hostname" {default = "amosdb1"}
variable "host_user_name" {default = "opc"}
variable "n_character_set" {default = "AL16UTF16"}
variable "character_set" {default = "AL32UTF8"}
variable "db_workload" {default = "OLTP"}
#variable "pdb_name" {default = "PDB1"}
variable "data_storage_size_in_gb" {default = "512"}
variable "license_model" {default = "BRING_YOUR_OWN_LICENSE"}
variable "node_count" {default = "1"}
variable "data_storage_percentage" {default = "40"}

resource "oci_database_db_system" "tf-demo01-DB" {
    availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD - 1],"name")}"
    compartment_id = "${var.compartment_id}"
    #cpu_core_count = "${lookup(data.oci_database_db_system_shapes.test_db_system_shapes.db_system_shapes[0], "minimum_core_count")}"
    #cpu_core_count = 2
    database_edition = "${var.db_edition}"
    db_home {
        database {
            admin_password = "${var.db_admin_password}"
            db_name = "${var.db_name}"
            character_set = "${var.character_set}"
            ncharacter_set = "${var.n_character_set}"
            db_workload = "${var.db_workload}"
            #pdb_name = "${var.pdb_name}"
            db_backup_config {
                auto_backup_enabled = true    
            }
        }
        db_version = "${var.db_version}"
        display_name = "${var.db_home_display_name}"
    }
    disk_redundancy = "${var.db_disk_redundancy}"
    shape = "${var.db_system_shape}"
    subnet_id = "${oci_core_subnet.tf-demo01-private-subnetDB.id}"
    ssh_public_keys = ["${file(var.ssh_public_key_path)}"]
    display_name = "${var.db_system_display_name}"
    hostname = "${var.hostname}"
    data_storage_percentage = "${var.data_storage_percentage}"
    data_storage_size_in_gb = "${var.data_storage_size_in_gb}"
    license_model = "${var.license_model}"
    #node_count = "${lookup(data.oci_database_db_system_shapes.test_db_system_shapes.db_system_shapes[0], "minimum_node_count")}"
    node_count = "${var.node_count}"
}
# Create OCI DB System

variable "db_system_shape" {default = "VM.Standard2.2"}
#variable "cpu_core_count" {default = "2"}
variable "db_edition" {default = "ENTERPRISE_EDITION"}
variable "db_admin_password" {default = "BEstrO0ng_#11"}
variable "db_name" {default = "AMOSdb"}
variable "db_version" {default = "11.2.0.4"}
variable "db_home_display_name" {default = "AMOSDBHome"}
variable "db_disk_redundancy" {default = "HIGH"}
variable "db_system_display_name" {default = "AmosDBSystem"}
variable "hostname" {default = "amosdb1"}
variable "host_user_name" {default = "opc"}
variable "n_character_set" {default = "AL16UTF16"}
variable "character_set" {default = "AL32UTF8"}
variable "db_workload" {default = "OLTP"}
#variable "pdb_name" {default = "PDB1"}
variable "data_storage_size_in_gb" {default = "512"}
variable "license_model" {default = "BRING_YOUR_OWN_LICENSE"}
variable "node_count" {default = "1"}
variable "data_storage_percentage" {default = "40"}

resource "oci_database_db_system" "tf-demo01-DB" {
    availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD - 1],"name")}"
    compartment_id = "${var.compartment_id}"
    #cpu_core_count = "${lookup(data.oci_database_db_system_shapes.test_db_system_shapes.db_system_shapes[0], "minimum_core_count")}"
    #cpu_core_count = 2
    database_edition = "${var.db_edition}"
    db_home {
        database {
            admin_password = "${var.db_admin_password}"
            db_name = "${var.db_name}"
            character_set = "${var.character_set}"
            ncharacter_set = "${var.n_character_set}"
            db_workload = "${var.db_workload}"
            #pdb_name = "${var.pdb_name}"
            db_backup_config {
                auto_backup_enabled = true    
            }
        }
        db_version = "${var.db_version}"
        display_name = "${var.db_home_display_name}"
    }
    disk_redundancy = "${var.db_disk_redundancy}"
    shape = "${var.db_system_shape}"
    subnet_id = "${oci_core_subnet.tf-demo01-private-subnetDB.id}"
    ssh_public_keys = ["${file(var.ssh_public_key_path)}"]
    display_name = "${var.db_system_display_name}"
    hostname = "${var.hostname}"
    data_storage_percentage = "${var.data_storage_percentage}"
    data_storage_size_in_gb = "${var.data_storage_size_in_gb}"
    license_model = "${var.license_model}"
    #node_count = "${lookup(data.oci_database_db_system_shapes.test_db_system_shapes.db_system_shapes[0], "minimum_node_count")}"
    node_count = "${var.node_count}"
}
# Create OCI DB System

variable "db_system_shape" {default = "VM.Standard2.2"}
#variable "cpu_core_count" {default = "2"}
variable "db_edition" {default = "ENTERPRISE_EDITION"}
variable "db_admin_password" {default = "BEstrO0ng_#11"}
variable "db_name" {default = "AMOSdb"}
variable "db_version" {default = "11.2.0.4"}
variable "db_home_display_name" {default = "AMOSDBHome"}
variable "db_disk_redundancy" {default = "HIGH"}
variable "db_system_display_name" {default = "AmosDBSystem"}
variable "hostname" {default = "amosdb1"}
variable "host_user_name" {default = "opc"}
variable "n_character_set" {default = "AL16UTF16"}
variable "character_set" {default = "AL32UTF8"}
variable "db_workload" {default = "OLTP"}
#variable "pdb_name" {default = "PDB1"}
variable "data_storage_size_in_gb" {default = "512"}
variable "license_model" {default = "BRING_YOUR_OWN_LICENSE"}
variable "node_count" {default = "1"}
variable "data_storage_percentage" {default = "40"}

resource "oci_database_db_system" "tf-demo01-DB" {
    availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD - 1],"name")}"
    compartment_id = "${var.compartment_id}"
    #cpu_core_count = "${lookup(data.oci_database_db_system_shapes.test_db_system_shapes.db_system_shapes[0], "minimum_core_count")}"
    #cpu_core_count = 2
    database_edition = "${var.db_edition}"
    db_home {
        database {
            admin_password = "${var.db_admin_password}"
            db_name = "${var.db_name}"
            character_set = "${var.character_set}"
            ncharacter_set = "${var.n_character_set}"
            db_workload = "${var.db_workload}"
            #pdb_name = "${var.pdb_name}"
            db_backup_config {
                auto_backup_enabled = true    
            }
        }
        db_version = "${var.db_version}"
        display_name = "${var.db_home_display_name}"
    }
    disk_redundancy = "${var.db_disk_redundancy}"
    shape = "${var.db_system_shape}"
    subnet_id = "${oci_core_subnet.tf-demo01-private-subnetDB.id}"
    ssh_public_keys = ["${file(var.ssh_public_key_path)}"]
    display_name = "${var.db_system_display_name}"
    hostname = "${var.hostname}"
    data_storage_percentage = "${var.data_storage_percentage}"
    data_storage_size_in_gb = "${var.data_storage_size_in_gb}"
    license_model = "${var.license_model}"
    #node_count = "${lookup(data.oci_database_db_system_shapes.test_db_system_shapes.db_system_shapes[0], "minimum_node_count")}"
    node_count = "${var.node_count}"
}
# Create OCI DB System

variable "db_system_shape" {default = "VM.Standard2.2"}
#variable "cpu_core_count" {default = "2"}
variable "db_edition" {default = "ENTERPRISE_EDITION"}
variable "db_admin_password" {default = "BEstrO0ng_#11"}
variable "db_name" {default = "AMOSdb"}
variable "db_version" {default = "11.2.0.4"}
variable "db_home_display_name" {default = "AMOSDBHome"}
variable "db_disk_redundancy" {default = "HIGH"}
variable "db_system_display_name" {default = "AmosDBSystem"}
variable "hostname" {default = "amosdb1"}
variable "host_user_name" {default = "opc"}
variable "n_character_set" {default = "AL16UTF16"}
variable "character_set" {default = "AL32UTF8"}
variable "db_workload" {default = "OLTP"}
#variable "pdb_name" {default = "PDB1"}
variable "data_storage_size_in_gb" {default = "512"}
variable "license_model" {default = "BRING_YOUR_OWN_LICENSE"}
variable "node_count" {default = "1"}
variable "data_storage_percentage" {default = "40"}

resource "oci_database_db_system" "tf-demo01-DB" {
    availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD - 1],"name")}"
    compartment_id = "${var.compartment_id}"
    #cpu_core_count = "${lookup(data.oci_database_db_system_shapes.test_db_system_shapes.db_system_shapes[0], "minimum_core_count")}"
    #cpu_core_count = 2
    database_edition = "${var.db_edition}"
    db_home {
        database {
            admin_password = "${var.db_admin_password}"
            db_name = "${var.db_name}"
            character_set = "${var.character_set}"
            ncharacter_set = "${var.n_character_set}"
            db_workload = "${var.db_workload}"
            #pdb_name = "${var.pdb_name}"
            db_backup_config {
                auto_backup_enabled = true    
            }
        }
        db_version = "${var.db_version}"
        display_name = "${var.db_home_display_name}"
    }
    disk_redundancy = "${var.db_disk_redundancy}"
    shape = "${var.db_system_shape}"
    subnet_id = "${oci_core_subnet.tf-demo01-private-subnetDB.id}"
    ssh_public_keys = ["${file(var.ssh_public_key_path)}"]
    display_name = "${var.db_system_display_name}"
    hostname = "${var.hostname}"
    data_storage_percentage = "${var.data_storage_percentage}"
    data_storage_size_in_gb = "${var.data_storage_size_in_gb}"
    license_model = "${var.license_model}"
    #node_count = "${lookup(data.oci_database_db_system_shapes.test_db_system_shapes.db_system_shapes[0], "minimum_node_count")}"
    node_count = "${var.node_count}"
}
# Create OCI DB System

variable "db_system_shape" {default = "VM.Standard2.2"}
#variable "cpu_core_count" {default = "2"}
variable "db_edition" {default = "ENTERPRISE_EDITION"}
variable "db_admin_password" {default = "BEstrO0ng_#11"}
variable "db_name" {default = "AMOSdb"}
variable "db_version" {default = "11.2.0.4"}
variable "db_home_display_name" {default = "AMOSDBHome"}
variable "db_disk_redundancy" {default = "HIGH"}
variable "db_system_display_name" {default = "AmosDBSystem"}
variable "hostname" {default = "amosdb1"}
variable "host_user_name" {default = "opc"}
variable "n_character_set" {default = "AL16UTF16"}
variable "character_set" {default = "AL32UTF8"}
variable "db_workload" {default = "OLTP"}
#variable "pdb_name" {default = "PDB1"}
variable "data_storage_size_in_gb" {default = "512"}
variable "license_model" {default = "BRING_YOUR_OWN_LICENSE"}
variable "node_count" {default = "1"}
variable "data_storage_percentage" {default = "40"}

resource "oci_database_db_system" "tf-demo01-DB" {
    availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD - 1],"name")}"
    compartment_id = "${var.compartment_id}"
    #cpu_core_count = "${lookup(data.oci_database_db_system_shapes.test_db_system_shapes.db_system_shapes[0], "minimum_core_count")}"
    #cpu_core_count = 2
    database_edition = "${var.db_edition}"
    db_home {
        database {
            admin_password = "${var.db_admin_password}"
            db_name = "${var.db_name}"
            character_set = "${var.character_set}"
            ncharacter_set = "${var.n_character_set}"
            db_workload = "${var.db_workload}"
            #pdb_name = "${var.pdb_name}"
            db_backup_config {
                auto_backup_enabled = true    
            }
        }
        db_version = "${var.db_version}"
        display_name = "${var.db_home_display_name}"
    }
    disk_redundancy = "${var.db_disk_redundancy}"
    shape = "${var.db_system_shape}"
    subnet_id = "${oci_core_subnet.tf-demo01-private-subnetDB.id}"
    ssh_public_keys = ["${file(var.ssh_public_key_path)}"]
    display_name = "${var.db_system_display_name}"
    hostname = "${var.hostname}"
    data_storage_percentage = "${var.data_storage_percentage}"
    data_storage_size_in_gb = "${var.data_storage_size_in_gb}"
    license_model = "${var.license_model}"
    #node_count = "${lookup(data.oci_database_db_system_shapes.test_db_system_shapes.db_system_shapes[0], "minimum_node_count")}"
    node_count = "${var.node_count}"
}
# Create OCI DB System

variable "db_system_shape" {default = "VM.Standard2.2"}
#variable "cpu_core_count" {default = "2"}
variable "db_edition" {default = "ENTERPRISE_EDITION"}
variable "db_admin_password" {default = "BEstrO0ng_#11"}
variable "db_name" {default = "AMOSdb"}
variable "db_version" {default = "11.2.0.4"}
variable "db_home_display_name" {default = "AMOSDBHome"}
variable "db_disk_redundancy" {default = "HIGH"}
variable "db_system_display_name" {default = "AmosDBSystem"}
variable "hostname" {default = "amosdb1"}
variable "host_user_name" {default = "opc"}
variable "n_character_set" {default = "AL16UTF16"}
variable "character_set" {default = "AL32UTF8"}
variable "db_workload" {default = "OLTP"}
#variable "pdb_name" {default = "PDB1"}
variable "data_storage_size_in_gb" {default = "512"}
variable "license_model" {default = "BRING_YOUR_OWN_LICENSE"}
variable "node_count" {default = "1"}
variable "data_storage_percentage" {default = "40"}

resource "oci_database_db_system" "tf-demo01-DB" {
    availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD - 1],"name")}"
    compartment_id = "${var.compartment_id}"
    #cpu_core_count = "${lookup(data.oci_database_db_system_shapes.test_db_system_shapes.db_system_shapes[0], "minimum_core_count")}"
    #cpu_core_count = 2
    database_edition = "${var.db_edition}"
    db_home {
        database {
            admin_password = "${var.db_admin_password}"
            db_name = "${var.db_name}"
            character_set = "${var.character_set}"
            ncharacter_set = "${var.n_character_set}"
            db_workload = "${var.db_workload}"
            #pdb_name = "${var.pdb_name}"
            db_backup_config {
                auto_backup_enabled = true    
            }
        }
        db_version = "${var.db_version}"
        display_name = "${var.db_home_display_name}"
    }
    disk_redundancy = "${var.db_disk_redundancy}"
    shape = "${var.db_system_shape}"
    subnet_id = "${oci_core_subnet.tf-demo01-private-subnetDB.id}"
    ssh_public_keys = ["${file(var.ssh_public_key_path)}"]
    display_name = "${var.db_system_display_name}"
    hostname = "${var.hostname}"
    data_storage_percentage = "${var.data_storage_percentage}"
    data_storage_size_in_gb = "${var.data_storage_size_in_gb}"
    license_model = "${var.license_model}"
    #node_count = "${lookup(data.oci_database_db_system_shapes.test_db_system_shapes.db_system_shapes[0], "minimum_node_count")}"
    node_count = "${var.node_count}"
}
# Create OCI DB System

variable "db_system_shape" {default = "VM.Standard2.2"}
#variable "cpu_core_count" {default = "2"}
variable "db_edition" {default = "ENTERPRISE_EDITION"}
variable "db_admin_password" {default = "BEstrO0ng_#11"}
variable "db_name" {default = "AMOSdb"}
variable "db_version" {default = "11.2.0.4"}
variable "db_home_display_name" {default = "AMOSDBHome"}
variable "db_disk_redundancy" {default = "HIGH"}
variable "db_system_display_name" {default = "AmosDBSystem"}
variable "hostname" {default = "amosdb1"}
variable "host_user_name" {default = "opc"}
variable "n_character_set" {default = "AL16UTF16"}
variable "character_set" {default = "AL32UTF8"}
variable "db_workload" {default = "OLTP"}
#variable "pdb_name" {default = "PDB1"}
variable "data_storage_size_in_gb" {default = "512"}
variable "license_model" {default = "BRING_YOUR_OWN_LICENSE"}
variable "node_count" {default = "1"}
variable "data_storage_percentage" {default = "40"}

resource "oci_database_db_system" "tf-demo01-DB" {
    availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD - 1],"name")}"
    compartment_id = "${var.compartment_id}"
    #cpu_core_count = "${lookup(data.oci_database_db_system_shapes.test_db_system_shapes.db_system_shapes[0], "minimum_core_count")}"
    #cpu_core_count = 2
    database_edition = "${var.db_edition}"
    db_home {
        database {
            admin_password = "${var.db_admin_password}"
            db_name = "${var.db_name}"
            character_set = "${var.character_set}"
            ncharacter_set = "${var.n_character_set}"
            db_workload = "${var.db_workload}"
            #pdb_name = "${var.pdb_name}"
            db_backup_config {
                auto_backup_enabled = true    
            }
        }
        db_version = "${var.db_version}"
        display_name = "${var.db_home_display_name}"
    }
    disk_redundancy = "${var.db_disk_redundancy}"
    shape = "${var.db_system_shape}"
    subnet_id = "${oci_core_subnet.tf-demo01-private-subnetDB.id}"
    ssh_public_keys = ["${file(var.ssh_public_key_path)}"]
    display_name = "${var.db_system_display_name}"
    hostname = "${var.hostname}"
    data_storage_percentage = "${var.data_storage_percentage}"
    data_storage_size_in_gb = "${var.data_storage_size_in_gb}"
    license_model = "${var.license_model}"
    #node_count = "${lookup(data.oci_database_db_system_shapes.test_db_system_shapes.db_system_shapes[0], "minimum_node_count")}"
    node_count = "${var.node_count}"
}
# Create OCI DB System

variable "db_system_shape" {default = "VM.Standard2.2"}
#variable "cpu_core_count" {default = "2"}
variable "db_edition" {default = "ENTERPRISE_EDITION"}
variable "db_admin_password" {default = "BEstrO0ng_#11"}
variable "db_name" {default = "AMOSdb"}
variable "db_version" {default = "11.2.0.4"}
variable "db_home_display_name" {default = "AMOSDBHome"}
variable "db_disk_redundancy" {default = "HIGH"}
variable "db_system_display_name" {default = "AmosDBSystem"}
variable "hostname" {default = "amosdb1"}
variable "host_user_name" {default = "opc"}
variable "n_character_set" {default = "AL16UTF16"}
variable "character_set" {default = "AL32UTF8"}
variable "db_workload" {default = "OLTP"}
#variable "pdb_name" {default = "PDB1"}
variable "data_storage_size_in_gb" {default = "512"}
variable "license_model" {default = "BRING_YOUR_OWN_LICENSE"}
variable "node_count" {default = "1"}
variable "data_storage_percentage" {default = "40"}

resource "oci_database_db_system" "tf-demo01-DB" {
    availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD - 1],"name")}"
    compartment_id = "${var.compartment_id}"
    #cpu_core_count = "${lookup(data.oci_database_db_system_shapes.test_db_system_shapes.db_system_shapes[0], "minimum_core_count")}"
    #cpu_core_count = 2
    database_edition = "${var.db_edition}"
    db_home {
        database {
            admin_password = "${var.db_admin_password}"
            db_name = "${var.db_name}"
            character_set = "${var.character_set}"
            ncharacter_set = "${var.n_character_set}"
            db_workload = "${var.db_workload}"
            #pdb_name = "${var.pdb_name}"
            db_backup_config {
                auto_backup_enabled = true    
            }
        }
        db_version = "${var.db_version}"
        display_name = "${var.db_home_display_name}"
    }
    disk_redundancy = "${var.db_disk_redundancy}"
    shape = "${var.db_system_shape}"
    subnet_id = "${oci_core_subnet.tf-demo01-private-subnetDB.id}"
    ssh_public_keys = ["${file(var.ssh_public_key_path)}"]
    display_name = "${var.db_system_display_name}"
    hostname = "${var.hostname}"
    data_storage_percentage = "${var.data_storage_percentage}"
    data_storage_size_in_gb = "${var.data_storage_size_in_gb}"
    license_model = "${var.license_model}"
    #node_count = "${lookup(data.oci_database_db_system_shapes.test_db_system_shapes.db_system_shapes[0], "minimum_node_count")}"
    node_count = "${var.node_count}"
}
# Create OCI DB System

variable "db_system_shape" {default = "VM.Standard2.2"}
#variable "cpu_core_count" {default = "2"}
variable "db_edition" {default = "ENTERPRISE_EDITION"}
variable "db_admin_password" {default = "BEstrO0ng_#11"}
variable "db_name" {default = "AMOSdb"}
variable "db_version" {default = "11.2.0.4"}
variable "db_home_display_name" {default = "AMOSDBHome"}
variable "db_disk_redundancy" {default = "HIGH"}
variable "db_system_display_name" {default = "AmosDBSystem"}
variable "hostname" {default = "amosdb1"}
variable "host_user_name" {default = "opc"}
variable "n_character_set" {default = "AL16UTF16"}
variable "character_set" {default = "AL32UTF8"}
variable "db_workload" {default = "OLTP"}
#variable "pdb_name" {default = "PDB1"}
variable "data_storage_size_in_gb" {default = "512"}
variable "license_model" {default = "BRING_YOUR_OWN_LICENSE"}
variable "node_count" {default = "1"}
variable "data_storage_percentage" {default = "40"}

resource "oci_database_db_system" "tf-demo01-DB" {
    availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD - 1],"name")}"
    compartment_id = "${var.compartment_id}"
    #cpu_core_count = "${lookup(data.oci_database_db_system_shapes.test_db_system_shapes.db_system_shapes[0], "minimum_core_count")}"
    #cpu_core_count = 2
    database_edition = "${var.db_edition}"
    db_home {
        database {
            admin_password = "${var.db_admin_password}"
            db_name = "${var.db_name}"
            character_set = "${var.character_set}"
            ncharacter_set = "${var.n_character_set}"
            db_workload = "${var.db_workload}"
            #pdb_name = "${var.pdb_name}"
            db_backup_config {
                auto_backup_enabled = true    
            }
        }
        db_version = "${var.db_version}"
        display_name = "${var.db_home_display_name}"
    }
    disk_redundancy = "${var.db_disk_redundancy}"
    shape = "${var.db_system_shape}"
    subnet_id = "${oci_core_subnet.tf-demo01-private-subnetDB.id}"
    ssh_public_keys = ["${file(var.ssh_public_key_path)}"]
    display_name = "${var.db_system_display_name}"
    hostname = "${var.hostname}"
    data_storage_percentage = "${var.data_storage_percentage}"
    data_storage_size_in_gb = "${var.data_storage_size_in_gb}"
    license_model = "${var.license_model}"
    #node_count = "${lookup(data.oci_database_db_system_shapes.test_db_system_shapes.db_system_shapes[0], "minimum_node_count")}"
    node_count = "${var.node_count}"
}
# Create OCI DB System

variable "db_system_shape" {default = "VM.Standard2.2"}
#variable "cpu_core_count" {default = "2"}
variable "db_edition" {default = "ENTERPRISE_EDITION"}
variable "db_admin_password" {default = "BEstrO0ng_#11"}
variable "db_name" {default = "AMOSdb"}
variable "db_version" {default = "11.2.0.4"}
variable "db_home_display_name" {default = "AMOSDBHome"}
variable "db_disk_redundancy" {default = "HIGH"}
variable "db_system_display_name" {default = "AmosDBSystem"}
variable "hostname" {default = "amosdb1"}
variable "host_user_name" {default = "opc"}
variable "n_character_set" {default = "AL16UTF16"}
variable "character_set" {default = "AL32UTF8"}
variable "db_workload" {default = "OLTP"}
#variable "pdb_name" {default = "PDB1"}
variable "data_storage_size_in_gb" {default = "512"}
variable "license_model" {default = "BRING_YOUR_OWN_LICENSE"}
variable "node_count" {default = "1"}
variable "data_storage_percentage" {default = "40"}

resource "oci_database_db_system" "tf-demo01-DB" {
    availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD - 1],"name")}"
    compartment_id = "${var.compartment_id}"
    #cpu_core_count = "${lookup(data.oci_database_db_system_shapes.test_db_system_shapes.db_system_shapes[0], "minimum_core_count")}"
    #cpu_core_count = 2
    database_edition = "${var.db_edition}"
    db_home {
        database {
            admin_password = "${var.db_admin_password}"
            db_name = "${var.db_name}"
            character_set = "${var.character_set}"
            ncharacter_set = "${var.n_character_set}"
            db_workload = "${var.db_workload}"
            #pdb_name = "${var.pdb_name}"
            db_backup_config {
                auto_backup_enabled = true    
            }
        }
        db_version = "${var.db_version}"
        display_name = "${var.db_home_display_name}"
    }
    disk_redundancy = "${var.db_disk_redundancy}"
    shape = "${var.db_system_shape}"
    subnet_id = "${oci_core_subnet.tf-demo01-private-subnetDB.id}"
    ssh_public_keys = ["${file(var.ssh_public_key_path)}"]
    display_name = "${var.db_system_display_name}"
    hostname = "${var.hostname}"
    data_storage_percentage = "${var.data_storage_percentage}"
    data_storage_size_in_gb = "${var.data_storage_size_in_gb}"
    license_model = "${var.license_model}"
    #node_count = "${lookup(data.oci_database_db_system_shapes.test_db_system_shapes.db_system_shapes[0], "minimum_node_count")}"
    node_count = "${var.node_count}"
}
# Create OCI DB System

variable "db_system_shape" {default = "VM.Standard2.2"}
#variable "cpu_core_count" {default = "2"}
variable "db_edition" {default = "ENTERPRISE_EDITION"}
variable "db_admin_password" {default = "BEstrO0ng_#11"}
variable "db_name" {default = "AMOSdb"}
variable "db_version" {default = "11.2.0.4"}
variable "db_home_display_name" {default = "AMOSDBHome"}
variable "db_disk_redundancy" {default = "HIGH"}
variable "db_system_display_name" {default = "AmosDBSystem"}
variable "hostname" {default = "amosdb1"}
variable "host_user_name" {default = "opc"}
variable "n_character_set" {default = "AL16UTF16"}
variable "character_set" {default = "AL32UTF8"}
variable "db_workload" {default = "OLTP"}
#variable "pdb_name" {default = "PDB1"}
variable "data_storage_size_in_gb" {default = "512"}
variable "license_model" {default = "BRING_YOUR_OWN_LICENSE"}
variable "node_count" {default = "1"}
variable "data_storage_percentage" {default = "40"}

resource "oci_database_db_system" "tf-demo01-DB" {
    availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD - 1],"name")}"
    compartment_id = "${var.compartment_id}"
    #cpu_core_count = "${lookup(data.oci_database_db_system_shapes.test_db_system_shapes.db_system_shapes[0], "minimum_core_count")}"
    #cpu_core_count = 2
    database_edition = "${var.db_edition}"
    db_home {
        database {
            admin_password = "${var.db_admin_password}"
            db_name = "${var.db_name}"
            character_set = "${var.character_set}"
            ncharacter_set = "${var.n_character_set}"
            db_workload = "${var.db_workload}"
            #pdb_name = "${var.pdb_name}"
            db_backup_config {
                auto_backup_enabled = true    
            }
        }
        db_version = "${var.db_version}"
        display_name = "${var.db_home_display_name}"
    }
    disk_redundancy = "${var.db_disk_redundancy}"
    shape = "${var.db_system_shape}"
    subnet_id = "${oci_core_subnet.tf-demo01-private-subnetDB.id}"
    ssh_public_keys = ["${file(var.ssh_public_key_path)}"]
    display_name = "${var.db_system_display_name}"
    hostname = "${var.hostname}"
    data_storage_percentage = "${var.data_storage_percentage}"
    data_storage_size_in_gb = "${var.data_storage_size_in_gb}"
    license_model = "${var.license_model}"
    #node_count = "${lookup(data.oci_database_db_system_shapes.test_db_system_shapes.db_system_shapes[0], "minimum_node_count")}"
    node_count = "${var.node_count}"
}
# Create OCI DB System

variable "db_system_shape" {default = "VM.Standard2.2"}
#variable "cpu_core_count" {default = "2"}
variable "db_edition" {default = "ENTERPRISE_EDITION"}
variable "db_admin_password" {default = "BEstrO0ng_#11"}
variable "db_name" {default = "AMOSdb"}
variable "db_version" {default = "11.2.0.4"}
variable "db_home_display_name" {default = "AMOSDBHome"}
variable "db_disk_redundancy" {default = "HIGH"}
variable "db_system_display_name" {default = "AmosDBSystem"}
variable "hostname" {default = "amosdb1"}
variable "host_user_name" {default = "opc"}
variable "n_character_set" {default = "AL16UTF16"}
variable "character_set" {default = "AL32UTF8"}
variable "db_workload" {default = "OLTP"}
#variable "pdb_name" {default = "PDB1"}
variable "data_storage_size_in_gb" {default = "512"}
variable "license_model" {default = "BRING_YOUR_OWN_LICENSE"}
variable "node_count" {default = "1"}
variable "data_storage_percentage" {default = "40"}

resource "oci_database_db_system" "tf-demo01-DB" {
    availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD - 1],"name")}"
    compartment_id = "${var.compartment_id}"
    #cpu_core_count = "${lookup(data.oci_database_db_system_shapes.test_db_system_shapes.db_system_shapes[0], "minimum_core_count")}"
    #cpu_core_count = 2
    database_edition = "${var.db_edition}"
    db_home {
        database {
            admin_password = "${var.db_admin_password}"
            db_name = "${var.db_name}"
            character_set = "${var.character_set}"
            ncharacter_set = "${var.n_character_set}"
            db_workload = "${var.db_workload}"
            #pdb_name = "${var.pdb_name}"
            db_backup_config {
                auto_backup_enabled = true    
            }
        }
        db_version = "${var.db_version}"
        display_name = "${var.db_home_display_name}"
    }
    disk_redundancy = "${var.db_disk_redundancy}"
    shape = "${var.db_system_shape}"
    subnet_id = "${oci_core_subnet.tf-demo01-private-subnetDB.id}"
    ssh_public_keys = ["${file(var.ssh_public_key_path)}"]
    display_name = "${var.db_system_display_name}"
    hostname = "${var.hostname}"
    data_storage_percentage = "${var.data_storage_percentage}"
    data_storage_size_in_gb = "${var.data_storage_size_in_gb}"
    license_model = "${var.license_model}"
    #node_count = "${lookup(data.oci_database_db_system_shapes.test_db_system_shapes.db_system_shapes[0], "minimum_node_count")}"
    node_count = "${var.node_count}"
}
# Create OCI DB System

variable "db_system_shape" {default = "VM.Standard2.2"}
#variable "cpu_core_count" {default = "2"}
variable "db_edition" {default = "ENTERPRISE_EDITION"}
variable "db_admin_password" {default = "BEstrO0ng_#11"}
variable "db_name" {default = "AMOSdb"}
variable "db_version" {default = "11.2.0.4"}
variable "db_home_display_name" {default = "AMOSDBHome"}
variable "db_disk_redundancy" {default = "HIGH"}
variable "db_system_display_name" {default = "AmosDBSystem"}
variable "hostname" {default = "amosdb1"}
variable "host_user_name" {default = "opc"}
variable "n_character_set" {default = "AL16UTF16"}
variable "character_set" {default = "AL32UTF8"}
variable "db_workload" {default = "OLTP"}
#variable "pdb_name" {default = "PDB1"}
variable "data_storage_size_in_gb" {default = "512"}
variable "license_model" {default = "BRING_YOUR_OWN_LICENSE"}
variable "node_count" {default = "1"}
variable "data_storage_percentage" {default = "40"}

resource "oci_database_db_system" "tf-demo01-DB" {
    availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD - 1],"name")}"
    compartment_id = "${var.compartment_id}"
    #cpu_core_count = "${lookup(data.oci_database_db_system_shapes.test_db_system_shapes.db_system_shapes[0], "minimum_core_count")}"
    #cpu_core_count = 2
    database_edition = "${var.db_edition}"
    db_home {
        database {
            admin_password = "${var.db_admin_password}"
            db_name = "${var.db_name}"
            character_set = "${var.character_set}"
            ncharacter_set = "${var.n_character_set}"
            db_workload = "${var.db_workload}"
            #pdb_name = "${var.pdb_name}"
            db_backup_config {
                auto_backup_enabled = true    
            }
        }
        db_version = "${var.db_version}"
        display_name = "${var.db_home_display_name}"
    }
    disk_redundancy = "${var.db_disk_redundancy}"
    shape = "${var.db_system_shape}"
    subnet_id = "${oci_core_subnet.tf-demo01-private-subnetDB.id}"
    ssh_public_keys = ["${file(var.ssh_public_key_path)}"]
    display_name = "${var.db_system_display_name}"
    hostname = "${var.hostname}"
    data_storage_percentage = "${var.data_storage_percentage}"
    data_storage_size_in_gb = "${var.data_storage_size_in_gb}"
    license_model = "${var.license_model}"
    #node_count = "${lookup(data.oci_database_db_system_shapes.test_db_system_shapes.db_system_shapes[0], "minimum_node_count")}"
    node_count = "${var.node_count}"
}
# Create OCI DB System

variable "db_system_shape" {default = "VM.Standard2.2"}
#variable "cpu_core_count" {default = "2"}
variable "db_edition" {default = "ENTERPRISE_EDITION"}
variable "db_admin_password" {default = "BEstrO0ng_#11"}
variable "db_name" {default = "AMOSdb"}
variable "db_version" {default = "11.2.0.4"}
variable "db_home_display_name" {default = "AMOSDBHome"}
variable "db_disk_redundancy" {default = "HIGH"}
variable "db_system_display_name" {default = "AmosDBSystem"}
variable "hostname" {default = "amosdb1"}
variable "host_user_name" {default = "opc"}
variable "n_character_set" {default = "AL16UTF16"}
variable "character_set" {default = "AL32UTF8"}
variable "db_workload" {default = "OLTP"}
#variable "pdb_name" {default = "PDB1"}
variable "data_storage_size_in_gb" {default = "512"}
variable "license_model" {default = "BRING_YOUR_OWN_LICENSE"}
variable "node_count" {default = "1"}
variable "data_storage_percentage" {default = "40"}

resource "oci_database_db_system" "tf-demo01-DB" {
    availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD - 1],"name")}"
    compartment_id = "${var.compartment_id}"
    #cpu_core_count = "${lookup(data.oci_database_db_system_shapes.test_db_system_shapes.db_system_shapes[0], "minimum_core_count")}"
    #cpu_core_count = 2
    database_edition = "${var.db_edition}"
    db_home {
        database {
            admin_password = "${var.db_admin_password}"
            db_name = "${var.db_name}"
            character_set = "${var.character_set}"
            ncharacter_set = "${var.n_character_set}"
            db_workload = "${var.db_workload}"
            #pdb_name = "${var.pdb_name}"
            db_backup_config {
                auto_backup_enabled = true    
            }
        }
        db_version = "${var.db_version}"
        display_name = "${var.db_home_display_name}"
    }
    disk_redundancy = "${var.db_disk_redundancy}"
    shape = "${var.db_system_shape}"
    subnet_id = "${oci_core_subnet.tf-demo01-private-subnetDB.id}"
    ssh_public_keys = ["${file(var.ssh_public_key_path)}"]
    display_name = "${var.db_system_display_name}"
    hostname = "${var.hostname}"
    data_storage_percentage = "${var.data_storage_percentage}"
    data_storage_size_in_gb = "${var.data_storage_size_in_gb}"
    license_model = "${var.license_model}"
    #node_count = "${lookup(data.oci_database_db_system_shapes.test_db_system_shapes.db_system_shapes[0], "minimum_node_count")}"
    node_count = "${var.node_count}"
}
