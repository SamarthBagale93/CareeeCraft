<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Setting Password</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css"
	rel="stylesheet">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
    /* Enhanced styling for the container */
    .container-blue {
        background-color: #e6f2ff; /* Pale blue */
        border-radius: 15px;
        padding: 20px;
        box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
    }

    /* Styling for the headings */
    h1 {
        font-weight: bold;
        color: #007bff;
    }

    /* Styling for placeholders */
    .placeicon {
        font-family: fontawesome;
    }

    /* Form input styling */
    .form-control {
        border: none;
        border-bottom: 2px solid #007bff;
        border-radius: 0;
        background-color: #f8f9fa;
        color: #495057;
    }

    /* Focus effect on inputs */
    .form-control:focus {
        box-shadow: none;
        border-bottom: 2px solid #0056b3;
    }

    /* Button styling */
    .btn-custom {
        background-color: #007bff;
        color: white;
        font-weight: bold;
        border-radius: 25px;
        transition: background-color 0.3s;
    }

    /* Button hover effect */
    .btn-custom:hover {
        background-color: #0056b3;
    }

    /* Styling for "Register Now" link */
    .register-link {
        color: #ff4d4d;
        text-decoration: none;
        font-weight: bold;
    }

    .register-link:hover {
        color: #cc0000;
        text-decoration: underline;
    }

    /* Style for the light background section */
    .alt-login-section {
        background-color: #f8f9fa;
        border-top: 1px solid #dee2e6;
        padding-top: 15px;
    }
</style>
</head>
<body oncontextmenu="return false">
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-social/5.1.1/bootstrap-social.css">
	<div>
		<!-- Container containing all contents -->
		<div class="container">
		
			<div class="row justify-content-center">
				<div class="col-12 col-md-9 col-lg-7 col-xl-6 mt-5">
					<!-- Pale Blue Container -->
					<div class="container container-blue mt-2 mb-2 px-0">
						<!-- Main Heading -->
						<div class="row justify-content-center align-items-center pt-3">
							<h1>
								<strong>Reset Password</strong>
							</h1>
						</div>
						<div class="pt-3 pb-3">
							<form class="form-horizontal" action="newPassword" method="POST">
								<!-- New Password Input -->
								<div class="form-group row justify-content-center px-3">
									<div class="col-9 px-0">
										<input type="text" name="password"
											placeholder="&#xf084; &nbsp; New Password"
											class="form-control placeicon">
									</div>
								</div>
								<!-- Confirm Password Input -->
								<div class="form-group row justify-content-center px-3">
									<div class="col-9 px-0">
										<input type="password" name="confPassword"
											placeholder="&#xf084; &nbsp; Confirm New Password"
											class="form-control placeicon">
									</div>
								</div>

								<!-- Reset Button -->
								<div class="form-group row justify-content-center">
									<div class="col-3 px-3 mt-3">
										<input type="submit" value="Reset"
											class="btn btn-block btn-custom">
									</div>
								</div>
							</form>
						</div>
						<!-- Alternative Login -->
						<div class="alt-login-section mx-0 px-0">
							<!-- Horizontal Line -->
							<div class="px-4 pt-4">
								<hr>
							</div>
							<!-- Register Now -->
							<div class="pt-2">
								<div class="row justify-content-center">
									<h5>
										Don't have an Account?<span><a href="signup.jsp"
											class="register-link"> Register Now!</a></span>
									</h5>
								</div>
								<div
									class="row justify-content-center align-items-center pt-4 pb-5">
									<div class="col-4"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js"></script>

</body>
</html>
