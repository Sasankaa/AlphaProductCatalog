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


public class WSClient {

    public static Tweets requestItem() {
//        Client client = ClientBuilder.newClient();
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        Tweets twt = new Tweets();
        
//        Map<String, Set<Tweet>> tagMap = new TreeMap<>();
        try {
            twt = objectMapper.readValue(new URL("https://rawgit.com/varunyn/f4eecf76915ac6bebb962140f0320a02/raw/8e42d5424052f187ef9563a8c949735998e6ad2e/tweets.json"), Tweets.class);
          
//            twt.tweets.forEach( t -> {
//                String tweetContent = t.getText();
//                String pattern = "#\\w+";
//
//                // Create a Pattern object
//                Pattern r = Pattern.compile(pattern);
//
//                // Now create matcher object.
//                Matcher m = r.matcher(tweetContent);
//                if (m.find( )) {
////                   System.out.println("Found value: " + m.group(0) );
////                   System.out.println("Found value: " + m.group(1) );
////                   System.out.println("Found value: " + m.group(2) );
//                }else {
//                   System.out.println("NO MATCH");
//                }
//                
//            });
//            List<String> tweetContentList = new ArrayList<>();
            

        } catch (IOException ex) {
            Logger.getLogger(WSClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return twt;
    }
}
