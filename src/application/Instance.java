package application;

public final class Instance {
    
    private String name;
    private String shape;
    
    public Instance(String name, String shape) {
        this.setName(name);
        this.setShape(shape);
    }
    

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getShape() {
        return shape;
    }

    public void setShape(String shape) {
        this.shape = shape;
    }
    
    public String toString() {
        return name;
    }
    
}
