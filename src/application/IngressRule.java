package application;

public final class IngressRule extends Rule {

    private String source;
    private String option1;
    private String option2;
    
    public IngressRule(String protocol, boolean stateless, String source) {
        super(protocol, stateless);
        this.source = source;
    }
    
    public IngressRule(String protocol, boolean stateless, String source, String option1, String option2) {
        super(protocol, stateless);
        this.source = source;
        this.option1 = option1;
        this.option2 = option2;
    }
    
    public String toString() {
        String protocol = getProtocol() == "all" ? getProtocol() + "\"" : getNbProtocol(getProtocol()) + "\"   // " + getProtocol();
        
        
      //No options if all protocols
        String options = getProtocol() == "all" ? "" :  
            "    " + getProtocol() + "_options {\n" + 
                getProtocol() == "icmp" ? 
                "        \"type\" = " + option1 + "\n" + 
                "        \"code\" = " + option2 + "\n" +
                "    }\n"
                        :
                "        \"min\" = " + option1 + "\n" + 
                "        \"max\" = " + option2 + "\n" + 
                "    }\n";
        
        
        return  "  ingress_security_rules {\n" + 
        "    protocol  = \"" + protocol + "\n" + 
        "    source = \"" + source  + "\"\n" + 
        "    stateless = " + getStateless() + "\n" + 
        "\n" + options +
        "  }\n\n";
    }

}
