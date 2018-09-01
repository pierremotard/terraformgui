package application;

public final class SecurityList {
    
    private String name;
    
    public SecurityList(String name) {
        this.name = name;
    }
    
    
    public final class ingressSecRules {
        private String protocol;
        private String source;
        private String destination;
        private String thcp_options;
    }
    
    public final class egressSecRules {
        
    }
    
    public String toString() {
        return name;
    }
    
}
