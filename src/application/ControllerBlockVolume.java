package application;

import java.io.IOException;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.TextField;

public class ControllerBlockVolume extends Controller {

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
        String text = "resource \"oci_core_volume\" \"" + blockVolumeNameField.getText() + "\" {\n" + 
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
                "}";
        
        super.addComponentClicked(event, text, "view/Compute.fxml");
        
        bvList.add(new BlockVolume(blockVolumeNameField.getText(), sizeField.getText()));
        
    }
    
    public void nextButtonClicked(ActionEvent event) throws IOException {
        super.nextClicked(event, "view/Compute.fxml");
        
    }
}
