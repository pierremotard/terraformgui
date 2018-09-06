package application;

public final class EgressRule extends Rule {

    private String destination;
    private String min_range;
    private String max_range;
    
    public EgressRule(String protocol, boolean stateless, String destination) {
        super(protocol, stateless);
        this.destination = destination;
    }
    
    public EgressRule(String protocol,  boolean stateless, String destination, String min_range, String max_range) {
        super(protocol, stateless);
        this.destination = destination;
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
        
        return  "  egress_security_rules {\n" + 
                "    protocol  = \"" + protocol + "\n" + 
                "    destination = \"" + destination  + "\"\n" + 
                "    stateless = " + getStateless() + "\n" + 
                "\n" + options +
                "  }\n\n";
    }
}
