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
    
    @FXML private ChoiceBox<String> ipProtocolIngressChoice;
    @FXML private TextField sourceCidrIngressField;
    @FXML private ChoiceBox<Boolean> statelessIngressChoice;
    @FXML private TextField minRangeIngressField;
    @FXML private TextField maxRangeIngressField;

    
    @FXML private ChoiceBox<String> ipProtocolEgressChoice;
    @FXML private TextField destinationCidrEgressField;
    @FXML private ChoiceBox<Boolean> statelessEgressChoice;
    @FXML private TextField minRangeEgressField;
    @FXML private TextField maxRangeEgressField;
    
    
    public static ObservableList<SecurityList> allSecurityLists = FXCollections.observableArrayList();
    
    public static ObservableList<SecurityList> getSecList() {
        return allSecurityLists;
    }
    
    public ObservableList<IngressRule> ingressRulesList = FXCollections.observableArrayList();
    public ObservableList<EgressRule> egressRulesList = FXCollections.observableArrayList();
    
    public static ObservableList<String> ipProtocolslist = FXCollections.observableArrayList("all", "tcp", "udp", "imcp");
    public static ObservableList<Boolean> statelessList = FXCollections.observableArrayList(true, false);

    
    
    @FXML
    public void initialize() {
        ipProtocolIngressChoice.setValue(ipProtocolslist.get(0));
        ipProtocolIngressChoice.setItems(ipProtocolslist);
        statelessIngressChoice.setItems(statelessList);
        
       // ipProtocolEgressChoice.setValue(ipProtocolslist.get(0));
        ipProtocolEgressChoice.setItems(ipProtocolslist);
        statelessEgressChoice.setItems(statelessList);
    }
    
    @FXML
    public void addIngressRuleClicked() throws IOException {
        IngressRule anIR = new IngressRule(ipProtocolIngressChoice.getValue(), sourceCidrIngressField.getText(), statelessIngressChoice.getValue(), minRangeIngressField.getText(), maxRangeIngressField.getText());
        /*
        System.out.println(ipProtocolIngressChoice.getValue());
        System.out.println(sourceCidrIngressField.getText());
        System.out.println(statelessIngressChoice.getValue());
        
        IngressRule anIR = new IngressRule(ipProtocolIngressChoice.getValue(), sourceCidrIngressField.getText(), statelessIngressChoice.getValue());
        */
        ingressRulesList.add(anIR);
        
        sourceCidrIngressField.clear();
        minRangeIngressField.clear();
        maxRangeIngressField.clear();
        
    }
    
    @FXML
    public void addEgressRuleClicked() throws IOException {
        
        egressRulesList.add(new EgressRule(ipProtocolEgressChoice.getValue(), destinationCidrEgressField.getText(), statelessEgressChoice.getValue(), minRangeEgressField.getText(), maxRangeEgressField.getText()));
        
        destinationCidrEgressField.clear();
        minRangeEgressField.clear();
        maxRangeEgressField.clear();
        
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
                    "  vcn_id = \"${oci_core_virtual_network." + ControllerNetwork.getVcn() + ".id}\"\n\n" 
                    );
            
            for(IngressRule ir : ingressRulesList) {
                writer.write(ir.toString());
            }
            
            for(EgressRule er : egressRulesList) {
                writer.write(er.toString());
            }
            
            writer.write("} \n");
            
        }
    }

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
