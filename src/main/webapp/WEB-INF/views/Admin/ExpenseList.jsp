<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- ================= CONTEXT PATH ================= -->
<c:set var="ctx" value="${pageContext.request.contextPath}" />

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
				<div class="card shadow-sm">

					<!-- ===== CARD HEADER ===== -->
					<div class="card-header bg-primary text-white d-flex justify-content-between">
						<span>
							<i class="ti-wallet"></i> Expense List
						</span>

						<a href="${ctx}/admin/expense"
						   class="btn btn-success btn-sm">
						   + Add New Expense
						</a>
					</div>

					<!-- ===== CARD BODY ===== -->
					<div class="card-body">
					
					<!-- ✅ SUCCESS MESSAGE -->
						<c:if test="${param.success == 'added'}">
						    <div class="alert alert-success">Expense added successfully!</div>
						</c:if>
						
						<c:if test="${param.success == 'updated'}">
						    <div class="alert alert-success">Expense updated successfully!</div>
						</c:if>
						
						<c:if test="${param.success == 'deleted'}">
						    <div class="alert alert-danger">Expense deleted successfully!</div>
						</c:if>

						<!-- ================= SEARCH + DATE FILTER ================= -->
						<form method="get"
						      action="${ctx}/admin/expense-list"
						      class="mb-3 row g-2">

							<!-- 🔍 Search -->
							<div class="col-md-3">
								<input type="text"
								       name="keyword"
								       value="${keyword}"
								       placeholder="Search..."
								       class="form-control"/>
							</div>

							<!-- 📅 Start Date -->
							<div class="col-md-3">
								<input type="date"
								       name="startDate"
								       value="${startDate}"
								       class="form-control"/>
							</div>

							<!-- 📅 End Date -->
							<div class="col-md-3">
								<input type="date"
								       name="endDate"
								       value="${endDate}"
								       class="form-control"/>
							</div>

							<!-- 🔘 Filter Button -->
							<div class="col-md-3">
								<button class="btn btn-primary w-100">
									Filter
								</button>
							</div>

						</form>

						<!-- ================= EXPENSE TABLE ================= -->
						<div class="table-responsive">

							<table class="table table-bordered table-hover text-center align-middle">

								<!-- ===== TABLE HEADER ===== -->
								<thead class="table-light">
									<tr>
										<th>Sr. No</th>
										<th>Title</th>
										<th>Category</th>
										<th>Vendor</th>
										<th>Amount</th>
										<th>Date</th>
										<th>Status</th>
										<th>Action</th>
									</tr>
								</thead>

								<!-- ===== TABLE BODY ===== -->
								<tbody>

								    <c:choose>
								
								        <c:when test="${empty expenseList}">
								            <tr>
								                <td colspan="8">No expenses found</td>
								            </tr>
								        </c:when>
								
								        <c:otherwise>
								
								            <c:forEach var="e" items="${expenseList}" varStatus="status">
								
								                <tr>
								
								                    <td>${currentPage * 10 + status.index + 1}</td>
								
								                    <td>${e.title}</td>
								                    <td>${e.category.categoryName}</td>
								                    <td>${e.vendor.vendorName}</td>
								                    <td>₹ ${e.amount}</td>
								                    <td>${e.date}</td>
								                    <td>${e.status.status}</td>
								
								                    <td>

													    <a href="${ctx}/admin/expense/edit?expenseId=${e.expenseId}"
													       class="btn btn-warning btn-sm rounded-pill">
													        Edit
													    </a>
													
													    <a href="${ctx}/admin/expense/delete?expenseId=${e.expenseId}"
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

									<!-- ⬅ PREVIOUS -->
									<li class="page-item ${currentPage == 0 ? 'disabled' : ''}">
										<a class="page-link"
										   href="${ctx}/admin/expense-list?page=${currentPage - 1}&keyword=${keyword}&startDate=${startDate}&endDate=${endDate}">
											Previous
										</a>
									</li>

									<!-- 🔢 PAGE NUMBERS -->
									<c:forEach begin="0" end="${totalPages - 1}" var="i">
										<li class="page-item ${i == currentPage ? 'active' : ''}">
											<a class="page-link"
											   href="${ctx}/admin/expense-list?page=${i}&keyword=${keyword}&startDate=${startDate}&endDate=${endDate}">
												${i + 1}
											</a>
										</li>
									</c:forEach>

									<!-- ➡ NEXT -->
									<li class="page-item ${currentPage == totalPages - 1 ? 'disabled' : ''}">
										<a class="page-link"
										   href="${ctx}/admin/expense-list?page=${currentPage + 1}&keyword=${keyword}&startDate=${startDate}&endDate=${endDate}">
											Next
										</a>
									</li>

								</ul>
							</nav>

						</c:if>

					</div> <!-- END CARD BODY -->

				</div> <!-- END CARD -->

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