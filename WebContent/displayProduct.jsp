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
										<a class="btn btn-success" href="updateProduct.jsp?id=<c:out value="${row.id}"/>">Update</a>
									</td>
									<td>
										<a class="btn btn-danger" href="javascript:confirmGo('Sure to delete this record?','deleteProductdb.jsp?id=<c:out value="${row.id}"/>')">Delete
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

