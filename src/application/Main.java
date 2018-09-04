package application;
	
import java.io.File;

import javafx.application.Application;
import javafx.collections.ObservableList;
import javafx.fxml.FXMLLoader;
import javafx.stage.Stage;
import javafx.scene.Group;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.layout.BorderPane;


public class Main extends Application {

    
    public static int nbSubnets = 0;
    
    
    
    
	@Override
	public void start(Stage primaryStage) {
		try {
		    Parent root = FXMLLoader.load(getClass().getResource("view/Auth.fxml"));
		    primaryStage.setTitle("Terraform GUI");
			Scene scene = new Scene(root,800,500);

			primaryStage.setScene(scene);
			primaryStage.show();
			
			File terraform_basic = new File("cluster-config");
			terraform_basic.mkdir();
			GenFiles.generateFiles();
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		launch(args);
	}
}
