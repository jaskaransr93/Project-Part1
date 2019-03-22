<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,Configs.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>

<body>
	<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/project_part1" user="${DbConfig.username}"
		password="${DbConfig.password}" />
	<sql:query dataSource="${dbsource}" var="result">
            SELECT * from product;
        </sql:query>
	<form action="insertRegisterProduct.jsp" method="post">
		<table border="0" cellspacing="2" cellpadding="5">
			<thead>
				<tr>
					<th colspan="2">Claim Product Form</th>
				</tr>
			</thead>
			<tbody>
				
				<tr>
					<td><label>Product Name</label></td>
					<td><select name="pname">
							<c:forEach var="row" items="${result.rows}">
								<option value="<c:out value='${row.id}'/>"><c:out
										value="${row.product_name}" /></option>
							</c:forEach>

					</select></td>
				</tr>
				<tr>
					<td><label>Serial No</label></td>
					<td><input type="text" name="serial" /></td>
				</tr>
				<tr>
					<td><label>Date of claim</label></td>
					<td><input type="text" name="pdate" id="datepicker"></td>
				</tr>
				<tr>
					<td><label>Description</label></td>
					<td><textarea rows="5" cols="" name="claim_details"></textarea></td>
				</tr>



				<tr>
					<td><input type="submit" value="Register" /></td>
					<td><input type="reset" value="reset" /></td>
				</tr>
			</tbody>
		</table>
	</form>
	<font color="red"><c:if test="${not empty param.errMsg}">
			<c:out value="${param.errMsg}" />
		
		</c:if></font>
	<font color="green"><c:if test="${not empty param.susMsg}">
			<c:out value="${param.susMsg}" />
			
		</c:if></font>
	<script>
		$(function() {
			$("#datepicker").datepicker({
				dateFormat: 'yy-mm-dd'
			});
		});
	</script>
</body>
</html>