<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Expense Tracker Admin</title>

<jsp:include page="AdminCSS.jsp"></jsp:include>

</head>
<body>
	<div class="container-scroller">

		<!-- Header -->
		<jsp:include page="AdminHeader.jsp"></jsp:include>

		<div class="container-fluid page-body-wrapper">

			<!-- Sidebar -->
			<jsp:include page="AdminLeftSidebar.jsp"></jsp:include>

			<div class="main-panel">
				<div class="content-wrapper">

					<!-- Welcome Section -->
					<div class="row">
						<div class="col-md-12 grid-margin">
							<div class="row">
								<div class="col-12 col-xl-8 mb-4 mb-xl-0">
									<h3 class="font-weight-bold">
										Welcome ${sessionScope.user.firstName}
									</h3>
									<h6 class="font-weight-normal mb-0">
										Track your income and expenses efficiently.
									</h6>
								</div>
							</div>
						</div>
					</div>

					<!-- Dashboard Cards -->
					<div class="row">
						<div class="col-md-12 grid-margin transparent">
							<div class="row">

								<!-- Total Income -->
								<div class="col-md-3 mb-4 stretch-card transparent">
									<div class="card card-tale">
										<div class="card-body">
											<p class="mb-4">Total Income (This Month)</p>
											<p class="fs-30 mb-2">
												&#8377; <fmt:formatNumber value="${totalIncome}" type="number" minFractionDigits="2"/>
											</p>
											<p class="text-success">
												<fmt:formatNumber value="${incomeGrowth}" minFractionDigits="1"/>% from last month
											</p>
										</div>
									</div>
								</div>

								<!-- Total Expense -->
								<div class="col-md-3 mb-4 stretch-card transparent">
									<div class="card card-dark-blue">
										<div class="card-body">
											<p class="mb-4">Total Expense (This Month)</p>
											<p class="fs-30 mb-2">
												&#8377; <fmt:formatNumber value="${totalExpense}" type="number" minFractionDigits="2"/>
											</p>
											<p class="text-danger">
												<fmt:formatNumber value="${expenseGrowth}" minFractionDigits="1"/>% from last month
											</p>
										</div>
									</div>
								</div>

								<!-- Current Balance -->
								<div class="col-md-3 mb-4 stretch-card transparent">
									<div class="card card-light-blue">
										<div class="card-body">
											<p class="mb-4">Current Balance</p>
											<p class="fs-30 mb-2">
												&#8377; <fmt:formatNumber value="${currentBalance}" type="number" minFractionDigits="2"/>
											</p>

											<c:choose>
												<c:when test="${currentBalance >= 0}">
													<p class="text-success">Positive Balance</p>
												</c:when>
												<c:otherwise>
													<p class="text-danger">Negative Balance</p>
												</c:otherwise>
											</c:choose>

										</div>
									</div>
								</div>

								<!-- Top Expense Category -->
								<div class="col-md-3 mb-4 stretch-card transparent">
									<div class="card card-light-danger">
										<div class="card-body">
											<p class="mb-4">Top Expense Category</p>
											<p class="fs-30 mb-2">${topCategoryName}</p>
											<p>
												&#8377; <fmt:formatNumber value="${topCategoryAmount}" type="number" minFractionDigits="2"/>
											</p>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>

					<!-- Monthly Report Chart -->
					<div class="row">
						<div class="col-md-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div class="d-flex justify-content-between">
										<p class="card-title">Monthly Income vs Expense Report</p>
									</div>

									<p class="font-weight-500">
										This chart shows monthly comparison between income and expenses
										to monitor financial performance.
									</p>

									<div id="sales-chart-legend"
										class="chartjs-legend mt-4 mb-2"></div>
									<canvas id="sales-chart"></canvas>
								</div>
							</div>
						</div>
					</div>

				</div>

				<!-- Footer -->
				<jsp:include page="AdminFooter.jsp"></jsp:include>

			</div>
		</div>
	</div>

</body>
</html>