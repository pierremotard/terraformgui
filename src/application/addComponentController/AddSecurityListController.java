package application.addComponentController;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

import application.Controller;
import application.ControllerNetwork;
import application.EgressRule;
import application.IngressRule;
import application.SecurityList;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.TextField;

public class AddSecurityListController extends Controller {

    public AddSecurityListController() {
        // TODO Auto-generated constructor stub
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
        statelessIngressChoice.setValue(false);
        
       // ipProtocolEgressChoice.setValue(ipProtocolslist.get(0));
        ipProtocolEgressChoice.setItems(ipProtocolslist);
        statelessEgressChoice.setItems(statelessList);
        statelessEgressChoice.setValue(false);
    }
    
    @FXML
    public void addIngressRuleClicked() throws IOException {
        IngressRule anIR;
        if(ipProtocolIngressChoice.getValue() != "all") {
            anIR = new IngressRule(ipProtocolIngressChoice.getValue(), statelessIngressChoice.getValue(), sourceCidrIngressField.getText(), minRangeIngressField.getText(), maxRangeIngressField.getText());
        } else {
            anIR = new IngressRule(ipProtocolIngressChoice.getValue(), statelessIngressChoice.getValue(), sourceCidrIngressField.getText());
        }
        ingressRulesList.add(anIR);
        
        sourceCidrIngressField.clear();
        minRangeIngressField.clear();
        maxRangeIngressField.clear();
        
    }
    
    @FXML
    public void addEgressRuleClicked() throws IOException {
        EgressRule anER;
        if (ipProtocolEgressChoice.getValue() != "all") {
            anER = new EgressRule(ipProtocolEgressChoice.getValue(), statelessEgressChoice.getValue(), destinationCidrEgressField.getText(), minRangeEgressField.getText(), maxRangeEgressField.getText());
        } else {
            anER = new EgressRule(ipProtocolEgressChoice.getValue(), statelessEgressChoice.getValue(), destinationCidrEgressField.getText());
        }
        egressRulesList.add(anER);
       
        destinationCidrEgressField.clear();
        minRangeEgressField.clear();
        maxRangeEgressField.clear();
        
    }
    
    
    @FXML
    public void addSecurityListClicked(ActionEvent event) throws IOException {
        allSecurityLists.add(new SecurityList(securityListNameField.getText()));
        
        super.addComponentClicked(event, 
                "\n" + 
                "resource \"oci_core_security_list\" \"" + securityListNameField.getText() + "\" {\n" + 
                "  compartment_id = \"${var.compartment_id}\"\n" + 
                "  display_name = \"" + securityListNameField.getText() + "\"\n" + 
                "  vcn_id = \"${oci_core_virtual_network." + ControllerNetwork.getVcn() + ".id}\"\n\n" , 
                "../view/AddSecurityList.fxml");

        
        try (BufferedWriter writer = new BufferedWriter(new FileWriter("cluster-config/resource.tf", true))) {
            
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
    public void menuButtonClicked(ActionEvent event) throws IOException {
        super.nextClicked(event, "../view/AddComp.fxml");
    }

}