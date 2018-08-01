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
function reload() {
  document.getElementById('iFrameID').contentDocument.location.reload(true);
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
            <%! String tag;%>
            <%
                List<Product> productList = WSProductClient.requestItem().Products;
                //for (int i = 0; i < productList.size(); i++) {
                int i = 0;
                while (i < productList.size()) {
            %>

            <table  class=".table-borderless">
                <tr>
                    <%for (int j = 0; j < 4; j++) { %>
                    <td class="productTd" data-toggle="modal" data-target="#modal<%=i%>"  style="width: 25%">
                        <div class="card">
                            <% Product productR1 = productList.get(i); %>

                            <% tag = productR1.TWITTER_TAG; %>



                            <% out.print("<img class='productImage card-img-top' src='" + productR1.EXTERNAL_URL + "');>");%>

                            <br>
                            <div class="productNameDiv card-body" >

                                <% out.print(productR1.PRODUCT_NAME); %><br>
                                Price: $ <% out.print(productR1.LIST_PRICE); %><br>
                                <% out.print(i);%>
                            </div>
                              </td>
                            <!-- The Modal -->
                            <div class="modal" id="modal<%=i%>" tabindex="-1" role="dialog">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">

                                        <!-- Modal Header -->
                                        <div class="modal-header">
                                            <h4 class="modal-title">Modal Heading</h4>
                                            <button type="button" class="close" data-dismiss="modal" onclick="reload()">&times;</button>
                                        </div>

                                        <!-- Modal body -->
                                        <div class="modal-body">
                                            
                                            <iframe id="iFrameID" src="main.jsp?param=<%= tag%>" style="width: 100%; height: 600px;" ng-onload="page.handleFrameLoaded(event)"> </iframe>
                                                <% out.print(tag); %>
                                        </div>

                                        <!-- Modal footer -->
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                        </div>

                                    </div>
                                </div>
                            </div> 
                      
                            <%i++;%>
                        </div>



                        <% } %>


                </tr>
            </table>
            <% }%>

        </div>

    </body>
</html>
