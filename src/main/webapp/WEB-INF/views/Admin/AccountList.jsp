<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Account List | Expense Tracker</title>

<jsp:include page="AdminCSS.jsp"></jsp:include>

</head>

<body>

<div class="container-scroller">

	<jsp:include page="AdminHeader.jsp"></jsp:include>

	<div class="container-fluid page-body-wrapper">

		<jsp:include page="AdminLeftSidebar.jsp"></jsp:include>

		<div class="main-panel">

			<div class="content-wrapper">

				<div class="row mb-4">
					<div class="col-md-12">
						<h3>Account List</h3>
						<p class="text-muted">View and manage all accounts</p>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12">

						<div class="card shadow-sm">

							<div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
								<span>
									<i class="ti-wallet mr-2"></i>
									All Accounts
								</span>

								<a href="${ctx}/admin/accountList"
								   class="btn btn-success btn-sm rounded-pill">
								   + Add New Account
								</a>
							</div>

							<div class="card-body">

								<!-- 🔍 SEARCH -->
								<form method="get" action="${ctx}/admin/accountList" class="mb-3 d-flex">

									<input type="text"
									       name="keyword"
									       value="${keyword}"
									       placeholder="Search account..."
									       class="form-control me-2"/>

									<button class="btn btn-primary">Search</button>

								</form>

								<div class="table-responsive">

									<table class="table table-bordered table-hover text-center align-middle">

										<thead class="table-light">
											<tr>
												<th>Sr. No</th>
												<th>Account Title</th>
												<th>Account Type</th>
												<th>Balance</th>
												<th>Action</th>
											</tr>
										</thead>

										<tbody>

											<c:if test="${empty accounts}">
												<tr>
													<td colspan="5">No accounts found</td>
												</tr>
											</c:if>

											<c:forEach var="a" items="${accounts}" varStatus="status">

												<tr>

													<!-- ✅ SERIAL FIX -->
													<td>${currentPage * 10 + status.index + 1}</td>

													<td>${a.title}</td>
													<td>${a.accountType}</td>

													<td>
													    ₹ 
													    <c:choose>
													        <c:when test="${a.amount != null}">
													            ${a.amount}
													        </c:when>
													        <c:otherwise>
													            0.00
													        </c:otherwise>
													    </c:choose>
													</td>

													<td>
														<a href="${ctx}/admin/account/delete?accountId=${a.accountId}"
														   class="btn btn-danger btn-sm rounded-pill"
														   onclick="return confirm('Are you sure?')">
															Delete
														</a>
													</td>

												</tr>

											</c:forEach>

										</tbody>

									</table>

								</div>

								<!-- 🔢 PAGINATION -->
								<c:if test="${totalPages > 1}">
									<nav class="mt-3">
										<ul class="pagination justify-content-center">

											<li class="page-item ${currentPage == 0 ? 'disabled' : ''}">
												<a class="page-link"
												   href="${ctx}/admin/accountList?page=${currentPage - 1}&keyword=${keyword}">
													Previous
												</a>
											</li>

											<c:forEach begin="0" end="${totalPages - 1}" var="i">
												<li class="page-item ${i == currentPage ? 'active' : ''}">
													<a class="page-link"
													   href="${ctx}/admin/accountList?page=${i}&keyword=${keyword}">
														${i + 1}
													</a>
												</li>
											</c:forEach>

											<li class="page-item ${currentPage == totalPages - 1 ? 'disabled' : ''}">
												<a class="page-link"
												   href="${ctx}/admin/accountList?page=${currentPage + 1}&keyword=${keyword}">
													Next
												</a>
											</li>

										</ul>
									</nav>
								</c:if>

							</div>

						</div>

					</div>
				</div>

			</div>

			<jsp:include page="AdminFooter.jsp"></jsp:include>

		</div>

	</div>

</div>

<jsp:include page="AdminJS.jsp"></jsp:include>

</body>
</html>