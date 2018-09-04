package application;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

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

public class ControllerBlockVolume {

    @FXML private TextField blockVolumeNameField;
    @FXML private TextField countField;
    @FXML private TextField sizeField;
    @FXML private ChoiceBox<String> attachmentTypeChoice;
    @FXML private TextField countAttachmentField;
    @FXML private ChoiceBox<Instance> instanceChoice;
    
    
    public static ObservableList<String> attachmentlist = FXCollections.observableArrayList("iSCSI");
    
    public static ObservableList<BlockVolume> bvList = FXCollections.observableArrayList();

    
    
    @FXML
    public void initialize() {
        attachmentTypeChoice.setItems(attachmentlist);
        
        instanceChoice.setItems(ControllerCompute.getInstanceList());
        
    }
    
    @FXML
    public void addBlockVolumeClicked(ActionEvent event) throws IOException {
        Parent bvParent = FXMLLoader.load(getClass().getResource("view/Compute.fxml"));
        Scene bvScene = new Scene(bvParent);
        
        bvList.add(new BlockVolume(blockVolumeNameField.getText(), sizeField.getText()));
        
        /*
        subnetList.add(new Subnet(subnetNameField.getText(), ADField.getText(), prohibitIpChoice.getValue(), 
                        cidrBlockField.getText(), securityListChoice.getValue()));
        */
        // Gets stage information
        Stage window = (Stage) ((Node) event.getSource()).getScene().getWindow();
        window.setScene(bvScene);
        window.show();
        
        try (BufferedWriter writer = new BufferedWriter(new FileWriter("cluster-config/resource.tf", true))) {
            writer.write(
                    "resource \"oci_core_volume\" \"" + blockVolumeNameField.getText() + "\" {\n" + 
                    "  count = \"" + countField.getText() + "\"\n" + 
                    "  availability_domain = \"${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD - 1],\"name\")}\"\n" + 
                    "  compartment_id = \"${var.compartment_id}\"\n" + 
                    "  display_name = \"" + blockVolumeNameField.getText() + "\"\n" + 
                    "  size_in_gbs = \"" + sizeField.getText() + " \"\n" + 
                    "}\n" + 
                    "resource \"oci_core_volume_attachment\" \"" + blockVolumeNameField.getText() + "-Attach\" {\n" + 
                    "  count = \"" + countAttachmentField.getText() + "\"\n" + 
                    "  attachment_type = \"iscsi\"\n" + 
                    "  compartment_id = \"${var.compartment_id}\"\n" + 
                    "  instance_id = \"${oci_core_instance." + instanceChoice.getValue() + ".id}\"\n" + 
                    "  volume_id = \"${oci_core_volume." + blockVolumeNameField.getText() + ".id}\"\n" + 
                    "}");
            
        }
        
    }
    
    public void nextButtonClicked(ActionEvent event) throws IOException {
        Parent bvParent = FXMLLoader.load(getClass().getResource("view/Compute.fxml"));
        Scene computeScene = new Scene(bvParent);
        
        // Gets stage information
        Stage window = (Stage) ((Node) event.getSource()).getScene().getWindow();
        window.setScene(computeScene);
        window.show();
        
        
        
    }
}
