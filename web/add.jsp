<%-- 
    Document   : add
    Created on : Dec 13, 2018, 2:16:16 AM
    Author     : sasanka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>JSP Page</title>
    </head>
    <body>
        
        <h1>Create Upload</h1>
    <form method="post" action="UploadServlet"
        enctype="multipart/form-data">
        
        Select product image to upload: <input type="file" name="file" size="60" /><br />
        <br /> <input type="submit" value="Upload" />
    </form>
    </body>
</html>