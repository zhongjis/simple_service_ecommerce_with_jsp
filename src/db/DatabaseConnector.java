package db;

import java.sql.*;
import static db.DatabaseConfig.*;

public class DatabaseConnector {


    private DatabaseConnector() {
       
    }

    /*
    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            return DriverManager.getConnection("jdbc:mysql://" + getHost() + "/" + getDatabaseName(), getUser(), getPassword());
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }
    */
    //private static String url = "jdbc:mysql://matt-smith-v4.ics.uci.edu:3306/inf124db060";
    private static String url = "jdbc:mysql://localhost:3306/inf124db060";
    private static String driverName = "com.mysql.jdbc.Driver";   
    private static String username = "inf124db060";   
    private static String password = "felixisfat";
    private static Connection con;
    
    public static Connection getConnection() {
        try {
            Class.forName (driverName);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
     
        try {
            con = DriverManager.getConnection (url, username, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return con;
    }
}
