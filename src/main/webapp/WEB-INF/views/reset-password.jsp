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

<style>
.password-toggle {
	cursor: pointer;
	position: absolute;
	right: 15px;
	top: 50%;
	transform: translateY(-50%);
}
</style>

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

<form class="pt-3" action="reset-password" method="post" onsubmit="return validatePassword()">

<div class="form-group position-relative">
<input type="password" id="password" name="password"
class="form-control form-control-lg"
placeholder="New Password" required minlength="6">

<span class="password-toggle" onclick="togglePassword('password')">
<i class="mdi mdi-eye"></i>
</span>
</div>

<div class="form-group position-relative">
<input type="password" id="cpassword" name="cpassword"
class="form-control form-control-lg"
placeholder="Confirm Password" required minlength="6">

<span class="password-toggle" onclick="togglePassword('cpassword')">
<i class="mdi mdi-eye"></i>
</span>
</div>

<!-- Password match error -->
<div id="passwordError" class="text-danger"></div>

<!-- Server error -->
<c:if test="${param.error eq 'nomatch'}">
<div class="text-danger mt-2">
Passwords do not match.
</div>
</c:if>

<c:if test="${param.error eq 'expired'}">
<div class="text-danger mt-2">
Session expired. Please reset again.
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

<script>

function togglePassword(id){
let field = document.getElementById(id);
field.type = field.type === "password" ? "text" : "password";
}

function validatePassword(){

let password = document.getElementById("password").value;
let confirmPassword = document.getElementById("cpassword").value;
let error = document.getElementById("passwordError");

if(password !== confirmPassword){
error.innerText = "Passwords do not match";
return false;
}

error.innerText = "";
return true;

}

</script>

</body>
</html>