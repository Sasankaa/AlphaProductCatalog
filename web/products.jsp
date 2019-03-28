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
        <link href="https://fonts.googleapis.com/css?family=Archivo|Montserrat|Rokkitt" rel="stylesheet">

        <script type="text/javascript">
             <!-- Handle data for the modal --> 
            function popUpTheModal(tag, titl) {
                setTimeout(function () {
                    $('.loading-spinner').addClass('hidden');
                }, 1000);
                $('#myModal').modal('toggle');
                var iFrame = '<iframe src="main.jsp?param=' + tag + '" style="width: 100%; height: 600px;"></iframe>';
                $('.modal-body').html(iFrame);
                var title = '<p>' + titl + '</p>';
                $('.modal-title').html(title);
                $('.loading-spinner').removeClass('hidden');
                }
            function popUpDeleteModal(tag, titl) {
                setTimeout(function () {
                    $('.loading-spinner').addClass('hidden');
                }, 1000);
                $('#DeleteModal').modal('toggle');
                var iFrame = '<iframe src="delete.jsp?param=' + tag + '" style="width: 100%; height: 300px;"></iframe>';
                $('.modal-body').html(iFrame);
                var title = '<p>' + titl + '</p>';
                
                $('.loading-spinner').removeClass('hidden');               
                }
             function reloadPage(){
                location.reload(true);
             }
             function doSubmit() { 
                window.open("products.jsp","_self"); 
            } 
            function popUpCreateModal(tag, titl) {
                setTimeout(function () {
                    $('.loading-spinner').addClass('hidden');
                }, 1000);
                $('#DeleteModal').modal('toggle');
                var iFrame = '<iframe src="add.jsp?param=' + tag + '" style="width: 100%; height: 300px;"></iframe>';
                $('.modal-body').html(iFrame);
                var title = '<p>' + titl + '</p>';
                
                $('.loading-spinner').removeClass('hidden');               
                }
        </script>
    </head>

    <body>
<div class="loading-spinner hidden">
        </div>
        <div id="title">
            <h2>Alpha Office Supply<span id="podColor"></span></h2>
        </div>


        <div class="container">
            <br>
            
            <a class="btn btn-primary" href="#" onclick="popUpCreateModal('', '')">Add More Products</a>
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
                        <% if (i < productList.size()){ %>
                        <% Product productR1 = productList.get(i);%>
                        <!-- Pass the variable to modal --> 
                        <div class="card" onclick="popUpTheModal('<%= productR1.TWITTER_TAG%>', '<%= productR1.PRODUCT_NAME%>')">

                            <%! String tag;%>
                            <% tag = productR1.TWITTER_TAG; %>
                            <% out.print("<img class='productImage card-img-top' src=" + productR1.EXTERNAL_URL + ");>");%>
                            <br>

                            <div class="productNameDiv card-body" >
                                <a ><% out.print(productR1.PRODUCT_NAME); %></a><br>
                                <a class="bold">Price: $ </a><% out.print(productR1.LIST_PRICE); %><br>

                            </div>
                             
                        </div>
                                <div>
                                        <a class="close" href="#" onclick="popUpDeleteModal('<%= productR1.PRODUCT_ID%>', '<%= productR1.PRODUCT_NAME%>')">×</a>
                                </div>
                        
                    </td>
                    
                    <%i++;%>
                    
                    <!-- End of loop for breaking the row --> 
                    <% }} %>
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
            <!-- The Modal - Delete -->
            <div class="modal" id="DeleteModal" tabindex="-1" >
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
                            <button type="button" class="btn btn-danger" onclick="doSubmit();">Close</button>
                        </div>

                    </div>
                </div>
            </div>
            <% }%>
        </div>

    </body>

</html>

