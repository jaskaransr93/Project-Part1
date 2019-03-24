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
				<h1>Users</h1>
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
		                    <th>Username</th>
		                    <th>Cell no.</th>
		                    <th>Email</th>
		                    <th>Name</th>
		                    <th>Address</th>
		                  	<th>Details</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${result.rowCount>0}">
							<c:forEach var="row" items="${result.rows}">
							
								<c:set var="count" value="${count + 1}" scope="page" />
								<tr>
									<th scope="row"><c:out value="${count}" /></th>
									<td><c:out value="${row.username}" /></td>
									<td><c:out value="${row.cellno}" /></td>		
									<td><c:out value="${row.email}" /></td>		
									<td><c:out value="${row.uname}" /></td>	
									<td><c:out value="${row.address}" /></td>	
									<td><a class="btn btn-light"
								href="displayUserDetails.jsp?username=<c:out value="${row.username}"/>&claim_status=1">Details</a></td>																																																																																																																																																																				
								</tr>
							</c:forEach>
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