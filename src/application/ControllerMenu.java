package application;

import java.io.IOException;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class ControllerMenu {

    public ControllerMenu() {
        // TODO Auto-generated constructor stub
    }
    
    @FXML
    public void provisionInfraClicked(ActionEvent event) throws IOException {
        Parent authParent = FXMLLoader.load(getClass().getResource("view/Auth.fxml"));
        Scene authScene = new Scene(authParent);
        
        // Gets stage information
        Stage window = (Stage) ((Node) event.getSource()).getScene().getWindow();
        window.setScene(authScene);
        window.show();
    }
    
    @FXML
    public void addComponentClicked(ActionEvent event) throws IOException {
        Parent addCompParent = FXMLLoader.load(getClass().getResource("view/AddComp.fxml"));
        Scene addCompScene = new Scene(addCompParent);
        
        // Gets stage information
        Stage window = (Stage) ((Node) event.getSource()).getScene().getWindow();
        window.setScene(addCompScene);
        window.show();
    }

}
