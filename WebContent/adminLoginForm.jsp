<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Login</title>
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

<link
	href="https://getbootstrap.com/docs/4.3/examples/sign-in/signin.css"
	rel="stylesheet">
</head>
<body>
	<form class="form-signin" action="doAdminLogin.jsp" method="post">
		<h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
		<c:if test="${not empty param.errMsg}">
			<div class="alert alert-danger" role="alert">
				<c:out value="${param.errMsg}" />
			</div>
		</c:if>
		<label for="inputUsername" class="sr-only">User Name</label> 
		<input
			type="username" id="inputUsername" class="form-control"
			placeholder="Username" name="username" required autofocus> 
			<label
			for="inputPassword" class="sr-only">Password</label> 
			<input
			type="password" id="inputPassword" class="form-control"
			placeholder="Password" name="upassword" required>

		<button class="btn btn-lg btn-primary btn-block" type="submit"
			value="submit">Sign in</button>
		<p class="mt-5 mb-3 text-muted">&copy; 2019</p>
	</form>


</body>
</html>