<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.util.List"%>
<%@ page import="com.repo.JobDAO"%>
<%@ page import="com.model.Jobs"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Apply for Job</title>
<%@ include file="all_component/allCss.jsp"%>
</head>
<body>
	<%
	// Get the job ID from the request parameter
	int id = Integer.parseInt(request.getParameter("jobId"));
	JobDAO dao = new JobDAO(DBConnect.getConn());
	Jobs job = dao.getJobById(id);

	// Check if the job object is not null
	if (job != null) {
	%>
	<div class="container p-4">
		<div class="col-md-6 offset-md-3">
			<div class="card">
				<div class="card-body">
					<h4 class="text-center text-primary">Apply for Job</h4>

					<form action="applyJobServlet" method="post"
						enctype="multipart/form-data">
						<input type="hidden" name="jobId" value="<%=job.getId()%>">
						<div class="form-group">
							<label for="jobTitle">Job Title</label> <input type="text"
								class="form-control" id="jobTitle" name="jobTitle"
								value="<%=job.getTitle()%>" readonly>
						</div>
						<div class="form-group">
							<label for="jobTitle">Job Location</label> <input type="text"
								class="form-control" id="location" name="location"
								value="<%=job.getLocation()%>" readonly>
						</div>
						<div class="form-group">
							<label for="fullName">Full Name</label> <input type="text"
								class="form-control" id="fullName" name="fullName" required>
						</div>

						<div class="form-group">
							<label for="email">Email</label> <input type="email"
								class="form-control" id="email" name="email" required>
						</div>

						<div class="form-group">
							<label for="phone">Phone Number</label> <input type="tel"
								class="form-control" id="phone" name="phone" required>
						</div>

						<div class="form-group">
							<label for="resume">Upload Resume</label> <input type="file"
								class="form-control" id="resume" name="resume" required>
						</div>

						<button type="submit" class="btn btn-primary btn-block">Submit
							Application</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%
	} else {
	%>
	<div class="container p-4">
		<div class="alert alert-danger text-center">
			<strong>Job not found!</strong>
		</div>
	</div>
	<%
	}
	%>
</body>
</html>
