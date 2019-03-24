<%-- <%@include file="./shared/header.jsp"%>
<%@include file="./shared/sidebar.jsp"%> --%>
<%-- <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Product</title>
    </head>
    <body>
        <form action="insertProductdb.jsp" method="post">
            <table>
                <thead>
                    <tr>
                        <th colspan="2">Purchase Product</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><label>Product Name</label></td>
                        <td><input type="text" name="product_name"/></td>
                    </tr>
                    <tr>
                        <td><label>Color</label></td>
                        <td><input type="text" name="color"/></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Save" /></td>
                        <td><input type="reset" value="reset"/></td>
                    </tr>		
                </tbody>
            </table>
        </form>
        <font color="red"><c:if test="${not empty param.errMsg}">
            <c:out value="${param.errMsg}" />
            <a href="index.jsp">Go Back</a>
        </c:if></font>
        <font color="green"><c:if test="${not empty param.susMsg}">
            <c:out value="${param.susMsg}" />
            <a href="index.jsp">Go Back</a>
        </c:if></font>
 
    </body>
</html> --%>
<%@include file="./shared/header.jsp"%>
<%@include file="./shared/adminSidebar.jsp"%>
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
				<c:if test="${not empty param.susMsg}">
					<div class="alert alert-success" role="alert">
		            	<c:out value="${param.susMsg}" />
		            </div>
        		</c:if>
				<form action="insertProductdb.jsp" method="post">

					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>Product Name</label> 
								<input type="text"
									class="form-control" name="product_name" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label">Color</label> 
								<input type="text" class="form-control" name="color" />
							</div>
						</div>
					</div>

					<input class="btn btn-success" type="submit" value="Register" /> 
					<input class="btn btn-primary" type="reset" value="reset" />
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