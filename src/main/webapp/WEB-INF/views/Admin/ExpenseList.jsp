<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>My Expenses</title>

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
						<h3>My Expenses</h3>
					</div>

				</div>



				<!-- ================= EXPENSE CARD ================= -->
				<div class="row">

					<div class="col-md-12">

						<div class="card shadow-sm">


							<!-- ================= CARD HEADER ================= -->
							<div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">

								<span>
									<i class="ti-wallet"></i> Expense List
								</span>

								<a href="${pageContext.request.contextPath}/admin/expense"
								   class="btn btn-success btn-sm">

									+ Add New Expense

								</a>

							</div>



							<!-- ================= CARD BODY ================= -->
							<div class="card-body">

								<div class="table-responsive">


									<table class="table table-bordered table-hover text-center align-middle">

										<thead class="table-light">

											<tr>
												<th>Title</th>
												<th>Category</th>
												<th>Vendor</th>
												<th>Amount</th>
												<th>Date</th>
												<th>Status</th>
												<th>Action</th>
											</tr>

										</thead>



										<tbody>

											<c:choose>

												<c:when test="${empty expenseList}">

													<tr>
														<td colspan="7" class="text-muted">
															No expenses found
														</td>
													</tr>

												</c:when>

												<c:otherwise>

													<c:forEach var="e" items="${expenseList}">

														<tr>

															<td>${e.title}</td>

															<td>${e.category.categoryName}</td>

															<td>${e.vendor.vendorName}</td>

															<td>₹ ${e.amount}</td>

															<td>${e.date}</td>

															<td>${e.status.status}</td>

															<td>

																<a href="${pageContext.request.contextPath}/expense/delete?expenseId=${e.expenseId}"
																   class="btn btn-danger btn-sm"
																   onclick="return confirm('Are you sure you want to delete this expense?')">

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