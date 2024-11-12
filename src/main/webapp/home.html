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
<title>User: View Jobs</title>
<%@ include file="all_component/allCss.jsp"%>
<style>
body {
	background-color: #f0f1f2;
}

.custom-container {
	max-width: 700px;
	margin: 15px auto;
	background-color: #ffffff;
	border-radius: 8px;
	padding: 20px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.header-text {
	font-size: 1.5rem;
	font-weight: bold;
	color: #343a40;
	text-align: center;
	margin-bottom: 20px;
}

.form-group label {
	font-weight: 600;
}

.btn-custom {
	padding: 8px 25px;
	border-radius: 25px;
	font-size: 0.95rem;
	background-color: #28a745;
	color: #ffffff;
}

.card {
	border: none;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	margin-bottom: 20px;
}

.card-body {
	padding: 20px;
}

.job-title {
	font-size: 1.2rem;
	font-weight: bold;
	color: #007bff;
	text-align: center;
}

.job-description {
	font-size: 0.95rem;
	color: #6c757d;
}

.job-info {
	font-size: 0.9rem;
	color: #495057;
}

.view-more {
	background-color: #28a745;
	color: #ffffff;
	border-radius: 25px;
	padding: 5px 20px;
}

.job-post-container {
	margin-top: 20px;
}
</style>
</head>
<body>
	<%@ include file="all_component/navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>
	<c:if test="${not empty succMsg }">
		<h4 class="text-center text-success">${succMsg}</h4>
		<c:remove var="succMsg" />
	</c:if>
	<c:if test="${not empty msg }">
		<h4 class="text-center text-success">${msg}</h4>
		<c:remove var="msg" />
	</c:if>
	<div class="container">
		<div class="custom-container">
			<h5 class="header-text">Filter Jobs</h5>
			<div class="card">
				<div class="card-body">
					<form class="form-inline" action="more_view.jsp" method="get">
						<div class="form-group col-md-5 mt-1">
							<label for="locationSelect">Location</label> <select name="lo"
								class="custom-select" id="locationSelect">
								<option value="" selected disabled>Choose..</option>
								<option value="Odisha">Odisha</option>
								<option value="Pune">Pune</option>
								<option value="Mumbai">Mumbai</option>
								<option value="Delhi">Delhi</option>
								<option value="Bangalore">Bangalore</option>
								<option value="Hyderabad">Hyderabad</option>
								<option value="Chennai">Chennai</option>
								<option value="Ahmedabad">Ahmedabad</option>
							</select>
						</div>

						<div class="form-group col-md-4">
							<label for="categorySelect">Category</label> <select name="ca"
								class="custom-select" id="categorySelect">
								<option value="" selected disabled>Choose..</option>
								<option value="IT">IT</option>
								<option value="Developer">Developer</option>
								<option value="Banking">Banking</option>
								<option value="Engineering">Engineering</option>
								<option value="Trainer">Trainer</option>
							</select>
						</div>

						<div class="text-center mt-4">
							<button type="submit" class="btn btn-custom">Search Jobs</button>
						</div>
					</form>
				</div>
			</div>
		</div>

		<h5 class="header-text">All Jobs</h5>

		<%
		JobDAO dao = new JobDAO(DBConnect.getConn());
		List<Jobs> list = dao.getAllJobsForUser();
		if (list != null && !list.isEmpty()) {
			for (Jobs j : list) {
		%>
		<div class="job-post-container">
			<div class="custom-container">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<i class="far fa-clipboard fa-2x text-primary"></i>
						</div>
						<h6 class="job-title"><%=j.getTitle()%></h6>
						<p class="job-description">
							<%=j.getDescription().length() > 120 ? j.getDescription().substring(0, 120) + "..." : j.getDescription()%>
						</p>

						<div class="form-row mb-3">
							<div class="form-group col-md-6">
								<span class="job-info">Location: <%=j.getLocation()%></span>
							</div>
							<div class="form-group col-md-6">
								<span class="job-info">Category: <%=j.getCategory()%></span>
							</div>
						</div>

						<h6 class="text-muted">
							Published on:
							<%=j.getPdate().toString()%>
						</h6>
						<div class="text-center mt-3">
							<div class="d-flex justify-content-around">
								<!-- Apply Job Button -->
								<form action="apply_job.jsp" method="post">
									<input type="hidden" name="jobId" value="<%=j.getId()%>">
									<button type="submit" class="btn view-more btn-warning">Apply
										Job</button>
								</form>
								<!-- View More Button -->
								<a href="one_view.jsp?id=<%=j.getId()%>" class="btn view-more">View
									More</a>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
		<%
		}
		} else {
		%>
		<p class="text-center w-100 mt-3">No jobs available at the moment.</p>
		<%
		}
		%>
	</div>
</body>
</html>
