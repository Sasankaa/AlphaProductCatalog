<%-- 
    Document   : products
    Created on : Jul 26, 2018, 5:34:47 PM
    Author     : varuny
--%>

<%@page import="com.oracle.WSProductClient"%>
<%@page import="com.oracle.Product"%>
<%@page import="java.util.*"%>
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
        <script>
        function popup(param){
               window.open("http://localhost:9999/build/main.jsp?param=",'Image','width=largeImage.stylewidth,height=largeImage.style.height,resizable=1');

        }    
        </script>
    </head>
    <body>
        <div id="title">
            <h1>Alpha Office Supply<span id="podColor"></span></h1>
        </div>
        <br>
        <br>
        <%
            List<Product> productList = WSProductClient.requestItem().Products;
            //for (int i = 0; i < productList.size(); i++) {
            int i = 0;
            while (i < productList.size()) {
        %>
        
        <table style="border-spacing:0px">
            <tr>
                <td class="productTd">
                        <% Product productR1 = productList.get(i);%>
                        
                        <% out.print("<img src='" + productR1.EXTERNAL_URL + "' border='0';class=productImage; onClick=window.open('main.jsp?param=" + productR1.TWITTER_TAG + "','mywindow','width=600,height=800');>"); %>
                        <br>
                        <div class="productNameDiv">
                            <% out.print(productR1.PRODUCT_NAME); %><br>
                        Price: $ <% out.print(productR1.LIST_PRICE); %>
                        
                        </div>
                        <%i++;%>
                        
                </td>
                <td class="productTd">
                        <% Product productR2 = productList.get(i);%>                       
                        <% out.print("<img src='" + productR2.EXTERNAL_URL + "' border='0';class=productImageon; onClick=window.open('main.jsp','mywindow','width=600,height=800');>"); %>
                        <br>
                        <div class="productNameDiv">
                            <% out.print(productR2.PRODUCT_NAME); %><br>
                        Price: $ <% out.print(productR2.LIST_PRICE); %>
                        
                        </div>
                        <%i++;%>

                </td>
                <td class="productTd">
                        <% Product productR3 = productList.get(i);%>
                        <% out.print("<img src='" + productR3.EXTERNAL_URL + "' border='0';class=productImage; onClick=window.open('main.jsp','mywindow','width=600,height=800');>"); %>
                        <br>
                        <div class="productNameDiv">
                            <% out.print(productR3.PRODUCT_NAME); %><br>
                        Price: $ <% out.print(productR3.LIST_PRICE); %>
                        
                        </div>
                        <%i++;%>
                </td>
            </tr>
        </table>



        <% }%>
        
    </body>
</html>
