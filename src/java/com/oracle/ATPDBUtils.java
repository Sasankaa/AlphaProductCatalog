/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.oracle;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.Properties;
import oracle.jdbc.pool.OracleDataSource;
import java.sql.*;
import javax.sql.*;

/**
 *
 * @author sasanka
 */
public class ATPDBUtils {

    private static String INSTANCE = "";
    private static String CREDENTIALS = "";
    private static String USER = "";
    private static String PASSWORD = "";

    public static void getConnection() {
        try {
            OracleDataSource ODS = new OracleDataSource();

            ODS.setURL("jdbc:oracle:thin:@" + INSTANCE + "?TNS_ADMIN=" + CREDENTIALS);
            ODS.setUser(USER);
            ODS.setPassword(PASSWORD);
            ODS.getConnection();

            System.out.println("Connection test Succeeded. You are connected to ATP as Admin!");

        } catch (SQLException e) {
            System.out.println("Connection Unsuccessful with errror " + e.getMessage());
            e.printStackTrace();
        }
    }

    private static void readProperties() {
        Properties prop = new Properties();
        InputStream input = null;

        try {
            input = ATPDBUtils.class.getClassLoader().getResourceAsStream("dbconfig.properties");
            prop.load(input);
            INSTANCE = prop.getProperty("dbinstance");
            USER = prop.getProperty("dbuser");
            PASSWORD = prop.getProperty("dbpassword");
            CREDENTIALS = prop.getProperty("dbcredpath");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    static void getProductID(Connection conn)
            throws SQLException {
        // Create a Statement
        Statement stmt = conn.createStatement();

        // Select the ENAME column from the EMP table
        ResultSet rset = stmt.executeQuery("SELECT product_id FROM PRODUCTS");

        // Iterate through the result and print the employee names
        while (rset.next()) {
            System.out.println("User name is " + rset.getString(1));
        }

        // Close the RseultSet
        rset.close();
        rset = null;

        // Close the Statement
        stmt.close();
        stmt = null;
    }

}
