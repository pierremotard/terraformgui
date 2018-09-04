package application;

import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

public class ControllerNetwork {

    public ControllerNetwork() {
        // TODO Auto-generated constructor stub
    }
    
    @FXML private TextField vcnCidrField;
    @FXML private TextField vcnField;
    @FXML private TextField dnsLabelField;
    @FXML private TextField gatewayField;
    @FXML private TextField routeTableField;
    
    private static String vcnName;
    
    public void nextButtonClicked(ActionEvent event) throws IOException {
        Parent networkParent = FXMLLoader.load(getClass().getResource("view/SecurityList.fxml"));
        Scene securityListScene = new Scene(networkParent);
        
        // Gets stage information
        Stage window = (Stage) ((Node) event.getSource()).getScene().getWindow();
        window.setScene(securityListScene);
        window.show();
        
        vcnName = vcnField.getText();
        
        try (BufferedWriter writer = new BufferedWriter(new FileWriter("vars-values.auto.tfvars", true))) {
            writer.write("VCN-CIDR = \"" + vcnCidrField.getText() + "\" \n");
        }
        
        try (Writer writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream("resource.tf"), "utf-8"))) {
            writer.write("# Create a new VCN\n" + 
                    "resource \"oci_core_virtual_network\" \"" + vcnField.getText() + "\" {\n" + 
                    "  cidr_block = \"${var.VCN-CIDR}\"\n" + 
                    "  compartment_id = \"${var.compartment_id}\"\n" + 
                    "  display_name = \"" + vcnField.getText() + "\"\n" + 
                    "  dns_label = \"" + dnsLabelField.getText() + "\"\n" + 
                    "}\n" + 
                    "\n" + 
                    "# Create a new Internet Gateway\n" + 
                    "resource \"oci_core_internet_gateway\" \"" + gatewayField.getText() + "\" {\n" + 
                    "  compartment_id = \"${var.compartment_id}\"\n" + 
                    "  display_name = \"" + gatewayField.getText() + "\"\n" + 
                    "  vcn_id = \"${oci_core_virtual_network." + vcnField.getText() + ".id}\"\n" + 
                    "}\n" + 
                    "\n" + 
                    "# Create a new Route Table\n" + 
                    "resource \"oci_core_route_table\" \"" + routeTableField.getText() + "\" {\n" + 
                    "  compartment_id = \"${var.compartment_id}\"\n" + 
                    "  vcn_id = \"${oci_core_virtual_network." + vcnField.getText() + ".id}\"\n" + 
                    "  display_name = \" " + routeTableField.getText() + "\"\n" + 
                    "  route_rules {\n" + 
                    "    cidr_block = \"0.0.0.0/0\"\n" + 
                    "    network_entity_id = \"${oci_core_internet_gateway." + gatewayField.getText() + ".id}\"\n" + 
                    "  }\n" + 
                    "}\n\n");
        }
        
    }
    
    
    
    public static String getVcn() {
        return vcnName;
    }
  

}
