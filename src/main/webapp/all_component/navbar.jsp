<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<head>
<style>
/* Custom background color for navbar */
.bg-custom {
	background-color: #283593 !important;
}

/* Navbar link styling */
.navbar .nav-link {
	font-size: 18px;
	color: #f8f9fa !important;
	padding: 8px 16px !important;
	transition: color 0.3s, background-color 0.3s;
}

/* Hover effect on navbar links */
.navbar .nav-link:hover, .navbar .nav-link:focus {
	color: #ffeb3b !important;
	text-decoration: underline;
}

/* Navbar Toggler */
.navbar-toggler {
	border: none;
}

/* Modal styling */
.modal-content {
	border-radius: 10px;
}

.modal-header {
	background-color: #283593;
	color: #f8f9fa;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
}

/* Profile icon and table styling */
.modal-body .fa-user-circle {
	color: #283593;
	margin-bottom: 15px;
}

/* Profile table styling */
.profile-table th {
	font-weight: 600;
	color: #283593;
}

.profile-table td {
	color: #555;
}

/* Custom modal animation for sliding in from the right */
.modal.slide-in-right {
	transform: translateX(100%);
	transition: transform 0.5s ease-in-out;
}

.modal.show.slide-in-right {
	transform: translateX(0);
}
</style>
</head>

<nav class="navbar navbar-expand-lg navbar-light bg-custom">
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item"><a class="nav-link" href="index.jsp">Home
					<span class="sr-only">(current)</span>
			</a></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

			<c:if test="${not empty userobj and userobj.role eq 'admin'}">
				<li class="nav-item"><a class="nav-link" href="add_job.jsp"><i
						class="fa fa-plus-circle"></i> Post Job</a></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <li class="nav-item"><a class="nav-link"
					href="views_jobs.jsp"><i class="fas fa-eye"></i> View Job</a></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <li class="nav-item"><a class="nav-link"
					href="viewsubmissions.jsp"><i class="fas fa-clipboard-list"></i>
						View Submission</a></li>
			</c:if>

			<c:if test="${not empty userobj and userobj.role eq 'user'}">
				<li class="nav-item"><a class="nav-link" href="upload.jsp"><img
						src="mali/analyzer.jpg"
						style="height: 30px; width: 30px; border-radius: 50%;">
						Resume Analyzer</a></li>&nbsp;&nbsp;
				<li class="nav-item"><a
					class="nav-link" href="mali/resmuesample.html"><i
						class="fas fa-eye"></i> Best Resume Sample</a></li>&nbsp;&nbsp;
				<li class="nav-item"><a class="nav-link"
					href="mali/alumini.html"><i class="fas fa-handshake"></i>
						Alumni Connect</a></li>&nbsp;&nbsp;&nbsp;
				<li class="nav-item"><a class="nav-link"
					href="mali/recruiter.html"><i class="fas fa-envelope"></i>
						Contact Recruiter</a></li>&nbsp;&nbsp;
						<li class="nav-item"><a class="nav-link"
					href="${userobj.access eq 'lock' ? 'premiumlock.html' : 'premiumunlock.html'}"><img
						src="mali/premium.jpg"style="height: 30px; width: 30px; border-radius: 50%;"
						> Premium Features
						</a></li>

			</c:if>
		</ul>

		<div class="form-inline my-2 my-lg-0">
			<c:if test="${userobj.role eq 'admin'}">
				<a href="#" class="btn btn-outline-light mr-2"> <i
					class="fas fa-user"></i> Admin
				</a>
			</c:if>

			<c:if test="${userobj.role eq 'user'}">
				<a href="#" data-toggle="modal" data-target="#exampleModal"
					class="btn btn-outline-light mr-2"> <i class="fas fa-user"></i>
					${userobj.name}
				</a>
			</c:if>

			<c:if test="${not empty userobj}">
				<a href="logout" class="btn btn-outline-light mr-2"><i
					class="fas fa-sign-in-alt"></i> Logout</a>
			</c:if>

			<c:if test="${empty userobj}">
				<div class="dropdown">
					<button type="button"
						class="btn btn-outline-light dropdown-toggle mr-2"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						Login</button>
					<div class="dropdown-menu dropdown-menu-right mt-3">
						<a class="dropdown-item" href="login.jsp">User</a> <a
							class="dropdown-item" href="login.jsp">Admin</a>
					</div>
				</div>
				<a href="signup.jsp" class="btn btn-outline-light"><i
					class="fas fa-user"></i> Sign Up</a>
			</c:if>
		</div>
	</div>
</nav>

<!-- Modal -->
<div class="modal fade slide-in-right" id="exampleModal" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Profile</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="text-center">
					<i class="fas fa-user-circle fa-4x"></i>
				</div>
				<table class="table profile-table mt-3">
					<tbody>
						<tr>
							<th scope="row">Name</th>
							<td>${userobj.name}</td>
						</tr>
						<tr>
							<th scope="row">Qualification</th>
							<td>${userobj.qualification}</td>
						</tr>
						<tr>
							<th scope="row">Email</th>
							<td>${userobj.email}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<a href="edit_profile.jsp" class="btn btn-primary">Edit</a>
			</div>
		</div>
	</div>
</div>
