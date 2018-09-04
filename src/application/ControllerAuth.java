package application;

import java.io.BufferedWriter;
import java.io.FileOutputStream;
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

public class ControllerAuth {

    public ControllerAuth() {
        // TODO Auto-generated constructor stub
    }
    
    @FXML private TextField tenancyField;
    @FXML private TextField userField;
    @FXML private TextField fingerprintField;
    @FXML private TextField keyPathField;
    @FXML private TextField regionField;
    @FXML private TextField compartmentField;
    @FXML private TextField ADField;
    @FXML private TextField sshPublicField;
    @FXML private TextField sshPrivateField;
    @FXML private TextField vcnCidrField;
    
    
    public void nextButtonClicked(ActionEvent event) throws IOException {
        Parent authParent = FXMLLoader.load(getClass().getResource("view/Network.fxml"));
        Scene networkScene = new Scene(authParent);
        
        // Gets stage information
        Stage window = (Stage) ((Node) event.getSource()).getScene().getWindow();
        window.setScene(networkScene);
        window.show();
        
        try (Writer writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream("vars-values.auto.tfvars"), "utf-8"))) {
            writer.write("### Authentication details" + "\n");
            writer.write("tenancy_ocid = \"" + getTenancy() + "\" \n");
            writer.write("user_ocid = \"" + getUser() + "\" \n");
            writer.write("fingerprint = \"" + getFingerprint() + "\" \n");
            writer.write("private_key_path = \"" + getKeyPath() + "\" \n" + "\n");
            writer.write("### Region" + "\n");
            writer.write("region = \"" + getRegion() + "\" \n" + "\n");
            writer.write("### Compartment" + "\n");
            writer.write("compartment_ocid = \"" + getCompartment() + "\" \n" + "\n");
            writer.write("### Current Availability Domain (1, 2 or 3)" + "\n");
            writer.write("AD = \"" + ADField.getText() + "\" \n" + "\n");
            writer.write("### Public/private keys used on the instance" + "\n");
            writer.write("ssh_public_key_path = \"" + sshPublicField.getText() + "\" \n");
            writer.write("ssh_private_key_path = \"" + sshPrivateField.getText() + "\" \n" + "\n");
            writer.write("### VCN" + "\n");
            
            
        }
        
    }
    
    public String getTenancy() {
        return tenancyField.getText();
    }
    public String getUser() {
        return userField.getText();
    }
    public String getFingerprint() {
        return fingerprintField.getText();
    }
    public String getKeyPath() {
        return keyPathField.getText();
    }
    public String getRegion() {
        return regionField.getText();
    }
    public String getCompartment() {
        return compartmentField.getText();
    }

}
