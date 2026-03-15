<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>My Income | Expense Tracker</title>

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

						<h3>My Income</h3>

					</div>

				</div>



				<!-- ================= INCOME CARD ================= -->
				<div class="row">

					<div class="col-md-12">

						<div class="card shadow-sm">


							<!-- ================= CARD HEADER ================= -->
							<div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">

								<span>
									<i class="ti-wallet"></i> Income List
								</span>


								<!-- GREEN BUTTON (UNCHANGED) -->
								<a href="${pageContext.request.contextPath}/admin/income"
								   class="btn btn-success btn-sm">

									+ Add New Income

								</a>

							</div>



							<!-- ================= CARD BODY ================= -->
							<div class="card-body">

								<div class="table-responsive">


									<table class="table table-bordered table-hover text-center align-middle">


										<!-- ================= TABLE HEADER ================= -->
										<thead class="table-light">

											<tr>
												<th>Title</th>
												<th>Account</th>
												<th>Amount</th>
												<th>Date</th>
												<th>Status</th>
												<th>Action</th>
											</tr>

										</thead>



										<!-- ================= TABLE BODY ================= -->
										<tbody>

											<c:choose>

												<c:when test="${empty incomes}">

													<tr>

														<td colspan="6" class="text-muted">
															No income records found
														</td>

													</tr>

												</c:when>



												<c:otherwise>

													<c:forEach var="i" items="${incomes}">

														<tr>

															<td>${i.title}</td>

															<td>${i.account.title}</td>

															<td>₹ ${i.amount}</td>

															<td>${i.date}</td>

															<td>${i.status.status}</td>

															<td>

																<a href="${pageContext.request.contextPath}/income/delete?incomeId=${i.incomeId}"
																   class="btn btn-danger btn-sm"
																   onclick="return confirm('Are you sure you want to delete this income?')">

																	<i class="mdi mdi-delete"></i>
																	Delete

																</a>

															</td>

														</tr>

													</c:forEach>

												</c:otherwise>

											</c:choose>

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