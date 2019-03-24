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
					<div class="row">
						<div class="col-md-6">
							<div class="input-group">
								<input type="search" name="search" placeholder="e-g Iphone X"
									class="form-control"> <span class="input-group-btn">
									<button class="btn btn-primary" type="submit">
										<span class="glyphicon glyphicon-search" aria-hidden="true">
										</span> Search!
									</button>
								</span>
							</div>
						</div>
					
				</form>
				<form>
					
						<div class="col-md-6">
							<div class="input-group">
								<input type="hidden" name="search" value=""
									class="form-control"> <span class="input-group-btn">
									<button class="btn btn-warning" type="submit">
										<span class="glyphicon glyphicon-list" aria-hidden="true">
										</span> List All
									</button>
								</span>
							</div>
						</div>
					</div>
				</form>

				<c:choose>
					<c:when test="${empty param.search}">
						<sql:query dataSource="${dbsource}" var="result">
            		SELECT registered_product.*,product.product_name from registered_product JOIN product ON registered_product.pid=product.id where registered_product.username='${sessionScope['loginUser']}';
        		</sql:query>
					</c:when>
					<c:otherwise>
						<sql:query dataSource="${dbsource}" var="result">
            		SELECT registered_product.*,product.product_name from registered_product JOIN product ON registered_product.pid=product.id WHERE product.product_name LIKE '%${param.search}%' and registered_product.username='${sessionScope['loginUser']}';
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