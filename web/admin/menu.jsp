<%-- 
    Document   : menu
    Created on : Jun 17, 2018, 9:00:42 PM
    Author     : nEW u
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../menucss.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div id='menu'>
            <ul>
                <li>Welcome <%--<%= user %>--%></li>
                <li><a href="#">Services &#9660;</a> 
                    <ul>
                        <li><a href="AddBook.jsp">Add New Book</a></li>
                        <li><a href="UpdateBook.jsp">Update Book Details</a></li>
                        <li><a href="AddCategory.jsp">Add Book Category</a></li>
                        <li><a href="ReOrder.jsp">Books To Re-Order</a></li>
                    </ul>
                </li>
                <li><a href="logout.jsp">Logout</a></li>
                
            </ul>
            <br clear="all"/>
        </div>
    </body>
</html>
