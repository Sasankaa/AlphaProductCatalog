/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.oracle;

import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.Response;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author sasanka
 */
public class WSClient {

    public static String requestItem() {
        Client client = ClientBuilder.newClient();

//        WebTarget target = client.target("http://localhost:8080/statictweets");
//        Response s = target.request().get();
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);

        String filterOutput = "";
        System.out.println("TRY");
        try {
            Tweets twt = objectMapper.readValue(new URL("http://localhost:8080/statictweets"), Tweets.class);

            filterOutput = objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(twt);
            //filterOutput += twt.getId();
// Tweet t = new Tweet();
//            Long ID = t.id;
//            System.out.println(ID);
            System.out.println(twt);
        } catch (IOException ex) {
            Logger.getLogger(WSClient.class.getName()).log(Level.SEVERE, null, ex);
        }

        //String[] lines = output.split(",");
        //for (String line : lines) {
        //    output += line +"\\n";
        //}
//        s.close();
        return filterOutput;
    }

    private static void requestOrderById(Client client, String id) {
        WebTarget target = client.target("http://localhost:8080/statictweets" + id);
        String s = target.request().get(String.class);
        System.out.println("response : " + s);
    }
}
