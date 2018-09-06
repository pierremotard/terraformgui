package application;

import java.io.IOException;

import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.stage.Stage;

public class ControllerFinal {
    
    @FXML Label vcnName;
    @FXML Label nbSubnets;
    @FXML Label nbSecLists;
    @FXML Label nbInstances;
    @FXML Label nbBlockVolumes;
    
    @FXML
    public void initialize() {
        vcnName.setText(ControllerNetwork.getVcn());
        nbSubnets.setText(Integer.toString(ControllerSubnet.subnetList.size()));
        nbSecLists.setText(Integer.toString(ControllerSecurityList.allSecurityLists.size()));
        nbInstances.setText(Integer.toString(ControllerCompute.getInstanceList().size()));
        nbBlockVolumes.setText(Integer.toString(ControllerBlockVolume.bvList.size()));
    }
    
    
    public void closeButtonClicked(ActionEvent event) throws IOException {
        Platform.exit();
        System.exit(0);
        
    }

}
