<%@include file="./shared/header.jsp"%>
<%@include file="./shared/sidebar.jsp"%>
<div id="page-wrapper">
	<div class="container-fluid">
		<!-- Page Heading -->
		<div class="row" id="main">
			<div class="col-sm-12 col-md-12 well" id="content">
				<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
					url="jdbc:mysql://localhost:3306/project_part1"
					user="${DbConfig.username}" password="${DbConfig.password}" />
				<sql:query dataSource="${dbsource}" var="result">
            SELECT * from product;
        </sql:query>
				<h1>Register a new Product</h1>
				<c:if test="${not empty param.errMsg}">
					<div class="alert alert-danger" role="alert">
						<c:out value="${param.errMsg}" />
					</div>
				</c:if>
				<form action="insertRegisterProduct.jsp" method="post">
					
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>Product Name</label> <select name="p_id"
									class="form-control">
									<c:forEach var="row" items="${result.rows}">
										<option value="<c:out value='${row.id}'/>"><c:out
												value="${row.product_name}" /></option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>Purchase Date</label> <input type="text"
									class="form-control" name="pdate" id="datepicker" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label" for="username">Serial No</label> <input
									type="text" class="form-control" name="serial" />
									
							</div>
						</div>
					</div>

					<input class="btn btn-success" type="submit" value="Register" /> <input
						class="btn btn-primary" type="reset" value="reset" />
				</form>
			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container-fluid -->
</div>
<!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->
<script>
	$(function() {
		$("#datepicker").datepicker({
			dateFormat : 'yy-mm-dd'
		});
	});
</script>
<%@include file="./shared/footer.jsp"%>