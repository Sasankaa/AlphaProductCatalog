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

/**
 *
 * @author sasanka
 */
public class WSClient {
    public static String requestItem() {
        Client client = ClientBuilder.newClient();
        String output="Default";
        WebTarget target = client.target("http://localhost:8080/statictweets");
        //using response object to get more information
        Response s = target.request().get();
        //System.out.println("response: " + s.getEntity() + ",  status " + s.getStatus());
        //output = "response: " + s.getEntity() + ",  status " + s.getStatus();
        output = target.request().get(String.class);
        s.close();
        return output;
    }
}
