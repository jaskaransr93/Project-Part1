<%@ page import="java.io.*,java.util.*,java.sql.*,Configs.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<html>
    <head>
        <title>Admin - Product List</title>
        <script>
            function confirmGo(m,u) {
                if ( confirm(m) ) {
                    window.location = u;
                }
            }
        </script>
    </head>
    <body> 
 
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/project_part1"
                           user="${DbConfig.username}"  password="${DbConfig.password}"/>
 		<form style="display:inline-block">
 			<input type="text" name="search" />
 			<input type="submit" value="Search" />
 		</form>
 		<form style="display:inline-block">
 		 	<input type="hidden" name="search" value="" />
 			<input type="submit" value="Clear" />
 		</form>
 		<c:choose>
 			<c:when test="${empty param.search}">
 			    <sql:query dataSource="${dbsource}" var="result">
            		SELECT * from user;
        		</sql:query>
 			</c:when>
 			<c:otherwise>
				<sql:query dataSource="${dbsource}" var="result">
            		SELECT * from user
            		WHERE username LIKE '%${param.search}%' 
            		OR cellno LIKE '%${param.search}%' 
            		OR email LIKE '%${param.search}%'
            		OR uname LIKE '%${param.search}%'
            		OR address LIKE '%${param.search}%'
        		</sql:query>
 			</c:otherwise>
 		</c:choose>

    
        <form>
            <table border="1">
                <caption>User List</caption>
                <tr>
                    <th>Username</th>
                    <th>Cell no.</th>
                    <th>Email</th>
                    <th>Name</th>
                    <th>Address</th>
                </tr>
			<c:forEach var="row" items="${result.rows}">
				<tr>
					<td><c:out value="${row.username}" /></td>
					<td><c:out value="${row.cellno}" /></td>
					<td><c:out value="${row.email}" /></td>
					<td><c:out value="${row.uname}" /></td>
					<td><c:out value="${row.address}" /></td>

				</tr>
			</c:forEach>
		</table>
        </form>
        <a href="index.jsp">Go Home</a>
   
</body>
</html>