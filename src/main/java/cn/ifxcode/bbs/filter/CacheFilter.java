package cn.ifxcode.bbs.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CacheFilter implements Filter {

	private FilterConfig filterConfig;
	
    public CacheFilter() {
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
		HttpServletResponse response = (HttpServletResponse) res;  
        HttpServletRequest request = (HttpServletRequest) req;  
        String date = filterConfig.getInitParameter("date");  
        response.setDateHeader("Expires", System.currentTimeMillis()+Integer.valueOf(date)*1000);     
        chain.doFilter(request, response);  
	}

	public void init(FilterConfig fConfig) throws ServletException {
		this.filterConfig = fConfig;
	}

}
