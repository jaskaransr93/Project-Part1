<%@include file="./shared/adminHeader.jsp"%>
<%@include file="./shared/adminSidebar.jsp"%>
<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/project_part1"
	user="${DbConfig.username}" password="${DbConfig.password}" />
<div id="page-wrapper">
	<div class="container-fluid">
		<!-- Page Heading -->
		<div class="row" id="main">
			<div class="col-sm-12 col-md-12 well" id="content">

				<form style="display: inline-block; style: 500px">
					<input type="text" name="search" class="form-control" />
					<button class="btn btn-primary" type="submit" value="Search">Search</button>
				</form>
				<form style="display: inline-block">
					<input type="hidden" name="search" value="" /> 
					<button class="btn btn-warning" type="submit" value="Clear">List All</button>
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
				<h1>Products</h1>
				<c:set var="count" value="0" scope="page" />

				<c:if test="${not empty param.susMsg}">
					<div class="alert alert-success" role="alert">
						<c:out value="${param.susMsg}" />
					</div>
				</c:if>
				<c:if test="${not empty param.errMsg}">
					<div class="alert alert-danger" role="alert">
						<c:out value="${param.errMsg}" />
					</div>
				</c:if>
				<table class="table table-striped table-bordered">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th>Product Name</th>
							<th>Color</th>
							<th colspan="2">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${result.rowCount>0}">
							<c:forEach var="row" items="${result.rows}">
							
								<c:set var="count" value="${count + 1}" scope="page" />
								<tr>
									<th scope="row"><c:out value="${count}" /></th>
									<td><c:out value="${row.product_name}" /></td>
									<td><c:out value="${row.color}" /></td>												
									<td>
										<a href="updateProduct.jsp?pid=<c:out value="${row.pid}"/>">
										<button
												type="button" class="btn btn-primary">
												Update
										</button>
										</a>
									</td>
									<td>
										<a href="javascript:confirmGo('Sure to delete this record?','deleteProductdb.jsp?pid=<c:out value="${row.pid}"/>')">
										<button
												type="button" class="btn btn-primary">
												Delete
												</button>
										</a>
									</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${result.rowCount==0}">
							<tr class="text-center">
								<td colspan="5"><span style="color: red">No products
										found!</span> <a href="insertProduct.jsp">Insert New Product</a></td>
							</tr>
						</c:if>

					</tbody>
				</table>
			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container-fluid -->
</div>
<!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->


<%@include file="./shared/footer.jsp"%>
<%-- <%@ page import="java.io.*,java.util.*,java.sql.*, Configs.*"%>
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
 --%>
