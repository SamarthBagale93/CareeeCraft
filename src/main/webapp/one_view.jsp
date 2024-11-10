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
<title>User: Single Job Details</title>
<%@ include file="all_component/allCss.jsp"%>
<style>
.custom-container {
	max-width: 800px;
	margin: 30px auto;
	background-color: #ffffff;
	border-radius: 10px;
	padding: 25px;
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
	font-family: 'Arial', sans-serif;
}

.custom-header {
	font-size: 1.5rem;
	font-weight: bold;
	color: #007bff;
	margin-bottom: 15px;
	text-align: center;
}

.btn-custom {
	padding: 10px 25px;
	border-radius: 25px;
	font-size: 1rem;
}

.form-control[readonly] {
	background-color: #f8f9fa;
	border: none;
	font-weight: 500;
}

.card-body {
	padding: 20px;
}

.card {
	margin-bottom: 25px;
	border: none;
	border-radius: 8px;
}

.card-footer {
	background-color: #f1f1f1;
	border-top: none;
	border-radius: 0 0 8px 8px;
	padding: 7px;
	text-align: right;
}

.text-primary {
	color: #007bff !important;
}

.icon-style {
	font-size: 2.5rem;
	color: #6c757d;
}

.form-row .form-group {
	margin-bottom: 1.5rem;
}

.job-details-container {
	margin-top: 40px;
}

.alert {
	text-align: center;
}
</style>
</head>
<body style="background-color: #f0f1f2;">

	<%@ include file="all_component/navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>
	<div class="container job-details-container">
		<div class="row justify-content-center">
			<div class="col-md-12">
				<%
				int id = Integer.parseInt(request.getParameter("id"));
				JobDAO dao = new JobDAO(DBConnect.getConn());
				Jobs job = dao.getJobById(id);

				if (job != null) {
				%>
				<div class="card custom-container">
					<div class="card-body">
						<div class="text-center">
							<i class="far fa-clipboard icon-style"></i>
						</div>
						<h4 class="custom-header text-center"><%=job.getTitle()%></h4>
						<h6>Responsibilities and Requirements :</h6>
						<p ><%=job.getDescription()%></p>
						<hr>
						<div class="form-row">
							<div style="display: flex; justify-content: space-between; align-items: center;">
								<div style="margin-right: 150px;">
									<strong>Location:</strong> <span><%=job.getLocation()%></span>
								</div>
								<div>
									<strong>Category:</strong> <span><%=job.getCategory()%></span>
								</div>
							</div>
						</div>
					</div>
					<div class="text-center">
							<div class="d-flex justify-content-around">
								<!-- Apply Job Button -->
								<form action="apply_job.jsp" method="post">
									<input type="hidden" name="jobId" value="<%=job.getId()%>">
									<button type="submit" class="btn view-more btn-warning">Apply
										Job</button>
								</form>
							</div>
						</div>
					<div class="card-footer text-center mt-2">
						<small class="text-muted">Published on: <%=job.getPdate()%></small>
					</div>
				</div>
				<%
				} else {
				%>
				<div class="alert alert-danger mt-5" role="alert">
					<strong>Oops!</strong> The job you're looking for does not exist or
					has been removed.
				</div>
				<%
				}
				%>
			</div>
		</div>
	</div>
</body>
</html>
