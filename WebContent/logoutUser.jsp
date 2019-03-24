<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="java.io.*,java.util.*,java.sql.*,Configs.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logout User</title>
</head>
<body>
	<c:remove var="loginUser" scope="session" />
	<c:remove var="loginUserName" scope="session" />
	<c:choose>
		<c:when test="${param.type == 'admin'}">
			<c:redirect url="adminLoginForm.jsp">
				<c:param name="succMsg" value="Successfully Logged out!" />
			</c:redirect>
		</c:when>
		<c:otherwise>
			<c:redirect url="userLoginForm.jsp">
				<c:param name="succMsg" value="Successfully Logged out!" />
			</c:redirect>
		</c:otherwise>
	</c:choose>

</body>
</html>