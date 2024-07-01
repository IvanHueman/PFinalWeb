package com.upiicsa.app;

import com.upiicsa.models.Url;
import java.util.ArrayList;

/**
 *
 * @author Huerta Mancilla Ivan
 */
public class Utils {
    public static String getUsername(int id) {
        try {
            var connection = new DatabaseConnection();
            String query = "SELECT `name` FROM `user` WHERE `id` = ?;";

            String username = "";

            var result = connection.executeQuery(query, id);

            while (result.next()) {
                username = result.getString(1);
            }
            
            return username;
        } catch (java.sql.SQLException ex) {
            System.out.println(ex.getCause());
        } catch (ClassNotFoundException ex) {
            System.out.println(ex.getCause());
        }
        
        return null;
    }
    
    public static ArrayList<Url> getUrls(int id) {
        try {
            var connection = new DatabaseConnection();
            String query = "SELECT `id`, `name`, `url`, `created_at` AS `createdAt`, `updated_at` AS `updatedAt` FROM `url` WHERE `user_id` = ?;";
            
            var result = connection.executeQuery(query, id);
            
            ArrayList<Url> urls = new ArrayList<>();

            while (result.next()) {
                Url url = new Url();
                
                url.setId(result.getInt(1));
                url.setName(result.getString(2));
                url.setUrl(result.getString(3));
                url.setCreatedAt(result.getDate(4));
                url.setUpdatedAt(result.getDate(5));
                
                urls.add(url);
            }
            
            return urls;
        } catch (java.sql.SQLException ex) {
            System.out.println(ex.getCause());
        } catch (ClassNotFoundException ex) {
            System.out.println(ex.getCause());
        }
        
        return null;
    }
}
