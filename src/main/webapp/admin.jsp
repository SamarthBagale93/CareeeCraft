<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<%@ include file="all_component/allCss.jsp"%>
<style>
.back-img {
	background: url("img/th.jpg");
	height: 85vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
<body>
	<c:if test="${userobj.role ne 'admin'}">
		<c:redirect url="login.jsp" />
	</c:if>

	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid back-img ">

		<h1 class="text-center" style="color: white">Welcome Admin</h1>

	</div>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>