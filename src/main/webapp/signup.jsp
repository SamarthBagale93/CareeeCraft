<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup Page</title>
<%@ include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">

	<%@include file="all_component/navbar.jsp"%>

	<div class="container-fluid">
		<div class="row p-4">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
							<h5>Registration</h5>
						</div>

						<!-- Success message -->
						<c:if test="${not empty succMsg }">
							<h4 class="text-center text-success">${succMsg}</h4>
							<c:remove var="succMsg" />
						</c:if>

						

						<!-- Signup form -->
						<form action="add_user" method="post">
							<div class="form-group">
								<label for="fullName">Enter Full Name</label> <input type="text"
									required="required" class="form-control" id="fullName"
									name="name">
							</div>
							<div class="form-group">
								<label for="qualification">Enter Qualification</label> <input
									type="text" required="required" class="form-control"
									id="qualification" name="qua">
							</div>
							<div class="form-group">
								<label for="email">Enter Email</label> <input type="email"
									required="required" class="form-control" id="email"
									name="email">
							</div>
							<div class="form-group">
								<label for="password">Enter Password</label> <input
									type="password" required="required" class="form-control"
									id="password" name="ps">
							</div>
							<button type="submit" class="btn btn-primary btn-block">Register</button>
						</form>

						<!-- Already have an account link -->
						<div class="text-center mt-3">
							<a href="login.jsp">Already have an account? Login here</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="all_component/footer.jsp"%>

</body>
</html>
