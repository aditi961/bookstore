<%-- 
    Document   : index
    Created on : May 15, 2018, 9:25:23 PM
    Author     : nEW u
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head> 
    <body style="background-image:url('images/imgg.jpg');background-size:100%">
        <div style="font-size: 40pt;font-color:maroon;border:2pt solid black;text-align: center;">ONLINE BOOK STORE
        </div>
        <div style="float:right;margin-top: 150px">
            <form method="post" action="VerifyUser">
            <table> 
                <tr>
                <td>USERNAME:</td>
                <td>
                    <input type="text" name="txtUser" value="${cookie.uname.value}" required/>
                    
                </td>
                <td></td>
                </tr>    
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>PASSWORD:</td>
                    <td>
                        <input type="password" name="txtPswd" value="${cookie.pswd.value}" required/>
                       
                        </td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td><input type="submit" name="submit" value="Login"/></td>
                    <td><a href="reg.jsp">New User</a></td>
                    <td><a href="forget.jsp">Forgot Password?</td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="rem" value="yes"/>Remember Me</td>
                    <td></td>
                    <td></td>
                </tr>
            </table>
            </form>
        </div>
    </body>
</html>
    
    
