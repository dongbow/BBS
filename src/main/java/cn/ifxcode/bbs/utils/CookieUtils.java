package cn.ifxcode.bbs.utils;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

import cn.ifxcode.bbs.constant.BbsConstant;

public class CookieUtils {
    
    private static String HTTP_ONLY_COOKIE_TEMPLATE = "%1$s=%2$s;Domain=%3$s;Path=%4$s;HttpOnly";
    public static final String PARAMETER_COOKIE_SEPARATOR = ";";
    
    public static final String CRED_LOCAL_SESS = "BBS_COOKIE";
    
    public static final String[] LOCAL_COOKIE = {CRED_LOCAL_SESS};
    
    public static String getCookieValue(HttpServletRequest req, String key) {
        Cookie[] cookies = req.getCookies();
        if (cookies == null) {
            return null;
        }
        for (Cookie ck : cookies) {
            if (key.equals(ck.getName())) {
                return AESUtils.decrypt(ck.getValue(), BbsConstant.PASSWORD);
            }
        }
        return null;
    }
    
    public static String getUserCookieValue(HttpServletRequest req) {
        Cookie[] cookies = req.getCookies();
        if (cookies == null) {
            return null;
        }
        for (Cookie ck : cookies) {
            if (CRED_LOCAL_SESS.equals(ck.getName())) {
                return AESUtils.decrypt(ck.getValue(), BbsConstant.PASSWORD);
            }
        }
        return null;
    }

    public static Cookie makeCookieExpire(String key, String value,
            String domain) {
        return makeCookie(key, value, domain, 0);
    }

    public static Cookie makeCookie(String key, String value, String domain,
            int maxAge) {
        return makeCookie(key, value, domain, maxAge, false);
    }
    
    public static Cookie makeUserCookie(String value, int remember) {
        return makeCookie(CRED_LOCAL_SESS, value, BbsConstant.DOMAIN, remember == 1 ? BbsConstant.REMEMBER_MAXAGE : -1, false);
    }

    public static Cookie makeCookie(String key, String value, String domain,
            int maxAge, boolean secure) {
        Cookie ck = new Cookie(key, StringUtils.isEmpty(value) ? null : AESUtils.encrypt(value, BbsConstant.PASSWORD));
        ck.setMaxAge(maxAge); 
        ck.setPath("/");
        ck.setSecure(secure);
        return ck;
    }

    public static void addHttpOnlyCookie(String key, String value,
            String domain, HttpServletResponse response) {
        response.containsHeader("SET-COOKIE");  //貌似非得加这么一行才能把header set进去
        response.setHeader("SET-COOKIE", String.format(
                HTTP_ONLY_COOKIE_TEMPLATE, key, value, domain, "/"));
    }
    
    public static String getParameterCookie(String key, String cookieStr) {
        if(StringUtils.isEmpty(cookieStr)) {
            return null;
        }
        String[] cs = cookieStr.split(PARAMETER_COOKIE_SEPARATOR);
        for(String c : cs) {
            if(c.startsWith(key)) {
                return c.substring(key.length() + 1);
            }
        }
        return null;
    }

    public static String appendCookie(String cookieStr, String name, String value) {
        StringBuilder sb = new StringBuilder(cookieStr == null ? "" : cookieStr);
        if(sb.length() > 0)
            sb.append(PARAMETER_COOKIE_SEPARATOR);
        sb.append(name);
        sb.append("=");
        sb.append(value);
        return sb.toString();
    }
    
    /**
     * 从request的cookie header里获取指定key的cookie值
     * @param cookieHeader
     * @param key
     * @return
     */
    public static String getCookieValueFromHeaderString(String cookieHeader, String key) {
        if(StringUtils.isBlank(cookieHeader)) {
            return null;
        }
        key = key + "=";
        String[] cs = cookieHeader.split(";\\s*");
        
        for(String c : cs) {
            if(StringUtils.startsWithIgnoreCase(c, key)) {
                return c.substring(key.length());
            }
        }
        return null;
    }
    
    /**
     * 从request的cookie header里获取cookie的key/value信息
     * 
     * @param cookieHeader
     * @return
     */
    public static Map<String, String> getCookiesFromHeaderString(String cookieHeader) {
        Map<String, String> cookies = new HashMap<String, String>();
        if(StringUtils.isBlank(cookieHeader)) {
            return cookies;
        }
        
        String[] cs = cookieHeader.split(";\\s*");
        
        int index = -1;
        for(String c : cs) {
            index = c.indexOf("=");
            if(index <= 0) {
                //跳过非法的cookie
                continue;
            }
            cookies.put(c.substring(0, index), c.substring(index + 1));
        }
        
        return cookies;
    } 
    
    /**
     * 将表示cookie 的key/value组装成request的cookie header
     * 
     * @param cookies
     * @return
     */
    public static String composeCookieHeader(Map<String, String> cookies) {
        StringBuilder sb = new StringBuilder();
        for(Map.Entry<String, String> en : cookies.entrySet()) {
            if(sb.length() > 0) {
                sb.append("; ");
            }
            sb.append(en.getKey() + "=" + en.getValue());
        }
        return sb.toString();
    }
    
    /**
     * 清空相关cookie
     * 
     * @param response
     */
    public static void clearCookies(HttpServletResponse response) {
        for (String s : LOCAL_COOKIE) {
            response.addCookie(CookieUtils.makeCookieExpire(s, "",
            		BbsConstant.DOMAIN));
        }
    }

}
