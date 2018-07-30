/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.oracle;

import com.fasterxml.jackson.core.type.TypeReference;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.net.URL;
import java.util.List;


/**
 *
 * @author varuny
 */
public class WSProductClient {

    /**
     *
     * @return
     */
    public static Products requestProducts() {
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        Products product = new Products();
        
        try {
            product = objectMapper.readValue(new URL("https://cdn.rawgit.com/varunyn/e22f25315b9fab9760c7b1f1ab1ddf83/raw/14464cbc548dd65da0a2acd4776b2c4377dc8ac8/product-catalog.json"), Products.class);
               
        } catch (IOException ex) {
            Logger.getLogger(WSProductClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return product;
    }
    public static Products requestItem() {
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        Products p = new Products();
        try {
            p = objectMapper.readValue(new URL("https://rawgit.com/varunyn/e22f25315b9fab9760c7b1f1ab1ddf83/raw/14464cbc548dd65da0a2acd4776b2c4377dc8ac8/product-catalog.json"), Products.class);  
        
        } catch (IOException ex) {
            Logger.getLogger(WSClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return p;
    }    
}
