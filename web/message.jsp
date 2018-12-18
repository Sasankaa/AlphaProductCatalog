<%-- 
    Document   : message.jsp
    Created on : Dec 13, 2018, 2:55:47 AM
    Author     : sasanka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post" action="SaveServlet">
        <h2>${requestScope.message}</h2>
        Upload Image : <input type="text" name="url" value=${requestScope.url} >
        Product Name : <input type="text" name="prodname" >
        <input type="submit" value="Save" class="btn btn-default" />
        </form>
    </body>
</html>
