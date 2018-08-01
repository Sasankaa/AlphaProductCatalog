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
import java.util.List;
import com.oracle.Tweet;
import com.oracle.Tweets;
import java.util.ArrayList;
import java.util.Iterator;

public class WSClient {

    public static Tweets requestItem() {
//        Client client = ClientBuilder.newClient();
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        Tweets twt = new Tweets();

        try {
            twt = objectMapper.readValue(new URL("https://rawgit.com/varunyn/f4eecf76915ac6bebb962140f0320a02/raw/8e42d5424052f187ef9563a8c949735998e6ad2e/tweets.json"), Tweets.class);

        } catch (IOException ex) {
            Logger.getLogger(WSClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return twt;
    }

    public static List<Tweet> requestFilter(String param) {
        List<Tweet> tweet = WSClient.requestItem().tweets;
        List<Tweet> tweets = new ArrayList<>();
        try {
            Iterator itr = tweet.iterator();
            while (itr.hasNext()) {
                Tweet twt = (Tweet) itr.next();
                //Tweet twt = tweet.get(x); 
                if (twt.getText().contains(param)) {
                    tweets.add(twt);//itr.remove();
                }
            }
        } catch (NullPointerException e) {
        }
        return tweets;
    }

}
