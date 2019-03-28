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
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <title>JSP Page</title>
    </head>
    <body>
        
        <h2>Product Image Upload</h2>
    <form method="post" action="UploadServlet"
        enctype="multipart/form-data">
       <div class="form-group">
        Select product image to upload: <input type="file" name="file" size="60" /><br />
        <br /> <input type="submit" value="Upload"  />
       </div>
    </form>
    </body>
</html>
