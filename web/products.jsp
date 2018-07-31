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
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

    </head>
    <body>

        <div id="title">
            <h1>Alpha Office Supply<span id="podColor"></span></h1>
        </div>

        <div class="container">
            <!-- The Modal -->
            <div class="modal" id="myModal">
                <div class="modal-dialog">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">Modal Heading</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body">
                            <iframe src="main.jsp?param=Crayola" width="400"></iframe>
                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        </div>

                    </div>
                </div>
            </div>

            <br>
            <br>
            <%
                List<Product> productList = WSProductClient.requestItem().Products;
                //for (int i = 0; i < productList.size(); i++) {
                int i = 0;
                while (i < productList.size()) {
            %>

            <table  class=".table-borderless">
                <tr>
                    <td class="productTd "  style="width: 25%">
                        <div class="card">
                            <% Product productR1 = productList.get(i);%>

                            <% out.print("<img class='productImage card-img-top' src='" + productR1.EXTERNAL_URL + "'border='0'; onClick=window.open('main.jsp?param=" + productR1.TWITTER_TAG + "','mywindow','width=600,height=800');>");%>

                            <br>
                            <div class="productNameDiv  card-body">

                                <% out.print(productR1.PRODUCT_NAME); %><br>
                                Price: $ <% out.print(productR1.LIST_PRICE); %>

                            </div>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                                View
                            </button>
                            <%i++;%>
                        </div>
                    </td>
                    <td class="productTd" style="width: 25%">
                        <div class="card">
                            <% Product productR2 = productList.get(i);%>
                            <% out.print("<img class='productImage card-img-top' src='" + productR2.EXTERNAL_URL + "' border='0';class=productImageon; onClick=window.open('main.jsp?param=" + productR2.TWITTER_TAG + "','mywindow','width=600,height=800');>"); %>
                            <br>
                            <div class="productNameDiv card-body">
                                <p class="card-text">
                                    <% out.print(productR2.PRODUCT_NAME); %><br>
                                    Price: $ <% out.print(productR2.LIST_PRICE); %>
                                </p>
                            </div>
                            <%i++;%>
                        </div>
                    </td>
                    <td class="productTd" style="width: 25%">
                        <div class="card">
                            <% Product productR3 = productList.get(i);%>
                            <% out.print("<img class='productImage card-img-top' src='" + productR3.EXTERNAL_URL + "' border='0';class=productImage; onClick=window.open('main.jsp?param=" + productR3.TWITTER_TAG + "','mywindow','width=600,height=800');>"); %>                 
                            <br>
                            <div class="productNameDiv card-body">
                                <p class="card-text ">
                                    <% out.print(productR3.PRODUCT_NAME); %><br>
                                    Price: $ <% out.print(productR3.LIST_PRICE); %>
                                </p>
                            </div>
                            <%i++;%>
                        </div>
                    </td>
                    <td class="productTd" style="width: 25%">
                        <div class="card">
                            <% Product productR4 = productList.get(i);%>
                            <% out.print("<img class='productImage card-img-top' src='" + productR4.EXTERNAL_URL + "' border='0';class=productImage; onClick=window.open('main.jsp?param=" + productR4.TWITTER_TAG + "','mywindow','width=600,height=800');>"); %>                 
                            <br>
                            <div class="productNameDiv  card-body">
                                <p class="card-text">  <% out.print(productR3.PRODUCT_NAME); %><br>
                                    Price: $ <% out.print(productR3.LIST_PRICE); %>
                                </p>
                            </div>
                            <%i++;%>
                        </div>
                    </td>
                </tr>
            </table>
            <% }%>
        </div>
 

    </body>
</html>
