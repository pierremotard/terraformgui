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

public class ControllerCompute {
    public ControllerCompute() {
        // TODO Auto-generated constructor stub
    }
    
    @FXML private TextField instanceNameField;
    @FXML private ChoiceBox<String> shapeChoice;
    @FXML private ChoiceBox<Subnet> subnetChoice;
    
    public static ObservableList<String> shapes = FXCollections.observableArrayList("VM1", "VM2");
    
    @FXML
    public void initialize() {
        subnetChoice.setValue(ControllerSubnet.subnetList.get(0));
        subnetChoice.setItems(ControllerSubnet.subnetList);
        
        shapeChoice.setItems(shapes);
        
    }
    
    @FXML
    public void addInstanceClicked(ActionEvent event) throws IOException {
        Parent instanceParent = FXMLLoader.load(getClass().getResource("view/Compute.fxml"));
        Scene instanceScene = new Scene(instanceParent);
        
        
        // Gets stage information
        Stage window = (Stage) ((Node) event.getSource()).getScene().getWindow();
        window.setScene(instanceScene);
        window.show();
        
        try (BufferedWriter writer = new BufferedWriter(new FileWriter("resource.tf", true))) {
            writer.write(
                    "resource \"oci_core_instance\" \"" + instanceNameField.getText() + "\" {\n" + 
                    "  availability_domain = \"${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD - 1],\"name\")}\"\n" + 
                    "  compartment_id = \"${var.compartment_id}\"\n" + 
                    "  display_name = \"" + instanceNameField.getText() + "\"\n" + 
                    "  hostname_label = \"" + instanceNameField.getText() + "\"\n" + 
                    "  image = \"${lookup(data.oci_core_images.OL7gen1ImageOCID.images[0], \"id\")}\"\n" + 
                    "  shape = \"" + shapeChoice.getValue() + "\"\n" + 
                    "  subnet_id = \"${oci_core_subnet." + subnetChoice.getValue() + ".id}\"\n" + 
                    "  metadata {\n" + 
                    "    ssh_authorized_keys = \"${file(var.ssh_public_key_path)}\"\n" + 
                    "  }\n" + 
                    "\n" + 
                    " }\n\n" + 
                    "}");
            
        }
        
    }
    
    public void nextButtonClicked(ActionEvent event) throws IOException {
        Parent networkParent = FXMLLoader.load(getClass().getResource("view/Subnet.fxml"));
        Scene subnetScene = new Scene(networkParent);
        
        // Gets stage information
        Stage window = (Stage) ((Node) event.getSource()).getScene().getWindow();
        window.setScene(subnetScene);
        window.show();
        
        
        
    }
}
