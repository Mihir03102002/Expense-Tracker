<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Income | Expense Tracker</title>

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

                <h3 class="mb-3">My Income</h3>

                <div class="card shadow-sm">

                    <div class="card-header bg-primary text-white">
                        Income List
                    </div>

                    <div class="card-body">

                        <div class="table-responsive">

                            <table class="table table-bordered table-hover text-center align-middle">

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

                                <tbody>

                                    <!-- No income -->
                                    <c:if test="${empty incomes}">
                                        <tr>
                                            <td colspan="6" class="text-muted">
                                                No income records found
                                            </td>
                                        </tr>
                                    </c:if>

                                    <!-- Income list -->
                                    <c:forEach var="i" items="${incomes}">

                                        <tr>

                                            <td>${i.title}</td>

                                            <td>${i.account.title}</td>

                                            <td>₹ ${i.amount}</td>

                                            <td>${i.date}</td>

                                            <td>${i.status.status}</td>

                                            <td>

                                                <a href="${pageContext.request.contextPath}/user/deleteIncome?incomeId=${i.incomeId}"
                                                   class="btn btn-danger btn-sm"
                                                   onclick="return confirm('Delete this income?')">

                                                    <i class="mdi mdi-delete"></i> Delete

                                                </a>

                                            </td>

                                        </tr>

                                    </c:forEach>

                                </tbody>

                            </table>

                        </div>

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