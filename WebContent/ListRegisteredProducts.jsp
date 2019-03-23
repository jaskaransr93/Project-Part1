<%@include file="./shared/header.jsp"%>
<%@include file="./shared/sidebar.jsp"%>
<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/project_part1"
	user="${DbConfig.username}" password="${DbConfig.password}" />
<div id="page-wrapper">
	<div class="container-fluid">
		<!-- Page Heading -->
		<div class="row" id="main">
			<div class="col-sm-12 col-md-12 well" id="content">

				<form style="display: inline-block">
					<input type="text" name="search" /> <input type="submit"
						value="Search" />
				</form>
				<form style="display: inline-block">
					<input type="hidden" name="search" value="" /> <input
						type="submit" value="Clear" />
				</form>

				<c:choose>
					<c:when test="${empty param.search}">
						<sql:query dataSource="${dbsource}" var="result">
            		SELECT registered_product.*,product.product_name from registered_product JOIN product ON registered_product.pid=product.id where registered_product.username='${sessionScope['loginUser']}';
        		</sql:query>
					</c:when>
					<c:otherwise>
						<sql:query dataSource="${dbsource}" var="result">
            		SELECT * from registered_product JOIN product ON registered_product.pid=product.id
            		WHERE pid LIKE '%${param.search}%' and username=${sessionScope['loginUser']};
        		</sql:query>
					</c:otherwise>
				</c:choose>
				<h1>My Registered Products</h1>
				<c:set var="count" value="0" scope="page" />

				<c:if test="${not empty param.susMsg}">
					<div class="alert alert-success" role="alert">
						<c:out value="${param.susMsg}" />
					</div>
				</c:if>
				<table class="table table-striped table-bordered">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th>Product Name</th>
							<th>Serial No</th>
							<th>Purchase Date</th>
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
									<td><c:out value="${row.serialno}" /></td>
									<td><c:out value="${row.purchase_date}" /></td>
									<td><a
										href="claimForm.jsp?pid=<c:out value="${row.pid}"/>&serial_no=<c:out value="${row.serialno}"/>"><button
												type="button" class="btn btn-primary">Add Claim</button></a></td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${result.rowCount==0}">
							<tr class="text-center">
								<td colspan="5"><span style="color: red">No products
										found!</span> <a href="registerProductForm.jsp">Register new</a></td>
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