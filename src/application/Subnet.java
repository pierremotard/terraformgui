package application;

import javafx.beans.property.ObjectProperty;
import javafx.beans.property.SimpleObjectProperty;
import javafx.beans.property.SimpleStringProperty;

public class Subnet {
    
    
    private String name;
    private String AD;
    private ObjectProperty<Boolean> prohibitIp = new SimpleObjectProperty<Boolean>();
    private String cidrBlock;
    private ObjectProperty<SecurityList> secList = new SimpleObjectProperty<SecurityList>();
    
    
    public Subnet(String name, String ad, boolean prohibitIp, String cidrBlock, SecurityList secList) {
        this.name = name;
        AD = ad;
        this.prohibitIp.set(prohibitIp);
        this.cidrBlock = cidrBlock;
        this.secList.set(secList);
    }
    
    // Setters and Getters
    
    public String getName() {
        return name;
    }
    

}
