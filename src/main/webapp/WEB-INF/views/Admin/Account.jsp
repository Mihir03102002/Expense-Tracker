<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>My Accounts | Expense Tracker</title>

<!-- ================= ADMIN CSS ================= -->
<jsp:include page="AdminCSS.jsp"/>

</head>

<body>

<div class="container-scroller">

    <!-- ================= HEADER ================= -->
    <jsp:include page="AdminHeader.jsp"/>

    <div class="container-fluid page-body-wrapper">

        <!-- ================= SIDEBAR ================= -->
        <jsp:include page="AdminLeftSidebar.jsp"/>

        <!-- ================= MAIN PANEL ================= -->
        <div class="main-panel">

            <div class="content-wrapper">

                <!-- PAGE TITLE -->
                <div class="row mb-3">
                    <div class="col-md-12">
                        <h3 class="font-weight-bold">Account Management</h3>
                        <p class="text-muted">Add and view your accounts</p>
                    </div>
                </div>

                <!-- ================= ADD ACCOUNT FORM ================= -->
                <div class="row">
                    <div class="col-md-12 grid-margin stretch-card">

                        <div class="card">

                            <div class="card-header bg-primary text-white">
                                Add New Account
                            </div>

                            <div class="card-body">

                                <form action="${pageContext.request.contextPath}/admin/account" method="post">

                                    <div class="row">

                                        <div class="col-md-3">
                                            <label class="form-label">Account Title</label>
                                            <input type="text" name="title" class="form-control" required>
                                        </div>

                                        <div class="col-md-3">
                                            <label class="form-label">Payment Type</label>
                                            <select name="accountType" class="form-control" required>
                                                <option value="">-- Select Type --</option>
                                                <option value="Cash">Cash</option>
                                                <option value="UPI">UPI</option>
                                                <option value="Credit Card">Credit Card</option>
                                                <option value="Debit Card">Debit Card</option>
                                                <option value="Net Banking">Net Banking</option>
                                                <option value="Other">Other</option>
                                            </select>
                                        </div>

                                        <div class="col-md-3">
                                            <label class="form-label">Initial Amount</label>
                                            <input type="number" name="amount" class="form-control" required>
                                        </div>

                                        <div class="col-md-3 d-flex align-items-end">
                                            <button class="btn btn-success">
                                                Add Account
                                            </button>
                                        </div>

                                    </div>

                                </form>

                            </div>

                        </div>

                    </div>
                </div>


                <!-- ================= ACCOUNT TABLE ================= -->
                <div class="row">
                    <div class="col-md-12 grid-margin stretch-card">

                        <div class="card">

                            <div class="card-header bg-dark text-white">
                                Account List
                            </div>

                            <div class="card-body">

                                <div class="table-responsive">

                                    <table class="table table-bordered text-center">

                                        <thead class="table-light">
                                            <tr>
                                                <th>ID</th>
                                                <th>Account</th>
                                                <th>Type</th>
                                                <th>Balance</th>
                                            </tr>
                                        </thead>

                                        <tbody>

                                            <c:forEach var="a" items="${accounts}">
                                                <tr>
                                                    <td>${a.accountId}</td>
                                                    <td>${a.title}</td>
                                                    <td>${a.accountType}</td>
                                                    <td>₹ ${a.amount}</td>
                                                </tr>
                                            </c:forEach>

                                            <c:if test="${empty accounts}">
                                                <tr>
                                                    <td colspan="4">No accounts found</td>
                                                </tr>
                                            </c:if>

                                        </tbody>

                                    </table>

                                </div>

                            </div>

                        </div>

                    </div>
                </div>

            </div>

            <!-- ================= FOOTER ================= -->
            <jsp:include page="AdminFooter.jsp"/>

        </div>

    </div>

</div>

<!-- ================= ADMIN JS ================= -->
<jsp:include page="AdminJS.jsp"/>

</body>
</html>