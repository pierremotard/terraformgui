package application;

public abstract class Rule {
    
    private String protocol;
    private boolean stateless;
    
    public Rule(String protocol, boolean stateless) {
        this.protocol = protocol;
        this.stateless = stateless;
    }
    
    public String toString() {
        return "";
    }

    public String getProtocol() {
        return protocol;
    }

    public void setProtocol(String protocol) {
        this.protocol = protocol;
    }
    
    public boolean getStateless() {
        return stateless;
    }

    public void setStateless(boolean stateless) {
        this.stateless = stateless;
    }
    
    public int getNbProtocol(String protocol) {
        if(protocol == "tcp")
            return 6;
        else if (protocol == "udp")
            return 17;
        else if (protocol == "imcp")
            return 1;
        else
            return 0;
    }
  
}
