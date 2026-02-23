<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Reset Password | ExpenseTracker</title>

<!-- plugins:css -->
<link rel="stylesheet" href="../../assets/vendors/feather/feather.css">
<link rel="stylesheet" href="../../assets/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" href="../../assets/vendors/css/vendor.bundle.base.css">
<link rel="stylesheet" href="../../assets/vendors/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="../../assets/vendors/mdi/css/materialdesignicons.min.css">

<!-- inject:css -->
<link rel="stylesheet" href="../../assets/css/style.css">

<link rel="shortcut icon" href="../../assets/images/favicon.png" />
</head>

<body>
	<div class="container-scroller">
		<div class="container-fluid page-body-wrapper full-page-wrapper">
			<div class="content-wrapper d-flex align-items-center auth px-0">
				<div class="row w-100 mx-0">
					<div class="col-lg-4 mx-auto">

						<div class="auth-form-light text-left py-5 px-4 px-sm-5">

							<h4>Reset Password</h4>
							<h6 class="font-weight-light">
								Create a new password for your account
							</h6>

							<form class="pt-3" action="reset-password" method="post">

								<div class="form-group">
									<input type="password" name="password"
										class="form-control form-control-lg"
										placeholder="New Password" required>
								</div>

								<div class="form-group">
									<input type="password" name="cpassword"
										class="form-control form-control-lg"
										placeholder="Confirm Password" required>
								</div>

								<c:if test="${param.error eq 'nomatch'}">
									<div class="text-danger mt-2">
										Passwords do not match.
									</div>
								</c:if>

								<c:if test="${not empty success}">
									<div class="alert alert-success mt-2">
										${success}
									</div>
								</c:if>

								<div class="mt-4 d-grid gap-2">
									<button type="submit"
										class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn">
										UPDATE PASSWORD
									</button>
								</div>

								<div class="text-center mt-3">
									<a href="login" class="text-primary">
										Back to Login
									</a>
								</div>

							</form>

						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- plugins:js -->
	<script src="../../assets/vendors/js/vendor.bundle.base.js"></script>

	<!-- inject:js -->
	<script src="../../assets/js/off-canvas.js"></script>
	<script src="../../assets/js/template.js"></script>
	<script src="../../assets/js/settings.js"></script>
	<script src="../../assets/js/todolist.js"></script>

</body>
</html>