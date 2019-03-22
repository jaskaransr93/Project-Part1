<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, Configs.*"%>
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
		user="${DbConfig.username}" password="${DbConfig.password}" />
	<sql:update dataSource="${dbsource}" var="count">
            DELETE FROM product
            WHERE product_name=?
            <sql:param value="${param.product_name}" />
	</sql:update>
	<c:if test="${count>=1}">
		<font size="5" color='green'> Congratulations ! Data deleted
			successfully.</font>
		<a href="index.jsp">Go Home</a>
	</c:if>
</body>
</html>