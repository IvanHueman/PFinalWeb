package com.upiicsa.app;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Huerta Mancilla Ivan
 */
public class Session {
    private Cookie cookie = null;
    
    public void createCookie(HttpServletResponse response, String parameter) {
        String cookieName = "user";
        
        cookie = new Cookie(cookieName, parameter);
        cookie.setMaxAge(60 * 60 * 24);
        
        response.addCookie(cookie);
    }
}
