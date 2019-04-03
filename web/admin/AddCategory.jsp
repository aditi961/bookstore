<%-- 
    Document   : AddCategory
    Created on : Jun 27, 2018, 9:14:38 PM
    Author     : nEW u
--%>

<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
    Connection con;
    Statement stat;
    ResultSet rs;
    String driver,url,us,pass,query,catId;
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <%
                driver=application.getInitParameter("driver");
                url=application.getInitParameter("url");
                us=application.getInitParameter("user");
                pass=application.getInitParameter("pass");
                Class.forName(driver);
                con=DriverManager.getConnection(url, us, pass);
                query="Select max(right(categoryid,3)) from category";
                stat=con.createStatement();
                rs=stat.executeQuery(query);
                int count=0;
                while(rs.next())
                {
                    if(rs.getString(1)==null)
                    {
                        catId="C"+"001";
                    }
                    else
                    {
                        count=Integer.parseInt(rs.getString(1))+1;
                        catId="C"+String.format("%03d", count);
                    }
                }
            %>
        <div style="margin-top:100px;">
            <form method="post" action="../AddCategory">
                <table>
                    <tr>
                        <td>Book Category ID :</td>
                        <td><input type="text" name="txtID" required readonly value="<%=catId %>" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Enter Category Title :</td>
                        <td><input type="text" name="txtCategory" required /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="btnSubmit" value="Add Category"/></td>
                        <td></td>
                    </tr>
                    
                </table>
            </form>
        </div>
    </body>
</html>
