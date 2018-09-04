package application;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class GenFiles {

    public static void generateFiles() throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter("cluster-config/data.tf", true))) {
            writer.write(
                    "# Gets a list of Availability Domains\n" + 
                    "data \"oci_identity_availability_domains\" \"ADs\" {\n" + 
                    "  compartment_id = \"${var.tenancy_ocid}\"\n" + 
                    "}\n" + 
                    "\n" + 
                    "# Get the OCID for the more recent **Gen2** Oracle Linux 7.5 disk image\n" + 
                    "data \"oci_core_images\" \"OL7gen2ImageOCID\" {\n" + 
                    "  compartment_id = \"${var.compartment_id}\"\n" + 
                    "  operating_system = \"Oracle Linux\"\n" + 
                    "  operating_system_version = \"7.5\"\n" + 
                    "  #compatible shape:\n" + 
                    "  shape = \"VM.Standard2.1\"\n" + 
                    "}\n" + 
                    "\n" + 
                    "# Get the OCID for the more recent **Gen1** Oracle Linux 7.5 disk image\n" + 
                    "data \"oci_core_images\" \"OL7gen1ImageOCID\" {\n" + 
                    "  compartment_id = \"${var.compartment_id}\"\n" + 
                    "  operating_system = \"Oracle Linux\"\n" + 
                    "  operating_system_version = \"7.5\"\n" + 
                    "  #compatible shape:\n" + 
                    "  shape = \"VM.Standard1.1\"\n" + 
                    "}\n" + 
                    "\n" + 
                    "# Get the OCID for the more recent **Gen 2** Windows Server 2012 disk image\n" + 
                    "data \"oci_core_images\" \"WS2012gen2ImageOCID\" {\n" + 
                    "  compartment_id = \"${var.compartment_id}\"\n" + 
                    "  operating_system = \"Windows\"\n" + 
                    "  operating_system_version = \"Server 2012 R2 Standard\"\n" + 
                    "  #compatible shape:\n" + 
                    "  shape = \"VM.Standard2.1\"\n" + 
                    "  # get exact image:\n" + 
                    "  #display_name  = \"Windows-Server-2012-R2-Standard-Edition-VM-Gen2-2018.07.19-0\"\n" + 
                    "}\n" + 
                    "\n" + 
                    "# Get the OCID for the more recent **Gen 1** Windows Server 2012 disk image\n" + 
                    "data \"oci_core_images\" \"WS2012gen1ImageOCID\" {\n" + 
                    "  compartment_id = \"${var.compartment_id}\"\n" + 
                    "  operating_system = \"Windows\"\n" + 
                    "  operating_system_version = \"Server 2012 R2 Standard\"\n" + 
                    "  #compatible shape:\n" + 
                    "  shape = \"VM.Standard1.1\"\n" + 
                    "  # get exact image:\n" + 
                    "  #display_name  = \"Windows-Server-2012-R2-Standard-Edition-VM-2018.07.19-0\"\n" + 
                    "}");
            
        }
        
        try (BufferedWriter writer = new BufferedWriter(new FileWriter("cluster-config/db.tf", true))) {
            writer.write(
                    "# Create OCI DB System\n" + 
                    "\n" + 
                    "variable \"db_system_shape\" {default = \"VM.Standard2.2\"}\n" + 
                    "#variable \"cpu_core_count\" {default = \"2\"}\n" + 
                    "variable \"db_edition\" {default = \"ENTERPRISE_EDITION\"}\n" + 
                    "variable \"db_admin_password\" {default = \"BEstrO0ng_#11\"}\n" + 
                    "variable \"db_name\" {default = \"AMOSdb\"}\n" + 
                    "variable \"db_version\" {default = \"11.2.0.4\"}\n" + 
                    "variable \"db_home_display_name\" {default = \"AMOSDBHome\"}\n" + 
                    "variable \"db_disk_redundancy\" {default = \"HIGH\"}\n" + 
                    "variable \"db_system_display_name\" {default = \"AmosDBSystem\"}\n" + 
                    "variable \"hostname\" {default = \"amosdb1\"}\n" + 
                    "variable \"host_user_name\" {default = \"opc\"}\n" + 
                    "variable \"n_character_set\" {default = \"AL16UTF16\"}\n" + 
                    "variable \"character_set\" {default = \"AL32UTF8\"}\n" + 
                    "variable \"db_workload\" {default = \"OLTP\"}\n" + 
                    "#variable \"pdb_name\" {default = \"PDB1\"}\n" + 
                    "variable \"data_storage_size_in_gb\" {default = \"512\"}\n" + 
                    "variable \"license_model\" {default = \"BRING_YOUR_OWN_LICENSE\"}\n" + 
                    "variable \"node_count\" {default = \"1\"}\n" + 
                    "variable \"data_storage_percentage\" {default = \"40\"}\n" + 
                    "\n" + 
                    "resource \"oci_database_db_system\" \"tf-demo01-DB\" {\n" + 
                    "    availability_domain = \"${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD - 1],\"name\")}\"\n" + 
                    "    compartment_id = \"${var.compartment_id}\"\n" + 
                    "    #cpu_core_count = \"${lookup(data.oci_database_db_system_shapes.test_db_system_shapes.db_system_shapes[0], \"minimum_core_count\")}\"\n" + 
                    "    #cpu_core_count = 2\n" + 
                    "    database_edition = \"${var.db_edition}\"\n" + 
                    "    db_home {\n" + 
                    "        database {\n" + 
                    "            admin_password = \"${var.db_admin_password}\"\n" + 
                    "            db_name = \"${var.db_name}\"\n" + 
                    "            character_set = \"${var.character_set}\"\n" + 
                    "            ncharacter_set = \"${var.n_character_set}\"\n" + 
                    "            db_workload = \"${var.db_workload}\"\n" + 
                    "            #pdb_name = \"${var.pdb_name}\"\n" + 
                    "            db_backup_config {\n" + 
                    "                auto_backup_enabled = true    \n" + 
                    "            }\n" + 
                    "        }\n" + 
                    "        db_version = \"${var.db_version}\"\n" + 
                    "        display_name = \"${var.db_home_display_name}\"\n" + 
                    "    }\n" + 
                    "    disk_redundancy = \"${var.db_disk_redundancy}\"\n" + 
                    "    shape = \"${var.db_system_shape}\"\n" + 
                    "    subnet_id = \"${oci_core_subnet.tf-demo01-private-subnetDB.id}\"\n" + 
                    "    ssh_public_keys = [\"${file(var.ssh_public_key_path)}\"]\n" + 
                    "    display_name = \"${var.db_system_display_name}\"\n" + 
                    "    hostname = \"${var.hostname}\"\n" + 
                    "    data_storage_percentage = \"${var.data_storage_percentage}\"\n" + 
                    "    data_storage_size_in_gb = \"${var.data_storage_size_in_gb}\"\n" + 
                    "    license_model = \"${var.license_model}\"\n" + 
                    "    #node_count = \"${lookup(data.oci_database_db_system_shapes.test_db_system_shapes.db_system_shapes[0], \"minimum_node_count\")}\"\n" + 
                    "    node_count = \"${var.node_count}\"\n" + 
                    "}\n" + 
                    "");
            
        }
        
        
        try (BufferedWriter writer = new BufferedWriter(new FileWriter("cluster-config/output.tf", true))) {
            writer.write(
                    "# Display the output data \n" + 
                    "output \" Public IP of bastion instance \" {\n" + 
                    "  value = [\"${oci_core_instance.tf-demo01-bastion.public_ip}\"]\n" + 
                    "}\n" + 
                    "output \" Private IP of app server instance \" {\n" + 
                    "  value = [\"${oci_core_instance.tf-demo01-amosapp.private_ip}\"]\n" + 
                    "}\n" + 
                    "output \" Public IP of citrix instance \" {\n" + 
                    "  value = [\"${oci_core_instance.tf-demo01-citrix.public_ip}\"]\n" + 
                    "}\n" + 
                    "output \"Windows Username\" {\n" + 
                    "  value = [\"${data.oci_core_instance_credentials.InstanceCredentials.username}\"]\n" + 
                    "}\n" + 
                    "output \"Temporary Windows Password\" {\n" + 
                    "  value = [\"${data.oci_core_instance_credentials.InstanceCredentials.password}\"]\n" + 
                    "}");
        }
        
        try (BufferedWriter writer = new BufferedWriter(new FileWriter("cluster-config/provider.tf", true))) {
            writer.write(
                    "provider \"oci\" {\n" + 
                    "  tenancy_ocid     = \"${var.tenancy_ocid}\"\n" + 
                    "  user_ocid        = \"${var.user_ocid}\"\n" + 
                    "  fingerprint      = \"${var.fingerprint}\"\n" + 
                    "  private_key_path = \"${var.private_key_path}\"\n" + 
                    "  region           = \"${var.region}\"\n" + 
                    "}\n" + 
                    "");
        }
        
        try (BufferedWriter writer = new BufferedWriter(new FileWriter("cluster-config/vars.tf", true))) {
            writer.write(
                    "########### COMMON VARIABLES ##########################\n" + 
                    "\n" + 
                    "## Provider variables definition\n" + 
                    "variable \"tenancy_ocid\" {}\n" + 
                    "variable \"user_ocid\" {}\n" + 
                    "variable \"fingerprint\" {}\n" + 
                    "variable \"private_key_path\" {}\n" + 
                    "variable \"region\" {}\n" + 
                    "\n" + 
                    "\n" + 
                    "### Compartment\n" + 
                    "variable \"compartment_id\" {}\n" + 
                    "\n" + 
                    "### AD (1, 2 or 3)\n" + 
                    "variable \"AD\" {}\n" + 
                    "\n" + 
                    "#variable \"vcn_id\" {} ### Virtual Cloud Network\n" + 
                    "#variable \"subnet1_id\" {} ### Subnet 1 in AD-1\n" + 
                    "\n" + 
                    "### Oracle-Linux-7.5-2018.05.09-1\n" + 
                    "#variable \"oracle_linux7_5image_id\" {}\n" + 
                    "\n" + 
                    "### Public/private keys used on the instance\n" + 
                    "variable \"ssh_private_key_path\" {}\n" + 
                    "variable \"ssh_public_key_path\" {}\n" + 
                    "\n" + 
                    "#VCN\n" + 
                    "variable \"VCN-CIDR\" {}");
        }
        
        try (BufferedWriter writer = new BufferedWriter(new FileWriter("cluster-config/provider.tf", true))) {
            writer.write(
                    "provider \"oci\" {\n" + 
                    "  tenancy_ocid     = \"${var.tenancy_ocid}\"\n" + 
                    "  user_ocid        = \"${var.user_ocid}\"\n" + 
                    "  fingerprint      = \"${var.fingerprint}\"\n" + 
                    "  private_key_path = \"${var.private_key_path}\"\n" + 
                    "  region           = \"${var.region}\"\n" + 
                    "}\n" + 
                    "");
        }
        
    }
    
    
}
