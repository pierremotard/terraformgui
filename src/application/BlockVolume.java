package application;

public final class BlockVolume {

    
    private String name;
    private String size;
    
    public BlockVolume(String name, String size) {
        this.setName(name);
        this.setSize(size);
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }
    
}
