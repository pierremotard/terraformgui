package application;

import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.io.Writer;

public class GenAuth {

    public GenAuth() {
        // TODO Auto-generated constructor stub
    }
    
    public static void Create() throws UnsupportedEncodingException, FileNotFoundException, IOException {
        try (Writer writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream("vars-values.auto.tfvars"), "utf-8"))) {
            writer.write("### Authentication details");
            //writer.write(Controller.getTenancy());
            
        }
    }
    

}
