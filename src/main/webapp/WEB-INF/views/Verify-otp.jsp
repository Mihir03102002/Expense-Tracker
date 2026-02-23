<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Verify OTP | ExpenseTracker</title>

<!-- plugins:css -->
<link rel="stylesheet" href="../../assets/vendors/feather/feather.css">
<link rel="stylesheet" href="../../assets/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" href="../../assets/vendors/css/vendor.bundle.base.css">
<link rel="stylesheet" href="../../assets/vendors/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="../../assets/vendors/mdi/css/materialdesignicons.min.css">

<!-- inject:css -->
<link rel="stylesheet" href="../../assets/css/style.css">

<link rel="shortcut icon" href="../../assets/images/favicon.png" />

<style>
.otp-input {
	width: 45px;
	height: 50px;
	font-size: 20px;
	text-align: center;
	margin: 5px;
	border-radius: 8px;
}
</style>

</head>

<body>
	<div class="container-scroller">
		<div class="container-fluid page-body-wrapper full-page-wrapper">
			<div class="content-wrapper d-flex align-items-center auth px-0">
				<div class="row w-100 mx-0">
					<div class="col-lg-4 mx-auto">

						<div class="auth-form-light text-center py-5 px-4 px-sm-5">

							<h4>Verify OTP</h4>
							<h6 class="font-weight-light">
								Enter the 6-digit code sent to your email
							</h6>

							<form class="pt-3" action="verify-otp" method="post" onsubmit="combineOTP()">

								<div class="d-flex justify-content-center mt-4">

									<input type="text" maxlength="1" class="form-control otp-input" onkeyup="moveNext(this)">
									<input type="text" maxlength="1" class="form-control otp-input" onkeyup="moveNext(this)">
									<input type="text" maxlength="1" class="form-control otp-input" onkeyup="moveNext(this)">
									<input type="text" maxlength="1" class="form-control otp-input" onkeyup="moveNext(this)">
									<input type="text" maxlength="1" class="form-control otp-input" onkeyup="moveNext(this)">
									<input type="text" maxlength="1" class="form-control otp-input" onkeyup="moveNext(this)">

								</div>

								<!-- Hidden field -->
								<input type="hidden" name="otp" id="finalOtp">

								<!-- Error Message -->
								<c:if test="${not empty error}">
									<div class="text-danger mt-3">
										${error}
									</div>
								</c:if>

								<div class="mt-4 d-grid gap-2">
									<button type="submit"
										class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn">
										VERIFY OTP
									</button>
								</div>

								<div class="text-center mt-3">
									<a href="Forgot-Password" class="text-primary">
										Back
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

<script>
function moveNext(current) {
	if (current.value.length === 1) {
		if (current.nextElementSibling) {
			current.nextElementSibling.focus();
		}
	}
}

function combineOTP() {
	let inputs = document.querySelectorAll(".otp-input");
	let otp = "";
	inputs.forEach(input => {
		otp += input.value;
	});
	document.getElementById("finalOtp").value = otp;
}
</script>

</body>
</html>