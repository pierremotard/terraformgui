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
    @FXML private ChoiceBox<String> osChoice;
    
    public static ObservableList<String> shapes = FXCollections.observableArrayList("VM.Standard2.1", "VM.Standard2.2",
                                                                                    "VM.Standard1.1", "VM.Standard1.2");
    
    public static ObservableList<String> osList = FXCollections.observableArrayList("Oracle Linux 7.5 for VM2.2", "Oracle Linux 7.5 for VM1.1",
                                                                            "Windows Server 2012 R2 Standard for VM2.2", "Windows Server 2012 R2 for VM1.1");
    
    private static ObservableList<Instance> instanceList = FXCollections.observableArrayList();
    
    @FXML
    public void initialize() {
        //subnetChoice.setValue(ControllerSubnet.subnetList.get(0));
        subnetChoice.setItems(ControllerSubnet.subnetList);
        
        osChoice.setValue(osList.get(0));
        osChoice.setItems(osList);
        
        shapeChoice.setValue(shapes.get(0));
        shapeChoice.setItems(shapes);
        
    }
    
    public static ObservableList<Instance> getInstanceList() {
        return instanceList;
    }
    
    @FXML
    public void addInstanceClicked(ActionEvent event) throws IOException {
        Parent instanceParent = FXMLLoader.load(getClass().getResource("view/BlockVolume.fxml"));
        Scene instanceScene = new Scene(instanceParent);
        
        instanceList.add(new Instance(instanceNameField.getText(), shapeChoice.getValue()));
        
        // Gets stage information
        Stage window = (Stage) ((Node) event.getSource()).getScene().getWindow();
        window.setScene(instanceScene);
        window.show();
        
        try (BufferedWriter writer = new BufferedWriter(new FileWriter("cluster-config/resource.tf", true))) {
            writer.write(
                    "resource \"oci_core_instance\" \"" + instanceNameField.getText() + "\" {\n" + 
                    "  availability_domain = \"${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD - 1],\"name\")}\"\n" + 
                    "  compartment_id = \"${var.compartment_id}\"\n" + 
                    "  display_name = \"" + instanceNameField.getText() + "\"\n" + 
                    "  hostname_label = \"" + instanceNameField.getText() + "\"\n" + 
                    "  image = \"${lookup(data.oci_core_images." + getOsImage(osChoice.getValue()) + ".images[0], \"id\")}\"\n" + 
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
    
    public String getOsImage(String os) {
        if (osChoice.getValue() == osList.get(0)) {
            return "OL7gen2ImageOCID";
        } else if (osChoice.getValue() == osList.get(1)) {
            return "OL7gen1ImageOCID";
        } else if (osChoice.getValue() == osList.get(2)) {
            return "WS2012gen2ImageOCID";
        } else {
            return "WS2012gen1ImageOCID";
        }
        
    }
    
    public void nextButtonClicked(ActionEvent event) throws IOException {
        Parent computeParent = FXMLLoader.load(getClass().getResource("view/Final.fxml"));
        Scene blockVolumeScene = new Scene(computeParent);
        
        // Gets stage information
        Stage window = (Stage) ((Node) event.getSource()).getScene().getWindow();
        window.setScene(blockVolumeScene);
        window.show();
        
        
        
    }
}
