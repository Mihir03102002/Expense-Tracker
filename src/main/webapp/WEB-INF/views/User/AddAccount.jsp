<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>My Accounts | Expense Tracker</title>

<!-- USER CSS -->
<jsp:include page="UserCSS.jsp"></jsp:include>

</head>

<body>

<div class="container-scroller">

    <!-- USER HEADER -->
    <jsp:include page="UserHeader.jsp"></jsp:include>

    <div class="container-fluid page-body-wrapper">

        <!-- USER SIDEBAR -->
        <jsp:include page="UserLeftSidebar.jsp"></jsp:include>

        <!-- MAIN PANEL -->
        <div class="main-panel">
            <div class="content-wrapper">

                <h3 class="mb-2">My Accounts</h3>
                <p class="text-muted mb-4">Manage your accounts</p>

                <!-- ================= ADD ACCOUNT ================= -->

                <div class="card mb-4">

                    <div class="card-header bg-primary text-white">
                        Add New Account
                    </div>

                    <div class="card-body">

                        <form action="${pageContext.request.contextPath}/user/account"
                              method="post">

                            <div class="row">

                                <div class="col-md-3">
                                    <label class="form-label">Account Title</label>
                                    <input type="text"
                                           name="title"
                                           class="form-control"
                                           placeholder="Example: Personal Wallet"
                                           required>
                                </div>

                                <div class="col-md-3">
                                    <label class="form-label">Payment Type</label>

                                    <select name="accountType"
                                            class="form-select"
                                            required>

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

                                    <input type="number"
                                           name="amount"
                                           class="form-control"
                                           placeholder="0"
                                           required>
                                </div>

                                <div class="col-md-3 d-flex align-items-end">

                                    <button class="btn btn-success w-100">
                                        Add Account
                                    </button>

                                </div>

                            </div>

                        </form>

                    </div>

                </div>


                <!-- ================= ACCOUNT LIST ================= -->

                <div class="card">

                    <div class="card-header bg-dark text-white">
                        My Account List
                    </div>

                    <div class="card-body">

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
                                        <td colspan="4">
                                            No accounts found
                                        </td>
                                    </tr>

                                </c:if>

                            </tbody>

                        </table>

                    </div>

                </div>

            </div>

            <!-- USER FOOTER -->
            <jsp:include page="UserFooter.jsp"></jsp:include>

        </div>

    </div>

</div>

<!-- USER JS -->
<jsp:include page="UserJS.jsp"></jsp:include>

</body>
</html>