package application;

import java.io.IOException;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;

public class ControllerMenu extends Controller {

    @FXML
    public void provisionEntireInfraClicked(ActionEvent event) throws IOException {
        super.nextClicked(event, "view/Auth.fxml");
    }
    
    @FXML
    public void addComponentClicked(ActionEvent event) throws IOException {
        super.nextClicked(event, "view/AddComp.fxml");
    }

}
