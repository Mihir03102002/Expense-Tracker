<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Expense Tracker User</title>

<!-- Admin Template CSS -->
<jsp:include page="UserCSS.jsp"></jsp:include>

</head>


<body>

<div class="container-scroller">

    <!-- ================= HEADER ================= -->
    <jsp:include page="UserHeader.jsp"/>


    <div class="container-fluid page-body-wrapper">

        <!-- ================= SIDEBAR ================= -->
        <jsp:include page="UserLeftSidebar.jsp"/>


        <!-- ================= MAIN PANEL ================= -->
        <div class="main-panel">
        <div class="content-wrapper">


            <!-- ================= WELCOME SECTION ================= -->
            <div class="row">

                <div class="col-md-12 grid-margin">

                    <h3 class="font-weight-bold">
                        Welcome ${sessionScope.user.firstName}
                    </h3>

                    <h6 class="font-weight-normal mb-0">
                        Track your income and expenses efficiently.
                    </h6>

                </div>

            </div>



            <!-- ================= DASHBOARD CARDS ================= -->
            <div class="row">

                <!-- ===== THIS MONTH EXPENSE ===== -->
                <div class="col-md-3 mb-4 stretch-card">

                    <div class="card card-light-danger">

                        <div class="card-body">

                            <p class="mb-4">This Month Expenses</p>

                            <h3 class="fs-30 mb-2">
                                ₹ 
                                <fmt:formatNumber 
                                    value="${monthExpense}" 
                                    type="number" 
                                    minFractionDigits="2"/>
                            </h3>

                        </div>

                    </div>

                </div>



                <!-- ===== QUARTERLY EXPENSE ===== -->
                <div class="col-md-3 mb-4 stretch-card">

                    <div class="card card-dark-blue">

                        <div class="card-body">

                            <p class="mb-4">Quarterly Expenses</p>

                            <h3 class="fs-30 mb-2">
                                ₹ 
                                <fmt:formatNumber 
                                    value="${quarterExpense}" 
                                    type="number" 
                                    minFractionDigits="2"/>
                            </h3>

                        </div>

                    </div>

                </div>



                <!-- ===== THIS MONTH INCOME ===== -->
                <div class="col-md-3 mb-4 stretch-card">

                    <div class="card card-tale">

                        <div class="card-body">

                            <p class="mb-4">This Month Income</p>

                            <h3 class="fs-30 mb-2">
                                ₹ 
                                <fmt:formatNumber 
                                    value="${monthIncome}" 
                                    type="number" 
                                    minFractionDigits="2"/>
                            </h3>

                        </div>

                    </div>

                </div>



                <!-- ===== QUARTERLY INCOME ===== -->
                <div class="col-md-3 mb-4 stretch-card">

                    <div class="card card-light-blue">

                        <div class="card-body">

                            <p class="mb-4">Quarterly Income</p>

                            <h3 class="fs-30 mb-2">
                                ₹ 
                                <fmt:formatNumber 
                                    value="${quarterIncome}" 
                                    type="number" 
                                    minFractionDigits="2"/>
                            </h3>

                        </div>

                    </div>

                </div>

            </div>



            <!-- ================= CHART SECTION ================= -->
            <div class="row">

                <div class="col-md-12 grid-margin stretch-card">

                    <div class="card">

                        <div class="card-body">

                            <div class="d-flex justify-content-between">

                                <p class="card-title">
                                    Monthly Income vs Expense Report
                                </p>

                            </div>

                            <p class="font-weight-500">

                                This chart shows monthly comparison between income and expenses.

                            </p>

                            <div id="sales-chart-legend" 
                                 class="chartjs-legend mt-4 mb-2">
                            </div>

                            <canvas id="sales-chart"></canvas>

                        </div>

                    </div>

                </div>

            </div>


        </div>


        <!-- ================= FOOTER ================= -->
        <jsp:include page="UserFooter.jsp"/>

        </div>

    </div>

</div>


<!-- ================= JS ================= -->
<jsp:include page="UserJS.jsp"></jsp:include>

</body>
</html>