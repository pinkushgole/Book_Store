/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author asus
 */
public class DbConnection {

    private static Connection conn;


   
    public static Connection getConnection() {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("driver loaded");

            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook", "root", "root");
            System.out.println("connected");

        } catch (ClassNotFoundException e) {
            System.out.println(e);
        } catch (SQLException e) {
            System.out.println(e);
        }

        return conn;
    }
}
