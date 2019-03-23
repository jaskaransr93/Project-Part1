<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v3.8.5">
<title>User Login</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.3/examples/sign-in/">

<!-- Bootstrap core CSS -->
<link
	href="https://getbootstrap.com/docs/4.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">


<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
<!-- Custom styles for this template -->
<link
	href="https://getbootstrap.com/docs/4.3/examples/sign-in/signin.css"
	rel="stylesheet">
</head>
<body class="text-center">

	<form class="form-signin" action="insertRegisterUser.jsp" method="post">

		<!-- <img class="mb-4" src="/docs/4.3/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72"> -->
		<h1 class="h3 mb-3 font-weight-normal">Register Form</h1>
		<c:if test="${not empty param.succMsg}">
			<div class="alert alert-success" role="alert">
				<c:out value="${param.succMsg}" />
			</div>
		</c:if>
		<c:if test="${not empty param.errMsg}">
			<div class="alert alert-danger" role="alert">
				<c:out value="${param.errMsg}" />
			</div>
		</c:if>


		
			 <input type="text" class="form-control mb-2"
			placeholder="Username" name="username" required>
			
			<input
			type="password" class="form-control"
			placeholder="Password" name="upassword" required>
			
			 <input
			class="form-control mb-2" type="number" name="cell" placeholder="Cell No" />
			
			 <input type="text"
			name="uname" class="form-control mb-2"
			placeholder="Full Name"  /> 
			
			<input
			type="email" id="inputEmail" class="form-control mb-2"
			placeholder="Email" name="email" required>
			
			<input type="text" name="address" placeholder="Address" class="form-control mb-2" />
		<button class="btn btn-lg btn-primary btn-block" type="submit">Register</button>
		<a href="userLoginForm.jsp">Already a user Click here to Log in</a>
		<p class="mt-5 mb-3 text-muted">&copy; 2019</p>
	</form>
</body>
</html>



<%-- <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="insertRegisterUser.jsp" method="post">
            <table border="0" cellspacing="2" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Register Form</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><label>User Name</label></td>
                        <td><input type="text" name="username"/></td>
                    </tr>
                    <tr>
                        <td><label>Password</label></td>
                        <td><input type="password" name="upassword"/></td>
                    </tr>
                    <tr>
                        <td><label>Cell No</label></td>
                        <td><input type="text" name="cell"/></td>
                    </tr>
                    <tr>
                        <td><label>Name</label></td>
                        <td><input type="text" name="uname"/></td>
                    </tr>
                    <tr>
                        <td><label>Email</label></td>
                        <td><input type="text" name="email"/></td>
                    </tr>
                    <tr>
                        <td><label>Address</label></td>
                        <td><input type="text" name="address"/></td>
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
            
        </c:if></font>
        <font color="green"><c:if test="${not empty param.susMsg}">
            <c:out value="${param.susMsg}" />
            
        </c:if></font>
 
    </body>
</html> --%>