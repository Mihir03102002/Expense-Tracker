<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- ================= CONTEXT PATH ================= -->
<c:set var="ctx" value="${pageContext.request.contextPath}" />

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

				<!-- ================= CARD ================= -->
				<div class="card shadow-sm">
				
				<!-- ✅ SUCCESS MESSAGE -->
						<c:if test="${param.success == 'added'}">
						    <div class="alert alert-success">Income added successfully!</div>
						</c:if>
						
						<c:if test="${param.success == 'updated'}">
						    <div class="alert alert-success">Income updated successfully!</div>
						</c:if>
						
						<c:if test="${param.success == 'deleted'}">
						    <div class="alert alert-danger">Income deleted successfully!</div>
						</c:if>

					<!-- ================= HEADER ================= -->
					<div class="card-header bg-primary text-white d-flex justify-content-between">

						<span>
							<i class="ti-wallet"></i> Income List
						</span>

						<a href="${ctx}/admin/income"
						   class="btn btn-success btn-sm">
						   + Add New Income
						</a>

					</div>

					<!-- ================= BODY ================= -->
					<div class="card-body">

						<!-- ================= SEARCH + DATE FILTER ================= -->
						<form method="get" action="${ctx}/admin/incomeList" class="mb-3 row g-2">

						    <div class="col-md-3">
						        <input type="text" name="keyword" value="${keyword}"
						               class="form-control" placeholder="Search..."/>
						    </div>

						    <div class="col-md-3">
						        <input type="date" name="startDate" value="${startDate}"
						               class="form-control"/>
						    </div>

						    <div class="col-md-3">
						        <input type="date" name="endDate" value="${endDate}"
						               class="form-control"/>
						    </div>

						    <div class="col-md-3">
						        <button class="btn btn-primary w-100">Filter</button>
						    </div>

						</form>

						<!-- ================= TABLE ================= -->
						<div class="table-responsive">

							<table class="table table-bordered table-hover text-center align-middle">

								<thead class="table-light">
									<tr>
										<th>Sr. No</th>
										<th>Title</th>
										<th>Account</th>
										<th>Amount</th>
										<th>Date</th>
										<th>Status</th>
										<th>Action</th>
									</tr>
								</thead>

								<tbody>

									<c:choose>

										<c:when test="${empty incomes}">
											<tr>
												<td colspan="7">No income records found</td>
											</tr>
										</c:when>

										<c:otherwise>

											<c:forEach var="i" items="${incomes}" varStatus="status">

												<tr>

													<!-- ================= SERIAL ================= -->
													<td>${currentPage * 10 + status.index + 1}</td>

													<td>${i.title}</td>
													<td>${i.account.title}</td>
													<td>₹ ${i.amount}</td>
													<td>${i.date}</td>
													<td>${i.status.status}</td>

													<td>

													    <a href="${ctx}/admin/income/edit?incomeId=${i.incomeId}"
													       class="btn btn-warning btn-sm rounded-pill">
													        Edit
													    </a>
													
													    <a href="${ctx}/admin/income/delete?incomeId=${i.incomeId}"
													       class="btn btn-danger btn-sm rounded-pill"
													       onclick="return confirm('Are you sure?')">
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

						<!-- ================= PAGINATION ================= -->
						<c:if test="${totalPages > 1}">
							<nav class="mt-3">
								<ul class="pagination justify-content-center">

									<!-- PREVIOUS -->
									<li class="page-item ${currentPage == 0 ? 'disabled' : ''}">
										<a class="page-link"
										   href="${ctx}/admin/incomeList?page=${currentPage - 1}&keyword=${keyword}&startDate=${startDate}&endDate=${endDate}">
											Previous
										</a>
									</li>

									<!-- PAGE NUMBERS -->
									<c:forEach begin="0" end="${totalPages - 1}" var="i">
										<li class="page-item ${i == currentPage ? 'active' : ''}">
											<a class="page-link"
											   href="${ctx}/admin/incomeList?page=${i}&keyword=${keyword}&startDate=${startDate}&endDate=${endDate}">
												${i + 1}
											</a>
										</li>
									</c:forEach>

									<!-- NEXT -->
									<li class="page-item ${currentPage == totalPages - 1 ? 'disabled' : ''}">
										<a class="page-link"
										   href="${ctx}/admin/incomeList?page=${currentPage + 1}&keyword=${keyword}&startDate=${startDate}&endDate=${endDate}">
											Next
										</a>
									</li>

								</ul>
							</nav>
						</c:if>

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