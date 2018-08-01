<%-- 
    Document   : products
    Created on : Jul 26, 2018, 5:34:47 PM
    Author     : varuny
--%>

<%@page import="com.oracle.WSProductClient"%>
<%@page import="com.oracle.Product"%>
<%@page import="com.oracle.Products"%>
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

        <script type="text/javascript">
            function popUpTheModal(data, titl) {
                $('#myModal').modal('toggle');
                var iFrame = '<iframe src="main.jsp?param=' + data + '" style="width: 100%; height: 600px;"></iframe>';
                $('.modal-body').html(iFrame);
                var title = '<p>' + titl + '</p>';
                $('.modal-title').html(title);
            }
        </script>
    </head>
    <body>

        <div id="title">
            <h1>Alpha Office Supply<span id="podColor"></span></h1>
        </div>

        <div class="container">
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
                    <%for (int j = 0; j < 4; j++) { %>
                    <td class="productTd" data-toggle="modal" data-target="modal-lg"  style="width: 25%">
                        <% Product productR1 = productList.get(i);%>
                        <div class="card" onclick="popUpTheModal('<%= productR1.TWITTER_TAG%>', '<%= productR1.PRODUCT_NAME%>')">

                            <%! String tag;%>
                            <% tag = productR1.TWITTER_TAG; %>
                            <% out.print("<img class='productImage card-img-top' src='" + productR1.EXTERNAL_URL + "');>");%>
                            <br>
                            <div class="productNameDiv card-body" >
                                <% out.print(productR1.PRODUCT_NAME); %><br>
                                Price: $ <% out.print(productR1.LIST_PRICE); %><br>
                                <% out.print(i);%>
                            </div>
                    </td>

                    <%i++;%>
                    </div>
                    <% } %>
                </tr>
            </table>

            <!-- The Modal -->
            <div class="modal" id="myModal" tabindex="-1" >
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title"></h4>
                            <button type="button" class="close" data-dismiss="modal" >&times;</button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body">
                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        </div>

                    </div>
                </div>
            </div>
            <% }%>
        </div>
    </body>
</html>

