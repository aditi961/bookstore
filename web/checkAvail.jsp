<%-- 
    Document   : checkAvail
    Created on : May 23, 2018, 11:35:16 PM
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
            select count(*) as count from profile where username='${param.q}';
        </sql:query>   
        <c:forEach items="${result.rows}" var="row">
            <c:set var="count" value="${row.count}"/>
        </c:forEach>
        <c:if test="${count>=1}">
            <h3 style="background-color:red;color:white;">Not Available</h3>
        </c:if>
        <c:if test="${!(count>=1)}">
            <c:out value=" Available" />
        </c:if>
     
    </body>
</html>
