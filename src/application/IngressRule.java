package application;

public final class IngressRule extends Rule {

    private String source;
    private String min_range;
    private String max_range;
    
    public IngressRule(String protocol, String source, boolean stateless, String min_range, String max_range) {
        super(protocol, stateless);
        this.source = source;
        this.min_range = min_range;
        this.max_range = max_range;
    }
    /*
    public IngressRule(String protocol, String source, boolean stateless) {
        super(protocol, stateless);
        this.source = source;
    }
    */
    
    
    
    public String toString() {
        return  "  ingress_security_rules {\n" + 
                "    protocol = \"" + getNbProtocol(getProtocol()) + "\"   // " + getProtocol() + "\n" + 
                "    source = \"" + source  + "\"\n" + 
                "    stateless = " + getStateless() + "\n" + 
                "\n" + 
                "    " + getProtocol() + "_options {\n" + 
                "      source_port_range {\n" + 
                "        \"min\" = " + min_range + "\n" + 
                "        \"max\" = " + max_range + "\n" + 
                "      }\n" + 
                "    }\n" + 
                "  }\n\n";
    }

}
