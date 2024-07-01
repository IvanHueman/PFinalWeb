package com.upiicsa.servlet;

import com.upiicsa.app.DatabaseConnection;
import com.upiicsa.app.Session;
import com.upiicsa.app.Utils;
import com.upiicsa.models.Url;
import com.upiicsa.models.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Huerta Mancilla Ivan
 */
public class AddUrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        var cookies = request.getCookies();
        boolean hasCookie = false;
        int id = 0;
        
        for (var cookie : cookies) {
            if (cookie.getName().equals("user")) {
                hasCookie = true;
                id = Integer.parseInt(cookie.getValue());
            }
        }
        
        if (hasCookie) {
            String username = Utils.getUsername(id);
            
            request.setAttribute("id", id);
            request.setAttribute("username", username);
            request.getRequestDispatcher("add-url.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("url");
        String userId = request.getParameter("user-id");
        
        if (name.isBlank() || email.isBlank()) {
            return;
        }
        
        Url url = new Url();
        
        url.setName(name);
        url.setUrl(email);
        url.setUserId(Integer.parseInt(userId));
        
        try {
            var connection = new DatabaseConnection();
            String query = "INSERT INTO `url` (`name`, `url`, `user_id`) VALUES (?, ?, ?);";
            
            connection.executeNonQuery(query, url.getName(), url.getUrl(), url.getUserId());
            
            response.sendRedirect("Dashboard");
        } catch (java.sql.SQLException ex) {
            System.out.println("Error al insertar los datos: " + ex.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SignUp.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
