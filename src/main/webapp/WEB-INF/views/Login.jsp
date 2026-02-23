<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>ExpenseTracker</title>
<!-- plugins:css -->
<link rel="stylesheet" href="../../assets/vendors/feather/feather.css">
<link rel="stylesheet"
	href="../../assets/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet"
	href="../../assets/vendors/css/vendor.bundle.base.css">
<link rel="stylesheet"
	href="../../assets/vendors/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="../../assets/vendors/mdi/css/materialdesignicons.min.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet" href="../../assets/css/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="../../assets/images/favicon.png" />
</head>
<body>
	<div class="container-scroller">
		<div class="container-fluid page-body-wrapper full-page-wrapper">
			<div class="content-wrapper d-flex align-items-center auth px-0">
				<div class="row w-100 mx-0">
					<div class="col-lg-4 mx-auto">
						<div class="auth-form-light text-left py-5 px-4 px-sm-5">
							<div class="brand-logo">
								<!--  <img src="../../assets/images/logo.svg" alt="logo"> -->
							</div>
							<h4>Hello! let's get started</h4>
							<h6 class="font-weight-light">Sign in to continue.</h6>
							<form class="pt-3" action="authenticate" method="post">

								<div class="form-group">
									<input type="email" name="email"
										class="form-control form-control-lg" id="exampleInputEmail1"
										placeholder="Email">
								</div>


								<div class="form-group">
									<input type="password" name="password"
										class="form-control form-control-lg"
										id="exampleInputPassword1" placeholder="Password">
								</div>

								<div class="mt-3 d-grid gap-2">
									<button type="submit"
										class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn"
										>LOGIN</button>
								</div>
								<div class="text-center mt-4">
								    <p class="mb-1">
								        Don't have an account? 
								        <a href="signup" class="text-primary">Signup</a>
								    </p>
								
								    <a href="Forgot-Password" class="text-decoration-none text-primary">
								        Forgot Password?
								    </a>
								</div>
								<br>
								<span class="text-danger">${error}</span>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- content-wrapper ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
	<!-- plugins:js -->
	<script src="../../assets/vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page -->
	<!-- End plugin js for this page -->
	<!-- inject:js -->
	<script src="../../assets/js/off-canvas.js"></script>
	<script src="../../assets/js/template.js"></script>
	<script src="../../assets/js/settings.js"></script>
	<script src="../../assets/js/todolist.js"></script>
	<!-- endinject -->
</body>
</html>
