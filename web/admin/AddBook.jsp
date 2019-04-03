<%-- 
    Document   : AddBook
    Created on : Jun 27, 2018, 9:13:53 PM
    Author     : nEW u
--%>

<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
    Connection con;
    Statement stat;
    ResultSet rs;
    String driver,url,us,pass,query,id;
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include  file="menu.jsp" %>
        <div style="margin-top:100px;">
            <%
                driver=application.getInitParameter("driver");
                url=application.getInitParameter("url");
                us=application.getInitParameter("user");
                pass=application.getInitParameter("pass");
                Class.forName(driver);
                con=DriverManager.getConnection(url, us, pass);
                query="Select max(right(pid,3)) from  product";
                int i=0;
                stat=con.createStatement();
                rs=stat.executeQuery(query);
                while(rs.next())
                {
                    if(rs.getString(1)==null)
                    {
                        id="B"+"001";
                    }
                    else
                    {
                        i=Integer.parseInt(rs.getString(1))+1;
                        id="B"+String.format("%03d",i);
                    }
                }
                
                %>
            <form method="post" enctype="multipart/form-data" action="../AddBook">
                <table>
                    
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
                        <td>Enter Title of Book:</td>
                        <td><input type="text" name="txtTitle" required style="width:100%" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Book ID :</td>
                        <td><input type="text" name="txtid" value="<%= id%>" readonly style="width:100%" /></td>
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
                        <td>Enter Description of Book :</td>
                        <td>
                            <textarea name="txtDesc" required rows="5" cols="50"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>Enter Price of Book</td>
                        <td><input type="text" name="txtPrice" required  style="width:100%" /></td>
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
                        <td>Enter Quantity :</td>
                        <td>
                            <input type="number" name="txtQty" required style="width:100%" /> 
                        </td>
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
                        <td>Cateogry ID:</td>
                        <td>
                            <select name="ddlCatID" style="width:100%">
                                <%
                                    query="select * from category";
                                    stat=con.createStatement();
                                    rs=stat.executeQuery(query);
                                    while(rs.next())
                                    {
                                        %>
                                        <option value="<%=rs.getString(1) %>"><%=rs.getString(1) %>,<%=rs.getString(2)%></option>
                                        <%
                                    }
                                    %>
                            </select>
                        </td>
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
                        <td>Choose Your Profile Picture :</td>
                        <td>
                            <input type="file" name="btnUpload" />
                        </td>
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
                        <td><input type="submit" value="Save Book" name="btnSubmit" /></td>
                        <td></td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>
