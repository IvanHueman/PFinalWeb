package com.upiicsa.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Huerta Mancilla Ivan
 */
public class Logout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        var cookies = request.getCookies();
        
        for (var cookie : cookies) {
            if (cookie.getName().equals("user")) {
                cookie.setMaxAge(0);
                
                response.addCookie(cookie);
            }
        }
        
        response.sendRedirect("Login");
    }
}
