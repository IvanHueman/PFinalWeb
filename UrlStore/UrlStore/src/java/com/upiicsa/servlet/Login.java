package com.upiicsa.servlet;

import java.io.IOException;
import java.util.logging.Level;
import com.upiicsa.app.Session;
import com.upiicsa.models.User;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import com.upiicsa.app.DatabaseConnection;
import com.upiicsa.app.Utils;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Huerta Mancilla Ivan
 */
public class Login extends HttpServlet {
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
            
            request.setAttribute("username", username);
            request.setAttribute("urls", urls);
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        if (email.isBlank() || password.isBlank()) {
            return;
        }
        
        try {
            var connection = new DatabaseConnection();
            String query = "SELECT `id`, `name` FROM `user` WHERE `email` = ? AND `password` = ?;";
            
            var result = connection.executeQuery(query, email, password);
            
            User user = new User();
            
            while (result.next()) {
                user.setId(result.getInt(1));
                user.setName(result.getString(2));
            }
           
           Session session = new Session();
           session.createCookie(response, "" + user.getId());
            
            response.sendRedirect("Dashboard");
        } catch (java.sql.SQLException ex) {
            System.out.println("Error al seleccionar los datos: " + ex.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SignUp.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
