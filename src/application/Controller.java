package application;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

public abstract class Controller {

    public Controller() {
        // TODO Auto-generated constructor stub
    }
    
    @FXML
    protected void addComponentClicked(ActionEvent event, String text, String nextPage) throws IOException {
        Parent instanceParent = FXMLLoader.load(getClass().getResource(nextPage));
        Scene instanceScene = new Scene(instanceParent);
        
        // Gets stage information
        Stage window = (Stage) ((Node) event.getSource()).getScene().getWindow();
        window.setScene(instanceScene);
        window.show();
        
        try (BufferedWriter writer = new BufferedWriter(new FileWriter("cluster-config/resource.tf", true))) {
            writer.write(text);
        }
        
    }
    
    @FXML
    public void nextClicked(ActionEvent event, String nextPage) throws IOException {
        Parent addInstanceParent = FXMLLoader.load(getClass().getResource(nextPage));
        Scene addInstanceScene = new Scene(addInstanceParent);
        
        // Gets stage information
        Stage window = (Stage) ((Node) event.getSource()).getScene().getWindow();
        window.setScene(addInstanceScene);
        window.show();
       
    }

}
