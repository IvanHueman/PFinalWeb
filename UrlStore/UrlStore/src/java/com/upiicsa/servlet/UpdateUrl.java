package com.upiicsa.servlet;

import com.upiicsa.app.DatabaseConnection;
import com.upiicsa.app.Utils;
import com.upiicsa.models.Url;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Huerta Mancilla Ivan
 */
public class UpdateUrl extends HttpServlet {
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
            var urls = Utils.getUrls(id);
            
                request.setAttribute("id", id);
            request.setAttribute("username", username);
            request.setAttribute("urls", urls);
            
            request.setAttribute("username", username);
            request.getRequestDispatcher("update-url.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String email = request.getParameter("url");
        
        
        if (name.isBlank() || email.isBlank()) {
            return;
        }
        
        Url url = new Url();
        
        url.setId(Integer.parseInt(id));
        url.setName(name);
        url.setUrl(email);
        url.setUpdatedAt(new Date());
        
        try {
            var connection = new DatabaseConnection();
            String query = "UPDATE `url` SET `name` = ?, `url` = ?, updated_at = ? WHERE `id` = ?;";
            
            connection.executeNonQuery(query, url.getName(), url.getUrl(), url.getUpdatedAt(), url.getId());
            
            response.sendRedirect("Dashboard");
        } catch (java.sql.SQLException ex) {
            System.out.println("Error al insertar los datos: " + ex.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SignUp.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
