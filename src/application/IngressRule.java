package application;

public final class IngressRule extends Rule {

    private String source;
    private String min_range;
    private String max_range;
    
    public IngressRule(String protocol, boolean stateless, String source) {
        super(protocol, stateless);
        this.source = source;
    }
    
    public IngressRule(String protocol, boolean stateless, String source, String min_range, String max_range) {
        super(protocol, stateless);
        this.source = source;
        this.min_range = min_range;
        this.max_range = max_range;
    }
    
    public String toString() {
        String protocol = getProtocol() == "all" ? getProtocol() + "\"" : getNbProtocol(getProtocol()) + "\"   // " + getProtocol();
        
      //No options if all protocols
        String options = getProtocol() == "all" ? "" :  
            "    " + getProtocol() + "_options {\n" + 
                "      destination_port_range {\n" + 
                "        \"min\" = " + min_range + "\n" + 
                "        \"max\" = " + max_range + "\n" + 
                "      }\n" + 
                "    }\n";
        
        return  "  ingress_security_rules {\n" + 
        "    protocol  = \"" + protocol + "\n" + 
        "    destination = \"" + source  + "\"\n" + 
        "    stateless = " + getStateless() + "\n" + 
        "\n" + options +
        "  }\n\n";
    }

}
