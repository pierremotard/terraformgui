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
        return  "  egress_security_rules {\n" + 
                "    protocol  = \"" + getNbProtocol(getProtocol()) + "\"   // " + getProtocol() + "\n" + 
                "    destination = \"" + destination  + "\"\n" + 
                "    stateless = " + getStateless() + "\n" + 
                "\n" + 
                "    " + getProtocol() + "_options {\n" + 
                "      destination_port_range {\n" + 
                "        \"min\" = " + min_range + "\n" + 
                "        \"max\" = " + max_range + "\n" + 
                "      }\n" + 
                "    }\n" + 
                "  }\n\n";
    }
}
