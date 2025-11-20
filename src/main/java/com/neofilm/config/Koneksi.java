package com.neofilm.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Koneksi {

    private static final String URL = "jdbc:mysql://localhost:3306/neofilm_db";
    private static final String USER = "root";
    private static final String PASS = "";

    public static Connection getConnection() {
        Connection con = null;
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(URL, USER, PASS);
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Koneksi Gagal: " + e.getMessage());
            e.printStackTrace();
        }
        return con;
    }
}