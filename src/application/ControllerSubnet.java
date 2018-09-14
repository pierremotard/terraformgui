package application;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.TextField;

public class ControllerSubnet extends Controller {

    public ControllerSubnet() {
        // TODO Auto-generated constructor stub
    }
    
    @FXML private TextField subnetNameField;
    @FXML private TextField dnsLabelField;
    @FXML private ChoiceBox<String> ADChoice;
    @FXML private ChoiceBox<Boolean> prohibitIpChoice;
    @FXML private TextField cidrBlockField;
    @FXML private ChoiceBox<SecurityList> securityListChoice;
    @FXML private ChoiceBox<String> dhcpOptionsChoice;
    
    
    public static ObservableList<Boolean> truefalselist = FXCollections.observableArrayList(true, false);
    public static ObservableList<Subnet> subnetList = FXCollections.observableArrayList();
    public static ObservableList<String> ADList = FXCollections.observableArrayList("1", "2", "3");
    public static ObservableList<String> dhcpList = FXCollections.observableArrayList("default");
    
    @FXML
    public void initialize() {
        prohibitIpChoice.setVisible(truefalselist.get(0));
        prohibitIpChoice.setItems(truefalselist);
        
        securityListChoice.setItems(ControllerSecurityList.getSecList());
        
        ADChoice.setItems(ADList);
        ADChoice.setValue(ADList.get(0));
        
        dhcpOptionsChoice.setItems(dhcpList);
        dhcpOptionsChoice.setValue(dhcpList.get(0));
    }
    
    @FXML
    public void addSubnetClicked(ActionEvent event) throws IOException {
        String text = "resource \"oci_core_subnet\" \"" + subnetNameField.getText() + "\" {\n" + 
                "  availability_domain = \"${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD - " + ADChoice.getValue() + "],\"name\")}\"\n" + 
                "  prohibit_public_ip_on_vnic = " + prohibitIpChoice.getValue() + "\n" + 
                "  cidr_block = \"${lookup(var.network_cidrs, \"" + subnetNameField.getText() + "-CIDR\")}\"\n" + 
                "  display_name = \"" + subnetNameField.getText() + "\"\n" + 
                "  dns_label = \"" + dnsLabelField.getText() + "\"\n" + 
                "  compartment_id = \"${var.compartment_id}\"\n" + 
                "  vcn_id = \"${oci_core_virtual_network." + ControllerNetwork.getVcn() + ".id}\"\n" + 
                "  route_table_id = \"${oci_core_route_table.routetable.id}\"\n" + 
                "  security_list_ids = [\"${oci_core_security_list." + securityListChoice.getValue() + ".id}\"]\n" + 
                "  dhcp_options_id = \"${oci_core_virtual_network." + ControllerNetwork.getVcn() + ".default_dhcp_options_id}\"\n" + 
                "}\n\n" + 
                "";
        super.addComponentClicked(event, text, "view/Subnet.fxml");
        
        subnetList.add(new Subnet(subnetNameField.getText()));
        
        /*
        subnetList.add(new Subnet(subnetNameField.getText(), ADField.getText(), prohibitIpChoice.getValue(), 
                        cidrBlockField.getText(), securityListChoice.getValue()));
        */
        
        try (BufferedWriter writer = new BufferedWriter(new FileWriter("infra-config/vars.tf", true))) {
            writer.write("      " + subnetNameField.getText() + "-CIDR = \"" + cidrBlockField.getText() + "\" \n");
        }
        
    }
    
    public void nextButtonClicked(ActionEvent event) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter("infra-config/vars.tf", true))) {
            writer.write("  }\n" + "}");
        }
        super.nextClicked(event, "view/Compute.fxml");
        
        
    }
    
    

}
