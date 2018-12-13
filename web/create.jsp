<%-- 
    Document   : create
    Created on : Dec 12, 2018, 7:46:54 PM
    Author     : sasanka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <title>CREATE Page</title>
    </head>
    <body>

        <form>
            <div class="form-group">
                <label for="productName">Product Name</label>
                <input type="text" class="form-control" name="productName" aria-describedby="emailHelp" placeholder="Enter Product ID Ex: 10011">
            </div>
            <div class="form-group">
                <label for="productStatus">Product Status</label>
                <input type="text" class="form-control" name="productStatus" aria-describedby="emailHelp" placeholder="Enter Status Ex: Available">
            </div>
            <div class="form-group">
                <label for="costPrice">Cost Price</label>
                <input type="text" class="form-control" name="costPrice" aria-describedby="emailHelp" placeholder="Enter Cost Price Ex: 7.99">
            </div>
            <div class="form-group">
                <label for="listPrice">List Price</label>
                <input type="text" class="form-control" name="listPrice" aria-describedby="emailHelp" placeholder="Enter List Price Ex: 8.99">
            </div>
    </body>
</html>
