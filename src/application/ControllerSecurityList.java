package application;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.collections.transformation.SortedList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

public class ControllerSecurityList {
    
    public ControllerSecurityList() {
    }
    
    @FXML private TextField securityListNameField;
    @FXML private TextField sourceCidrIngressField;
    @FXML private ChoiceBox<String> ipProtocolIngressChoice;
    @FXML private TextField sourceCidrEgressField;
    @FXML private ChoiceBox<String> ipProtocolEgressChoice;
    @FXML private Button egressButton;
    
    public static ObservableList<SecurityList> allSecurityLists = FXCollections.observableArrayList();
    
    public static ObservableList<SecurityList> getSecList() {
        return allSecurityLists;
    }
    
    ObservableList<String> ipProtocolslist = FXCollections.observableArrayList("All protocols", "TCP");
    
    @FXML
    public void initialize() {
        //ipProtocolIngressChoice.setValue(ipProtocolslist.get(0));
        ipProtocolIngressChoice.setItems(ipProtocolslist);
        
       // ipProtocolEgressChoice.setValue(ipProtocolslist.get(0));
        ipProtocolEgressChoice.setItems(ipProtocolslist);
    }
    
    
    @FXML
    public void addSecurityListClicked(ActionEvent event) throws IOException {
        Parent networkParent = FXMLLoader.load(getClass().getResource("view/SecurityList.fxml"));
        Scene securityListScene = new Scene(networkParent);
        
        
        
        allSecurityLists.add(new SecurityList(securityListNameField.getText()));
        
        // Gets stage information
        Stage window = (Stage) ((Node) event.getSource()).getScene().getWindow();
        window.setScene(securityListScene);
        window.show();
        
        try (BufferedWriter writer = new BufferedWriter(new FileWriter("cluster-config/resource.tf", true))) {
            writer.write("\n" + 
                    "resource \"oci_core_security_list\" \"" + securityListNameField.getText() + "\" {\n" + 
                    "  compartment_id = \"${var.compartment_id}\"\n" + 
                    "  display_name = \"" + securityListNameField.getText() + "\"\n" + 
                    "  vcn_id = \"${oci_core_virtual_network." + ControllerNetwork.getVcn() + ".id}\"\n" + 
                    "  ingress_security_rules = [\n" + 
                    "    {\n" + 
                    "    protocol = \"all\"\n" + 
                    "    source = \"${var.VCN-CIDR}\"\n" + 
                    "    }\n" + 
                    "  ]\n" + 
                    "  egress_security_rules = [\n" + 
                    "    {\n" + 
                    "    protocol = \"all\"\n" + 
                    "    destination = \"0.0.0.0/0\"\n" + 
                    "    }\n" + 
                    "  ]\n" + 
                    "}\n" + 
                    "\n" + 
                    "");
            
        }
    }
    /*
    public void protocolString(String ipProtocol) {
        if (ipProtocolIngressChoice.getValue() == ipProtocolslist.get(0)) {
            egressButton.setDisable(true);
        } else {
            egressButton.setDisable(false);
        }
    }
    */
    
    @FXML
    public void nextButtonClicked(ActionEvent event) throws IOException {
        Parent securityParent = FXMLLoader.load(getClass().getResource("view/Subnet.fxml"));
        Scene subnetScene = new Scene(securityParent);
        
        // Gets stage information
        Stage window = (Stage) ((Node) event.getSource()).getScene().getWindow();
        window.setScene(subnetScene);
        window.show();
        
        
        
    }
}
