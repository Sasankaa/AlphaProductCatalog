/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.oracle;

import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.net.URL;


public class WSClient {

    public static String testJSP(String str) {
        return str.toLowerCase();
    }
    
    public static Tweets requestItem() {
        Client client = ClientBuilder.newClient();
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        Tweets twt = new Tweets();
        try {
            twt = objectMapper.readValue(new URL("https://cdn.rawgit.com/varunyn/f4eecf76915ac6bebb962140f0320a02/raw/8e42d5424052f187ef9563a8c949735998e6ad2e/tweets.json"), Tweets.class);

        } catch (IOException ex) {
            Logger.getLogger(WSClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return twt;
    }
}
