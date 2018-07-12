<%-- 
    Document   : main
    Created on : Jul 12, 2018, 6:25:56 AM
    Author     : sasanka
--%>

<%@page import="com.oracle.WSClient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            out.println(WSClient.requestItem());            
        %>
    </body>
</html>
