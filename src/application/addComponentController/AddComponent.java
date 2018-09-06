package application.addComponentController;

import java.io.IOException;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class AddComponent {

    public AddComponent() {
        // TODO Auto-generated constructor stub
    }
    
    @FXML
    public void addSecurityListClicked(ActionEvent event) throws IOException {
        Parent addSecurityListParent = FXMLLoader.load(getClass().getResource("../view/AddSecurityList.fxml"));
        Scene addSecurityListScene = new Scene(addSecurityListParent);
        
        // Gets stage information
        Stage window = (Stage) ((Node) event.getSource()).getScene().getWindow();
        window.setScene(addSecurityListScene);
        window.show();
    }
    
    @FXML
    public void addSubnetClicked(ActionEvent event) throws IOException {
        Parent addSubnetParent = FXMLLoader.load(getClass().getResource("../view/AddSubnet.fxml"));
        Scene addSubnetScene = new Scene(addSubnetParent);
        
        // Gets stage information
        Stage window = (Stage) ((Node) event.getSource()).getScene().getWindow();
        window.setScene(addSubnetScene);
        window.show();
    }
    
    @FXML
    public void addInstanceClicked(ActionEvent event) throws IOException {
        Parent addInstanceParent = FXMLLoader.load(getClass().getResource("../view/AddInstance.fxml"));
        Scene addInstanceScene = new Scene(addInstanceParent);
        
        // Gets stage information
        Stage window = (Stage) ((Node) event.getSource()).getScene().getWindow();
        window.setScene(addInstanceScene);
        window.show();
    }
    
    @FXML
    public void attachBVClicked(ActionEvent event) throws IOException {
        Parent attachBVParent = FXMLLoader.load(getClass().getResource("../view/AttachBV.fxml"));
        Scene attachBVScene = new Scene(attachBVParent);
        
        // Gets stage information
        Stage window = (Stage) ((Node) event.getSource()).getScene().getWindow();
        window.setScene(attachBVScene);
        window.show();
    }
    
    @FXML
    public void backMenuClicked(ActionEvent event) throws IOException {
        Parent menuParent = FXMLLoader.load(getClass().getResource("../view/Menu.fxml"));
        Scene menuScene = new Scene(menuParent);
        
        // Gets stage information
        Stage window = (Stage) ((Node) event.getSource()).getScene().getWindow();
        window.setScene(menuScene);
        window.show();
    }
    

}
