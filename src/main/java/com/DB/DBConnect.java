package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {

    // No need for static connection to avoid issues in multi-user environments
    private static final String URL = "jdbc:mysql://localhost:3306/job_portal?autoReconnect=true&useSSL=false";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "Gaut@2002";

    public static Connection getConn() {
        Connection conn = null;
        try {
            // Load MySQL JDBC driver dynamically
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Establish a new connection each time this method is called
            conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException e) {
            System.err.println("Error loading JDBC driver: " + e.getMessage());
        } catch (SQLException e) {
            System.err.println("Error connecting to the database: " + e.getMessage());
        }
        return conn;
    }
}
