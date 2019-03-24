<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,Configs.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/project_part1"
                           user="${DbConfig.username}"  password="${DbConfig.password}"/>
                           
        <sql:update dataSource="${dbsource}" var="count">
            UPDATE product 
            SET color=?, product_name=?
            WHERE id=?
            <sql:param value="${param.color}" />
            <sql:param value="${param.product_name}" />
            <sql:param value="${param.id}" />
        </sql:update>
        <c:choose>
        	<c:when test="${count>=1}"> 
            	<c:redirect url="displayProduct.jsp">
            		<c:param name="susMsg" value="Congratulations ! Data updated
            		successfully."></c:param>
            	</c:redirect>
        	</c:when>
        	<c:otherwise>
        		<c:redirect url="displayProduct.jsp">
            		<c:param name="errMsg" value="Failed to update record."></c:param>
            	</c:redirect>
        	</c:otherwise>
        </c:choose>
    </body>
</html>