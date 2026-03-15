<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Account List | Expense Tracker</title>

<!-- ================= ADMIN CSS ================= -->
<jsp:include page="AdminCSS.jsp"></jsp:include>

</head>

<body>

<div class="container-scroller">

	<!-- ================= HEADER ================= -->
	<jsp:include page="AdminHeader.jsp"></jsp:include>

	<div class="container-fluid page-body-wrapper">

		<!-- ================= SIDEBAR ================= -->
		<jsp:include page="AdminLeftSidebar.jsp"></jsp:include>


		<!-- ================= MAIN PANEL ================= -->
		<div class="main-panel">

			<div class="content-wrapper">

				<!-- ================= PAGE TITLE ================= -->
				<div class="row mb-4">

					<div class="col-md-12">

						<h3>Account List</h3>

						<p class="text-muted">
							View and manage all accounts
						</p>

					</div>

				</div>



				<!-- ================= ACCOUNT TABLE ================= -->
				<div class="row">

					<div class="col-md-12">

						<div class="card shadow-sm">


							<!-- CARD HEADER -->
							<div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">

								<span>
									<i class="ti-wallet mr-2"></i>
									All Accounts
								</span>

								<!-- ADD ACCOUNT BUTTON -->
								<a href="${pageContext.request.contextPath}/admin/account"
								   class="btn btn-success btn-sm rounded-pill">
								   + Add New Account
								</a>
							</div>



							<!-- CARD BODY -->
							<div class="card-body">

								<div class="table-responsive">

									<table class="table table-bordered table-hover text-center align-middle">


										<!-- TABLE HEADER -->
										<thead class="table-light">

											<tr>
												<th>ID</th>
												<th>Account Title</th>
												<th>Account Type</th>
												<th>Balance</th>
												<th>Action</th>
											</tr>

										</thead>



										<!-- TABLE BODY -->
										<tbody>

											<!-- IF EMPTY -->
											<c:if test="${empty accounts}">

												<tr>

													<td colspan="5" class="text-muted">
														No accounts found
													</td>

												</tr>

											</c:if>



											<!-- LOOP DATA -->
											<c:forEach var="a" items="${accounts}">

												<tr>

													<td>${a.accountId}</td>

													<td>${a.title}</td>

													<td>${a.accountType}</td>

													<td>₹ ${a.amount}</td>

													<td>

														<a href="${pageContext.request.contextPath}/admin/account/delete?accountId=${a.accountId}"
														   class="btn btn-danger btn-sm rounded-pill"
														   onclick="return confirm('Are you sure you want to delete this account?')">

															Delete

														</a>

													</td>

												</tr>

											</c:forEach>

										</tbody>

									</table>

								</div>

							</div>

						</div>

					</div>

				</div>

			</div>



			<!-- ================= FOOTER ================= -->
			<jsp:include page="AdminFooter.jsp"></jsp:include>

		</div>

	</div>

</div>



<!-- ================= ADMIN JS ================= -->
<jsp:include page="AdminJS.jsp"></jsp:include>

</body>
</html>