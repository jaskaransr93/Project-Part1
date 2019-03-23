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
            		SELECT * from registered_product;
        		</sql:query>
					</c:when>
					<c:otherwise>
						<sql:query dataSource="${dbsource}" var="result">
            		SELECT * from registered_product
            		WHERE pid LIKE '%${param.search}%'  
        		</sql:query>
					</c:otherwise>
				</c:choose>
				<h1>My Claims</h1>
				   <c:set var="count" value="0" scope="page" />

				
				<table class="table table-striped table-bordered">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th>Product Name</th>
							<th>Serial No</th>
							<th>Date of claim</th>
							<th>Details</th>
							<th colspan="2">Status</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="row" items="${result.rows}">
						<c:set var="count" value="${count + 1}" scope="page"/>
							<tr>
								<th scope="row"> <c:out value = "${count}"/></th>
								<td><c:out value="${row.pid}" /></td>
								<td><c:out value="${row.serialno}" /></td>
								<td><c:out value="${row.purchase_date}" /></td>
								<td><a href="claimForm.jsp?pid=<c:out value="${row.pid}"/>"><button type="button" class="btn btn-primary">Add Claim</button></a></td>
							</tr>
						</c:forEach>
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