<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.util.List"%>
<%@ page import="com.repo.JobDAO"%>
<%@ page import="com.model.Jobs"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User: View Jobs</title>

<%@ include file="all_component/allCss.jsp"%>
</head>
<body>

	<%@ include file="all_component/navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>
	<div class="container p-2">
		<div class="col-md-12">
			<div class="card">
				<div class="card-body">
					<h5 class="text-center text-primary">All Jobs</h5>

					<%
					String loc = request.getParameter("lo");
					String cat = request.getParameter("ca");
					String msg = "";
					JobDAO dao = new JobDAO(DBConnect.getConn());
					List<Jobs> list = null;

					// Check if both loc and cat are empty/null
					if ((loc == null || loc.isEmpty()) && (cat == null || cat.isEmpty())) {
						msg = "Please provide either location or category.";
						list = new ArrayList<>(); // Initialize an empty list to avoid null issues
					}
					// Check if either loc or cat is provided for the "OR" condition
					else if ((loc != null && !loc.isEmpty()) || (cat != null && !cat.isEmpty())) {
						list = dao.getJobsORLocationAndCate(cat, loc);
					}
					// Both loc and cat are provided for the "AND" condition
					else {
						list = dao.getJobsAndLocationAndCate(cat, loc);
					}

					if (list.isEmpty()) {
					%>
					<h4 class="text-center text-danger">Job Not Available</h4>
					<%
					} else {
					for (Jobs j : list) {
					%>
					<div class="card custom-container">
						<div class="card-body">
							<div class="text-center">
								<i class="far fa-clipboard icon-style"></i>
							</div>
							<h4 class="custom-header"><%=j.getTitle()%></h4>
							<p class="text-muted text-center"><%=j.getDescription()%></p>
							<hr>
							<div class="form-row">
								<div
									style="display: flex; justify-content: space-between; align-items: center;">
									<div style="margin-right: 150px;">
										<strong>Location:</strong> <span><%=j.getLocation()%></span>
									</div>
									<div>
										<strong>Category:</strong> <span><%=j.getCategory()%></span>
									</div>
								</div>
							</div>

						</div>
						<h6>
							Published Date:
							<%=j.getPdate().toString()%></h6>
						<div class="text-center">
							<a href="one_view.jsp?id=<%=j.getId()%>"
								class="btn btn-sm bg-success text-white">View Details</a>
						</div>
					</div>
				</div>
				<%
				}
				}
				%>
			</div>
		</div>
	</div>
	</div>
</body>
</html>
