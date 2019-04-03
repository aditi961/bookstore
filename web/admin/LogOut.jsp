<%-- 
    Document   : LogOut
    Created on : Jun 27, 2018, 9:18:33 PM
    Author     : nEW u
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
            session.invalidate();
            response.sendRedirect("adminlogin.jsp");
            %>
    </body>
</html>
