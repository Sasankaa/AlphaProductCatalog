<%-- 
    Document   : products
    Created on : Jul 26, 2018, 5:34:47 PM
    Author     : varuny
--%>

<%@page import="java.util.*, com.oracle.getProducts,com.oracle.Products,com.oracle.Product_"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Products</title>
                <link type="text/css" rel="stylesheet" href="css/alpha.css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
              integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
              crossorigin="anonymous"/>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
                integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
        crossorigin="anonymous"></script>
    </head>
    <body>
        <h1>Alpha Office Page</h1>

        <% List<Product_> productList = getProducts.requestProducts().products;
            for (int i = 0; i < productList.size(); i++) {
                Product_ product = productList.get(i); %>

        <table class="tweetTable">
            <tr>
                <td class="tweetRow1LeftTd">
                    <span class="tweetNameSpan">
                        <% out.print(product.getPRODUCTNAME()); %></span><br/><span class="tweetScreennameSpan">
                        <% System.out.print("@" + product.getPRODUCTNAME()); %></span>
                </td>
            </tr>
        </table>
                
                <p> <% out.print(product.getPRODUCTNAME()); %></p>
                 <p> <% System.out.print("@" + product.getPRODUCTNAME()); %></p>

        <% }%>
        <div class="container">
            <div class="row">
                <div class="col-sm-3"><p>A</p></div>
                <div class="col-sm-3"><p>b</p></div>
                <div class="col-sm-3"><p>c</p></div>
                <div class="col-sm-3"><p>d</p></div>
            </div>
        </div>
    </body>
</html>
