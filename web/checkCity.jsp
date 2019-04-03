<%-- 
    Document   : checkCity
    Created on : May 24, 2018, 11:29:51 PM
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
    </head>
    <body>
        <sql:setDataSource var="con" driver="${initParam.driver}" url="${initParam.url}" user="${initParam.user}" password="${initParam.pass}"/>
        <sql:query dataSource="${con}" var="result">
            select cname from city where sid=(select sid from state where sname='${param.q}');
        </sql:query>
        <c:forEach items="${result.rows}" var="row">
        <option><c:out value="${row.cname}" /></option>
    </c:forEach>
       
    </body>
</html>
