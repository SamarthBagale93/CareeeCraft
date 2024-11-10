<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.util.List"%>
<%@ page import="com.repo.JobDAO"%>
<%@ page import="com.model.Jobs"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Jobs</title>
<%@ include file="all_component/allCss.jsp"%>
</head>
<body>
	<c:if test="${userobj.role ne 'admin'}">
		<c:redirect url="login.jsp" />
	</c:if>

	<%@ include file="all_component/navbar.jsp"%>
	<div class="container p-2">
		<div class="col-md-10 offset-md-1">
			<div class="card">
				<div class="card-body">
					<div class="text-center text-success">
						<i class="fas fa-user-friends fa-3x"></i>
						<%
						int id = Integer.parseInt(request.getParameter("id"));
						JobDAO dao = new JobDAO(DBConnect.getConn());
						Jobs j = dao.getJobById(id);
						%>
						<h5>Edit Jobs</h5>
					</div>
					<form action="update" method="post">
						<input type="hidden" name="id" value="<%=j.getId()%>">
						<div class="form-group">
							<label>Enter Title</label> <input type="text" name="title"
								required class="form-control" value="<%=j.getTitle()%>"
								autocomplete="off">
						</div>

						<!-- Row for Location, Category, and Status -->
						<div class="form-row">
							<!-- Location Field -->
							<div class="form-group col-md-4">
								<label>Location</label> <select name="location"
									class="custom-select" required>
									<option value="<%=j.getLocation()%>" selected><%=j.getLocation()%></option>
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

							<!-- Category Field -->
							<div class="form-group col-md-4">
								<label>Category</label> <select name="category"
									class="custom-select" required>
									<option value="<%=j.getCategory()%>" selected><%=j.getCategory()%></option>
									<option value="IT">IT</option>
									<option value="Developer">Developer</option>
									<option value="Banking">Banking</option>
									<option value="Engineering">Engineering</option>
									<option value="Trainer">Trainer</option>
								</select>
							</div>

							<!-- Status Field -->
							<div class="form-group col-md-4">
								<label>Status</label> <select name="status"
									class="custom-select" required>
									<option value="<%=j.getStatus()%>" selected><%=j.getStatus()%></option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label>Enter Description</label>
							<textarea required rows="6" name="desc" class="form-control"
								autocomplete="off"><%=j.getDescription()%></textarea>
						</div>

						<div class="text-center">
							<button type="submit" class="btn btn-success">Update Job</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
