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
				<h1>Add new claim</h1>
				<c:if test="${not empty param.errMsg}">
					<div class="alert alert-danger" role="alert">
						<c:out value="${param.errMsg}" />
					</div>
				</c:if>
				<form action="insertClaimForm.jsp" method="post">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label" for="username">Serial No</label> <input
									type="text" class="form-control" disabled value="${param.serial_no}" />
									 <input
									type="hidden" name="serial" value="${param.serial_no}" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>Product Name</label> <select  disabled
									class="form-control">
									<c:forEach var="row" items="${result.rows}">
										<option  ${param.pid == row.id ? 'selected' : ''} value="<c:out value='${row.id}'/>"><c:out
												value="${row.product_name}" /></option>
									</c:forEach>
								</select>
							</div>
						</div>
						<input type="hidden" name="pid" value="${param.pid}" />
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>Date of claim</label> <input type="text"
									class="form-control" name="pdate" id="datepicker" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>Description</label>
								<textarea rows="5" class="form-control" cols=""
									name="claim_details"></textarea>
							</div>
						</div>
					</div>

					<input class="btn btn-success" type="submit" value="Submit" /> <input
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
