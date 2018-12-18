/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.oracle;

import java.util.logging.Level;
import java.util.logging.Logger;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.net.URL;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import oracle.jdbc.pool.OracleDataSource;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import java.util.Random;

/**
 *
 * @author varuny
 */
public class WSProductClient {

    /**
     *
     * @return
     */
    public static Products requestItem() {
        readProperties();
        //getConnection();
        JSONArray products1 = getProducts();
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        Products p = new Products();
        try {
            //p = objectMapper.readValue(new URL("https://rawgit.com/varunyn/e22f25315b9fab9760c7b1f1ab1ddf83/raw/14464cbc548dd65da0a2acd4776b2c4377dc8ac8/product-catalog.json"), Products.class);
            p = objectMapper.readValue("{ \"Products\": " + (products1).toJSONString() + "}", Products.class);
            


        } catch (IOException ex) {
            Logger.getLogger(WSClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return p;
    }
    private static String INSTANCE = "";
    private static String CREDENTIALS = "";
    private static String USER = "";
    private static String PASSWORD = "";

    private static void getConnection() {
        try {
            OracleDataSource ODS = new OracleDataSource();

            ODS.setURL("jdbc:oracle:thin:@" + INSTANCE + "?TNS_ADMIN=" + CREDENTIALS);
            ODS.setUser(USER);
            ODS.setPassword(PASSWORD);
            ODS.getConnection();
            Connection conn = ODS.getConnection();
            System.out.println("Connection test Succeeded. You are connected to ATP as Admin!");
            Statement stmt = conn.createStatement();

            // Select the ENAME column from the EMP table
            ResultSet rset = stmt.executeQuery("SELECT * FROM PRODUCTS");
            JSONObject obj;// = new JSONObject();
            JSONArray products = new JSONArray();
            //products.add("PRODUCT_ID "+":"+"1039");
            //products.add("PARENT_CATEGORY_ID"+":"+"1039");
            //products.add("CATEGORY_ID"+":"+"1039");
            //obj.put("Products", products);

            // Iterate through the result and print the employee names
            while (rset.next()) {
                obj = new JSONObject();
                obj.put("PRODUCT_ID", rset.getInt("PRODUCT_ID"));

                obj.put("PARENT_CATEGORY_ID", rset.getInt("PARENT_CATEGORY_ID"));
                obj.put("CATEGORY_ID", rset.getInt("CATEGORY_ID"));
                obj.put("PRODUCT_NAME", rset.getString("PRODUCT_NAME"));
                obj.put("PRODUCT_STATUS", rset.getString("PRODUCT_STATUS"));
                obj.put("COST_PRICE", rset.getInt("COST_PRICE"));
                obj.put("LIST_PRICE", rset.getInt("LIST_PRICE"));
                obj.put("MIN_PRICE", rset.getInt("MIN_PRICE"));
                obj.put("WARRANTY_PERIOD_MONTHS", rset.getInt("WARRANTY_PERIOD_MONTHS"));
                obj.put("EXTERNAL_URL", rset.getString("EXTERNAL_URL"));
                obj.put("ATTRIBUTE_CATEGORY", rset.getString("ATTRIBUTE_CATEGORY"));
                obj.put("ATTRIBUTE1", rset.getString("ATTRIBUTE1"));
                obj.put("ATTRIBUTE2", rset.getString("ATTRIBUTE2"));
                obj.put("ATTRIBUTE3", rset.getString("ATTRIBUTE3"));
                obj.put("ATTRIBUTE4", rset.getString("ATTRIBUTE4"));
                obj.put("ATTRIBUTE5", rset.getString("ATTRIBUTE5"));
                obj.put("CREATED_BY", rset.getString("CREATED_BY"));
                obj.put("CREATION_DATE", rset.getDate("CREATION_DATE"));
                obj.put("LAST_UPDATED_BY", rset.getString("LAST_UPDATED_BY"));
                obj.put("LAST_UPDATE_DATE", rset.getDate("LAST_UPDATE_DATE"));
                obj.put("OBJECT_VERSION_ID", rset.getInt("OBJECT_VERSION_ID"));

                products.add(obj);

                System.out.println("Product ID is " + rset.getString(1) + " " + rset.getString(2) + " " + rset.getString(3) + " " + " " + rset.getString(4));

            }

            try (FileWriter file = new FileWriter("product-catalog.json")) {
                file.write("{ \"Products:\" " + ((JSONArray) products).toJSONString() + "}");
                System.out.println("Successfully Copied JSON Object to File...");

            } catch (IOException ex) {
                Logger.getLogger(WSProductClient.class.getName()).log(Level.SEVERE, null, ex);
            }
            // Close the RseultSet
            rset.close();
            rset = null;

            // Close the Statement
            stmt.close();
            stmt = null;

        } catch (SQLException e) {
            System.out.println("Connection Unsuccessful with errror " + e.getMessage());
            e.printStackTrace();
        }
    }
private static JSONArray getProducts() {
    JSONArray products = new JSONArray();
        try {
            OracleDataSource ODS = new OracleDataSource();

            ODS.setURL("jdbc:oracle:thin:@" + INSTANCE + "?TNS_ADMIN=" + CREDENTIALS);
            ODS.setUser(USER);
            ODS.setPassword(PASSWORD);
            //ODS.getConnection();
            Connection conn = ODS.getConnection();
            System.out.println("Connection test Succeeded. You are connected to ATP as Admin!");
            Statement stmt = conn.createStatement();

            // Select the ENAME column from the EMP table
            ResultSet rset = stmt.executeQuery("SELECT * FROM PRODUCTS");
            JSONObject obj;// = new JSONObject();
            
            //products.add("PRODUCT_ID "+":"+"1039");
            //products.add("PARENT_CATEGORY_ID"+":"+"1039");
            //products.add("CATEGORY_ID"+":"+"1039");
            //obj.put("Products", products);

            // Iterate through the result and print the employee names
            while (rset.next()) {
                obj = new JSONObject();
                obj.put("PRODUCT_ID", rset.getInt("PRODUCT_ID"));

                obj.put("PARENT_CATEGORY_ID", rset.getInt("PARENT_CATEGORY_ID"));
                obj.put("CATEGORY_ID", rset.getInt("CATEGORY_ID"));
                obj.put("PRODUCT_NAME", rset.getString("PRODUCT_NAME"));
                obj.put("PRODUCT_STATUS", rset.getString("PRODUCT_STATUS"));
                obj.put("COST_PRICE", rset.getInt("COST_PRICE"));
                obj.put("LIST_PRICE", rset.getInt("LIST_PRICE"));
                obj.put("MIN_PRICE", rset.getInt("MIN_PRICE"));
                obj.put("WARRANTY_PERIOD_MONTHS", rset.getInt("WARRANTY_PERIOD_MONTHS"));
                obj.put("EXTERNAL_URL", rset.getString("EXTERNAL_URL"));
                obj.put("ATTRIBUTE_CATEGORY", rset.getString("ATTRIBUTE_CATEGORY"));
                obj.put("ATTRIBUTE1", rset.getString("ATTRIBUTE1"));
                obj.put("ATTRIBUTE2", rset.getString("ATTRIBUTE2"));
                obj.put("ATTRIBUTE3", rset.getString("ATTRIBUTE3"));
                obj.put("ATTRIBUTE4", rset.getString("ATTRIBUTE4"));
                obj.put("ATTRIBUTE5", rset.getString("ATTRIBUTE5"));
                obj.put("CREATED_BY", rset.getString("CREATED_BY"));
                obj.put("CREATION_DATE", rset.getString("CREATION_DATE"));
                obj.put("LAST_UPDATED_BY", rset.getString("LAST_UPDATED_BY"));
                obj.put("LAST_UPDATE_DATE", rset.getString("LAST_UPDATE_DATE"));
                obj.put("OBJECT_VERSION_ID", rset.getInt("OBJECT_VERSION_ID"));

                products.add(obj);

                System.out.println("Product ID is " + rset.getString(1) + " " + rset.getString(2) + " " + rset.getString(3) + " " + " " + rset.getString(4));

            }
            // Close the RseultSet
            rset.close();
            rset = null;

            // Close the Statement
            stmt.close();
            stmt = null;
            
            conn.close();
            return products;

        } catch (SQLException e) {
            System.out.println("Connection Unsuccessful with errror " + e.getMessage());
            e.printStackTrace();
        }
        return products;
    }
public static void deleteProducts(int productID) {
        try {
            OracleDataSource ODS = new OracleDataSource();

            ODS.setURL("jdbc:oracle:thin:@" + INSTANCE + "?TNS_ADMIN=" + CREDENTIALS);
            ODS.setUser(USER);
            ODS.setPassword(PASSWORD);
            //ODS.getConnection();
            Connection conn = ODS.getConnection();
            System.out.println("Connection test Succeeded. You are connected to ATP as Admin!");
            Statement stmt = conn.createStatement();
            // Select the ENAME column from the EMP table
            stmt.executeUpdate("DELETE FROM PRODUCTS WHERE PRODUCT_ID="+productID);            
            // Close the Statement
            stmt.close();
            stmt = null;   
            conn.close();
        } catch (SQLException e) {
            System.out.println("Connection Unsuccessful with errror " + e.getMessage());
            e.printStackTrace();
        }
    }
public static void saveProducts(String url, String prodname) {
    readProperties();
        try {
            OracleDataSource ODS = new OracleDataSource();

            ODS.setURL("jdbc:oracle:thin:@" + INSTANCE + "?TNS_ADMIN=" + CREDENTIALS);
            ODS.setUser(USER);
            ODS.setPassword(PASSWORD);
            //ODS.getConnection();
            Connection conn = ODS.getConnection();
            System.out.println("Connection test Succeeded. You are connected to ATP as Admin!");
            Statement stmt = conn.createStatement();
            Random rand = new Random();
            int n = rand.nextInt(5000) + 1;
            // Select the ENAME column from the EMP table
 stmt.executeUpdate("INSERT INTO PRODUCTS (PRODUCT_ID, PARENT_CATEGORY_ID, CATEGORY_ID, PRODUCT_NAME, PRODUCT_STATUS, COST_PRICE, LIST_PRICE, MIN_PRICE, warranty_period_months, EXTERNAL_URL, ATTRIBUTE_CATEGORY, ATTRIBUTE1, ATTRIBUTE2, ATTRIBUTE3, ATTRIBUTE4, ATTRIBUTE5, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE, OBJECT_VERSION_ID) VALUES ("+n+", 10003.0, 10012.0, '"+prodname+"', 'AVAILABLE', 3.49, 4.99, 1.53, '6', '"+url+"', '', '', '', '', '', '6', '0', to_date('10-JAN-14', 'DD-MON-RR'), '0', to_date('10-JAN-14', 'DD-MON-RR'), 1.0)");            
//stmt.executeUpdate("INSERT INTO PRODUCTS (PRODUCT_ID, PARENT_CATEGORY_ID, CATEGORY_ID, PRODUCT_NAME, PRODUCT_STATUS, COST_PRICE, LIST_PRICE, MIN_PRICE, warranty_period_months, EXTERNAL_URL, ATTRIBUTE_CATEGORY, ATTRIBUTE1, ATTRIBUTE2, ATTRIBUTE3, ATTRIBUTE4, ATTRIBUTE5, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE, OBJECT_VERSION_ID) VALUES (10020.0, 10000.0, 10017.0, 'Scotch¿ Bubble Pouches, 8 x 10, Clear, Pack Of 8', 'AVAILABLE', 14.37, 16.99, 12.25, '6', 'Images/OfficeSupplyProducts/Ship/Ship-BubbleWrap_8x10.jpg', '', '', '', '', '', '6', '0', to_date('10-JAN-14', 'DD-MON-RR'), '0', to_date('10-JAN-14', 'DD-MON-RR'), 1.0)");            
// Close the Statement
            stmt.close();
            stmt = null;   
            conn.close();
        } catch (SQLException e) {
            System.out.println("Connection Unsuccessful with errror " + e.getMessage());
            e.printStackTrace();
        }
    }

    private static void readProperties() {
        Properties prop = new Properties();
        InputStream input = null;

        try {
            input = WSProductClient.class.getClassLoader().getResourceAsStream("/com/oracle/dbconfig.properties");
            //input = WSProductClient.class.getResource("/com.oracle/dbconfig.properties");
            prop.load(input);
            INSTANCE = prop.getProperty("dbinstance");
            USER = prop.getProperty("dbuser");
            PASSWORD = prop.getProperty("dbpassword");
            CREDENTIALS = prop.getProperty("dbcredpath");
        } catch (IOException e) {
            
        }
    }
}
