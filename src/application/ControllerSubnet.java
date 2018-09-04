package application;

import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

public class ControllerSubnet {

    public ControllerSubnet() {
        // TODO Auto-generated constructor stub
    }
    
    @FXML private TextField subnetNameField;
    @FXML private TextField dnsLabelField;
    @FXML private TextField ADField;
    @FXML private ChoiceBox<Boolean> prohibitIpChoice;
    @FXML private TextField cidrBlockField;
    @FXML private ChoiceBox<SecurityList> securityListChoice;
    @FXML private ChoiceBox<String> dhcpOptionsChoice;
    
    
    public static ObservableList<Boolean> truefalselist = FXCollections.observableArrayList(true, false);
    
    public static ObservableList<Subnet> subnetList = FXCollections.observableArrayList();
    
    public static ObservableList<String> dhcpList = FXCollections.observableArrayList("default");
    
    @FXML
    public void initialize() {
        prohibitIpChoice.setVisible(truefalselist.get(0));
        prohibitIpChoice.setItems(truefalselist);
        
        securityListChoice.setItems(ControllerSecurityList.getSecList());
        
        dhcpOptionsChoice.setItems(dhcpList);
        dhcpOptionsChoice.setValue(dhcpList.get(0));
    }
    
    
    @FXML
    public void addSubnetClicked(ActionEvent event) throws IOException {
        Parent networkParent = FXMLLoader.load(getClass().getResource("view/Subnet.fxml"));
        Scene subnetScene = new Scene(networkParent);
        
        subnetList.add(new Subnet(subnetNameField.getText()));
        
        /*
        subnetList.add(new Subnet(subnetNameField.getText(), ADField.getText(), prohibitIpChoice.getValue(), 
                        cidrBlockField.getText(), securityListChoice.getValue()));
        */
        // Gets stage information
        Stage window = (Stage) ((Node) event.getSource()).getScene().getWindow();
        window.setScene(subnetScene);
        window.show();
        
        try (BufferedWriter writer = new BufferedWriter(new FileWriter("vars-values.auto.tfvars", true))) {
            writer.write(subnetNameField.getText() + "-CIDR = \"" + cidrBlockField.getText() + "\" \n");
        }
        
        try (BufferedWriter writer = new BufferedWriter(new FileWriter("resource.tf", true))) {
            writer.write(
                    "resource \"oci_core_subnet\" \"" + subnetNameField.getText() + "\" {\n" + 
                    "  availability_domain = \"${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD - 1],\"name\")}\"\n" + 
                    "  prohibit_public_ip_on_vnic = " + prohibitIpChoice.getValue() + "\n" + 
                    "  cidr_block = \"${var.subnetDMZ-CIDR}\"\n" + 
                    "  display_name = \"" + subnetNameField.getText() + "\"\n" + 
                    "  dns_label = \"" + dnsLabelField.getText() + "\"\n" + 
                    "  compartment_id = \"${var.compartment_id}\"\n" + 
                    "  vcn_id = \"${oci_core_virtual_network." + ControllerNetwork.getVcn() + ".id}\"\n" + 
                    "  route_table_id = \"${oci_core_route_table.routetable.id}\"\n" + 
                    "  security_list_ids = [\"${oci_core_security_list." + securityListChoice.getValue() + ".id}\"]\n" + 
                    "  dhcp_options_id = \"${oci_core_virtual_network." + ControllerNetwork.getVcn() + ".default_dhcp_options_id}\"\n" + 
                    "}\n\n" + 
                    "");
            
        }
        
    }
    
    public void nextButtonClicked(ActionEvent event) throws IOException {
        Parent subnetParent = FXMLLoader.load(getClass().getResource("view/Compute.fxml"));
        Scene computeScene = new Scene(subnetParent);
        
        // Gets stage information
        Stage window = (Stage) ((Node) event.getSource()).getScene().getWindow();
        window.setScene(computeScene);
        window.show();
        
        
        
    }
    
    

}
