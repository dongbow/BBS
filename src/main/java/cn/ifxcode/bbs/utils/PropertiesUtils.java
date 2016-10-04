package cn.ifxcode.bbs.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class PropertiesUtils {  
      
    private static Properties props = null; 
    
    static {
    	load();
    }
      
    public static void load(){  
        props = new Properties();
        InputStream in = PropertiesUtils.class.getResourceAsStream("/app.properties");  
        try {  
            props.load(in);  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
    }  
      
    public static String getValue(String key){  
        return props.getProperty(key);
    }  
}  