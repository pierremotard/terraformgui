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
        setAD(ad);
        this.prohibitIp.set(prohibitIp);
        this.setCidrBlock(cidrBlock);
        this.secList.set(secList);
    }
    
    public Subnet(String name) {
        this.name = name;
    }
    
    
    // Setters and Getters
    
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public String toString() {
        return name;
    }

    public String getAD() {
        return AD;
    }

    public void setAD(String aD) {
        AD = aD;
    }

    public String getCidrBlock() {
        return cidrBlock;
    }

    public void setCidrBlock(String cidrBlock) {
        this.cidrBlock = cidrBlock;
    }
    

}
