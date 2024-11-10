<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.util.List"%>
<%@ page import="com.repo.JobDAO"%>
<%@ page import="com.model.Jobs"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin View Job</title>
<%@ include file="all_component/allCss.jsp"%>
<style>
.custom-container {
	max-width: 700px;
	margin: 20px auto;
	background-color: #ffffff;
	border-radius: 8px;
	padding: 20px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.custom-header {
	font-size: 1.2rem;
	font-weight: 600;
	color: #007bff;
	margin-bottom: 10px;
}

.btn-custom {
	padding: 6px 20px;
	border-radius: 20px;
	font-size: 0.9rem;
}

.form-control[readonly] {
	background-color: #e9ecef;
	border: none;
}

.card-body {
	padding: 15px;
}

.card {
	margin-bottom: 20px;
}
</style>
</head>
<body style="background-color: #f0f1f2;">
	<c:if test="${userobj.role ne 'admin'}">
    <c:redirect url="login.jsp"/>
</c:if>
	
	<%@ include file="all_component/navbar.jsp"%>
	<div class="container">
		<h5 class="text-center text-primary">All Jobs</h5>
		<c:if test="${not empty succMsg}">
			<div class="alert alert-success" role="alert">${succMsg}</div>
			<c:remove var="succMsg" scope="session" />
		</c:if>
		<c:if test="${not empty errorMsg}">
			<div class="alert alert-danger" role="alert">${errorMsg}</div>
			<c:remove var="errorMsg" scope="session" />
		</c:if>
		<%
		JobDAO dao = new JobDAO(DBConnect.getConn());
		List<Jobs> list = dao.getAllJobs();
		if (list.isEmpty()) {
		%>
		<div class="alert alert-info text-center">No jobs available.</div>
		<%
		} else {
		for (Jobs j : list) {
		%>
		<div class="custom-container">
			<div class="card">
				<div class="card-body">
					<div class="text-center text-primary">
						<i class="far fa-clipboard fa-2x"></i>
					</div>
					<h6 class="text-center"><%=j.getTitle()%></h6>
					<h6>Responsibilities and Requirements :</h6>
					<p><%=j.getDescription()%></p>
					<br>
					<div class="form-row">
						<div class="form-group col-md-4">
							<input type="text" class="form-control form-control-sm"
								value="Location: <%=j.getLocation()%>" readonly>
						</div>
						<div class="form-group col-md-4">
							<input type="text" class="form-control form-control-sm"
								value="Category: <%=j.getCategory()%>" readonly>
						</div>
						<div class="form-group col-md-4">
							<input type="text" class="form-control form-control-sm"
								value="Status: <%=j.getStatus()%>" readonly>
						</div>
					</div>
				</div>
				<div class="card-footer">
					<h6 class="pl-3">
						Publish Date:
						<%=j.getPdate()%></h6>
					<div class="text-center">
						<a href="edit.jsp?id=<%=j.getId()%>"
							class="btn btn-sm bg-success text-white btn-custom">Edit</a> <a
							href="delete?id=<%=j.getId()%>"
							class="btn btn-sm bg-danger text-white btn-custom">Delete</a>
					</div>
				</div>
			</div>
		</div>
		<%
		}
		}
		%>
	</div>
</body>
</html>
