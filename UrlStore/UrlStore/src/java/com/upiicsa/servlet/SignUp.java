package com.upiicsa.servlet;

import com.upiicsa.app.DatabaseConnection;
import com.upiicsa.app.Session;
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
public class SignUp extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("sign-up.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        if (name.isBlank() || email.isBlank() || password.isBlank()) {
            return;
        }
        
        User user = new User();
        
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);
        
        try {
            var connection = new DatabaseConnection();
            String query = "INSERT INTO `user` (`name`, `email`, `password`) VALUES (?, ?, ?);";
            
            connection.executeNonQuery(query, user.getName(), user.getEmail(), user.getPassword());
            
            
            
            
            response.sendRedirect("Login");
        } catch (java.sql.SQLException ex) {
            System.out.println("Error al insertar los datos: " + ex.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SignUp.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
