<%-- 
    Document   : delete
    Created on : Dec 7, 2018, 2:43:03 PM
    Author     : sasanka
--%>
<%@page import="com.oracle.WSProductClient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Page</title>
    </head>
    <body>
        
        <%
            int productID = Integer.parseInt(request.getParameter("param"));
            WSProductClient.deleteProducts(productID);
            out.print("Successfully Deleted your select product.");
            %>
       <%-- <form action="Delete" method="POST"> 
            <input type="submit" value="Delete" /> 
           --%>
        </form>
    </body>
</html>
