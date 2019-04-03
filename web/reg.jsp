<%-- 
    Document   : reg
    Created on : May 15, 2018, 11:13:30 PM
    Author     : nEW u
--%>

<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <script type="text/javascript">
        function checkUser(str)
        {
            var ajaxRequest;
            try
            {
                ajaxRequest=new XMLHttpRequest();
            }catch(e)
            { 
                try
                {
                    ajaxRequest=new ActiveXObject("MSxml2.XMLHTTP");
                }
                catch(e)
                {
                    try
                    {
                        ajaxRequest=new ActiveXObject("Mirosoft.XMLHTTP");
                    }
                    catch(e)
                    {
                        alert("your browser broke!");
                    }
                }
            }
        ajaxRequest.onreadystatechange=function()
        {
            if(ajaxRequest.readyState==4)
            {
                document.getElementById('status').innerHTML=ajaxRequest.responseText;
            }
        }
        ajaxRequest.open("GET","checkAvail.jsp?q="+str,true);
        ajaxRequest.send(null);
    }
    function inputCity(str)
        {
            var ajaxRequest;
            try
            {
                ajaxRequest=new XMLHttpRequest();
            }catch(e)
            { 
                try
                {
                    ajaxRequest=new ActiveXObject("MSxml2.XMLHTTP");
                }
                catch(e)
                {
                    try
                    {
                        ajaxRequest=new ActiveXObject("Mirosoft.XMLHTTP");
                    }
                    catch(e)
                    {
                        alert("your browser broke!");
                    }
                }
        }
        ajaxRequest.onreadystatechange=function()
        {
            if(ajaxRequest.readyState==4)
            {
                document.getElementById('city').innerHTML=ajaxRequest.responseText;
            }
        }
        ajaxRequest.open("GET","checkCity.jsp?q="+str,true);
        ajaxRequest.send(null);
    }
    </script>
    <script type="text/javascript">
            function validateForm()
            {
                if(document.getElementById('txtPswd').value!=document.getElementById('txtRepswd').value)
                {
                    alert('passwords do not match');
                    document.getElementById('txtRepswd').focus();
                    return false;
                }
                if(document.getElementById('state').value=='unknown')
                {
                    alert('Please enter the state');
                    document.getElementById('state').focus();
                    return false;
                }
                if(document.getElementById('rbmale').checked==false&&document.getElementById('rbfemale').checked==false)
                {
                    alert('Please enter the gender');
                    return false;
                }
                return true;
            }
                    
            </script>
    </head>
    
    <body>
        <h1 style="text-align: center;font-style: italic;font-size: x-large;">WELCOME..!!</h1>
        <form method="post" action="SaveUser" onSubmit="return validateForm()">
            <table>
                <tr>
                    <td>Choose Username:</td>
                    <td><input type="text" name="txtName" id="txtName" onblur="checkUser(this.value)" required/></td>
                
                    <td id='status'></td>
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
                    <td>Choose password:</td>
                    <td><input type="password" name="txtPswd" id="txtPswd" required/></td>
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
                    <td>Re-Type Password:</td>
                    <td><input type="password" name="txtRepswd" id="txtRepswd" required/></td>
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
                    <td>Select State:</td>
                            <td><select name="state" id="state" onchange="inputCity(this.value)">
                                    <option id="unknown">Select State</option>
                                    <sql:setDataSource  var="con" driver="${initParam.driver}" url="${initParam.url}" user="${initParam.user}" password="${initParam.pass}"/>
                                    <sql:query dataSource="${con}" var="result">
                                        select sname from state;
                                    </sql:query>
                                    <c:forEach items="${result.rows}" var="row">
                                        <option><c:out value ="${row.sname}"/></option>
                                    </c:forEach>
                        </select></td>
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
                    <td>Select City:</td>
                    <td><select name="city" id="city" >
                            <option value='unknown'>select city</option>
                        </select></td>
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
                    <td>Gender:</td>
                    <td><input type="radio"name="gender" id='rbmale' value="M"/>Male</td>
                    <td><input type="radio"name="gender" id='rbfemale' value="F"/>Female</td>
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
                    <td>Enter your Security Question:</td>
                    <td><select name="SecQues" id="SecQues">
                            <option>Your favourite no.</option>
                            <option>Your mother's maiden name</option>
                            <option>Your favourite color</option>
                            <option>Your favourite movie</option>
                        </select></td>
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
                    <td>Your Answer:</td>
                    <td><input type="text" name="SecAns" id="SecAns"/></td>
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
                    <td>Enter your Profile picture:</td>
                    <td><input type="file" name="Upload" value="Upload File"/></td>
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
                    <td><input type="submit"name="submit" value="Register"/></td>
                    <td></td>
                    <td></td>
                </tr>
            </table>
        </form>
    </body>
</html>
