<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8">
<title>My Account List | Expense Tracker</title>

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

            <h3 class="mb-2">My Account List</h3>
            <p class="text-muted mb-4">View and manage your accounts</p>

            <div class="card">

                <!-- CARD HEADER -->
                <div class="card-header d-flex justify-content-between align-items-center bg-primary text-white">

                    <span>My Accounts</span>

                    <!-- ADD NEW ACCOUNT BUTTON -->
                    <a href="${pageContext.request.contextPath}/user/account"
                       class="btn btn-success btn-sm">

                       + Add New Account

                    </a>

                </div>

                <div class="card-body">

                    <table class="table table-bordered table-hover text-center align-middle">

                        <thead class="table-light">

                            <tr>
                                <th>S.No</th>
                                <th>Account Title</th>
                                <th>Account Type</th>
                                <th>Balance</th>
                                <th>Action</th>
                            </tr>

                        </thead>

                        <tbody>

                            <!-- If empty -->
                            <c:if test="${empty accounts}">
                                <tr>
                                    <td colspan="5">No accounts found</td>
                                </tr>
                            </c:if>

                            <!-- Account Loop -->
                            <c:forEach var="a" items="${accounts}" varStatus="i">

                                <tr>

                                    <!-- Serial Number -->
                                    <td>${i.index + 1}</td>

                                    <td>${a.title}</td>
                                    <td>${a.accountType}</td>
                                    <td>₹ ${a.amount}</td>

                                    <td>

                                        <a href="${pageContext.request.contextPath}/user/account/delete?accountId=${a.accountId}"
                                           class="btn btn-danger btn-sm"
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

        <!-- USER FOOTER -->
        <jsp:include page="UserFooter.jsp"></jsp:include>

    </div>

</div>

</div>

<!-- USER JS -->
<jsp:include page="UserJS.jsp"></jsp:include>

</body>
</html>