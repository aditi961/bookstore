<%-- 
    Document   : BookInfo
    Created on : Jul 4, 2018, 5:57:47 PM
    Author     : nEW u
--%>

<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
    Connection con;
    Statement stat;
    ResultSet rs;
    String user, driver, url, pass, query, title;
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post" action="../UpdateBook?title=${param.q}">
            <table>
                <%
                    driver = application.getInitParameter("driver");
                    url = application.getInitParameter("url");
                    user = application.getInitParameter("user");
                    pass = application.getInitParameter("pass");
                    title = request.getParameter("q");
                    Class.forName(driver);
                    con = DriverManager.getConnection(url, user, pass);
                    stat = con.createStatement();
                    query = "select * from product where pname='" + title + "'";
                    rs = stat.executeQuery(query);
                    while (rs.next()) {
                %>
                <tr>
                    <td>Book Id:</td>
                    <td><input type="text" value="<%=rs.getString(1)%>" readonly/></td>
                    <td></td>
                </tr>
                <%
                    }
                %>
            </table>
        </form>
    </body>
</html>
