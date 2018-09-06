package application.addComponentController;

import java.io.IOException;
import application.BlockVolume;
import application.Controller;
import application.ControllerCompute;
import application.Instance;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.TextField;

public class AttachBVController extends Controller {

    public AttachBVController() {
        // TODO Auto-generated constructor stub
    }
    
    @FXML private TextField blockVolumeNameField;
    @FXML private TextField countField;
    @FXML private TextField sizeField;
    @FXML private ChoiceBox<String> attachmentTypeChoice;
    @FXML private TextField countAttachmentField;
    @FXML private TextField instanceField;
    
    // Still to add paravirtualized 
    public static ObservableList<String> attachmentlist = FXCollections.observableArrayList("iSCSI", "paravirtualized");
    public static ObservableList<BlockVolume> bvList = FXCollections.observableArrayList();

    @FXML
    public void initialize() {
        attachmentTypeChoice.setItems(attachmentlist);
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
                "  instance_id = \"${oci_core_instance." + instanceField.getText() + ".id}\"\n" + 
                "  volume_id = \"${oci_core_volume." + blockVolumeNameField.getText() + ".id}\"\n" + 
                "}";
        
        super.addComponentClicked(event, text, "../view/Compute.fxml");
        
        bvList.add(new BlockVolume(blockVolumeNameField.getText(), sizeField.getText()));
        
    }
    
    public void backButtonClicked(ActionEvent event) throws IOException {
        super.nextClicked(event, "../view/AddComp.fxml");
        
    }

}
