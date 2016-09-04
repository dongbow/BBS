package cn.ifxcode.bbs.freemarker;

import java.io.IOException;
import java.io.Reader;
import java.io.StringReader;

import org.apache.commons.io.IOUtils;

import freemarker.cache.TemplateLoader;

public class HtmlTemplateLoader implements TemplateLoader {
	private static final String HTML_ESCAPE_PREFIX= "<#escape x as x?html>";  
    private static final String HTML_ESCAPE_SUFFIX = "</#escape>";  
      
    private final TemplateLoader delegate;
    
    public HtmlTemplateLoader(TemplateLoader delegate) {  
        this.delegate = delegate;  
    }  
    
    public Object findTemplateSource(String name) throws IOException {  
        return delegate.findTemplateSource(name);  
    }  
  
    public long getLastModified(Object templateSource) {  
        return delegate.getLastModified(templateSource);  
    }  
  
    public Reader getReader(Object templateSource, String encoding) throws IOException {  
        Reader reader = delegate.getReader(templateSource, encoding);  
        String templateText = IOUtils.toString(reader);  
        return new StringReader(HTML_ESCAPE_PREFIX+templateText + HTML_ESCAPE_SUFFIX);  
    }  
  
    public void closeTemplateSource(Object templateSource) throws IOException {  
        delegate.closeTemplateSource(templateSource);  
    }  
}