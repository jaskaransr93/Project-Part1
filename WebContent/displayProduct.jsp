<%@ page import="java.io.*,java.util.*,java.sql.*, Configs.*"%>
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
		url="jdbc:mysql://localhost:3306/project_part1" user="${DbConfig.username}"
		password="${DbConfig.password}" />

	<form style="display: inline-block">
		<input type="text" name="search" /> <input type="submit"
			value="Search" />
	</form>
	<form style="display: inline-block">
		<input type="hidden" name="search" value="" /> <input type="submit"
			value="Clear" />
	</form>

	<c:choose>
		<c:when test="${empty param.search}">
			<sql:query dataSource="${dbsource}" var="result">
            		SELECT * from product;
        		</sql:query>
		</c:when>
		<c:otherwise>
			<sql:query dataSource="${dbsource}" var="result">
            		SELECT * from product
            		WHERE product_name LIKE '%${param.search}%' 
            		OR color LIKE '%${param.search}%' 
        		</sql:query>
		</c:otherwise>
	</c:choose>

	<form>
		<table border="1">
			<caption>Product List</caption>
			<tr>
				<th>Product Name</th>
				<th>color</th>
				<th colspan="2">Action</th>
			</tr>
			<c:forEach var="row" items="${result.rows}">
				<tr>
					<td><c:out value="${row.product_name}" /></td>
					<td><c:out value="${row.color}" /></td>
					<td><a
						href="updateProduct.jsp?product_name=<c:out value="${row.product_name}"/>">Update</a></td>
					<td><a
						href="javascript:confirmGo('Sure to delete this record?','deleteProductdb.jsp?product_name=<c:out value="${row.product_name}"/>')">Delete</a></td>

				</tr>
			</c:forEach>
		</table>
	</form>
	<a href="index.jsp">Go Home</a>

</body>
</html>
s
