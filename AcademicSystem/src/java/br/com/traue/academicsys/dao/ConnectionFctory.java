package br.com.traue.academicsys.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFctory {

    private static final String DBURL = "jdbc:mysql://localhost/academic_sys";
    private static final String DBUSER = "root";
    private static final String DBPASS = "";

    public static Connection getConnection() {
        try {
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            return DriverManager.getConnection(DBURL, DBUSER, DBPASS);
        } catch (SQLException ex) {
            return null;
        }
    }
}
