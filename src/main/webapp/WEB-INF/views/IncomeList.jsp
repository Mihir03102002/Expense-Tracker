<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Income | Expense Tracker</title>

<jsp:include page="AdminCSS.jsp"></jsp:include>

</head>

<body>

<div class="container-scroller">

    <!-- HEADER -->
    <jsp:include page="AdminHeader.jsp"></jsp:include>

    <div class="container-fluid page-body-wrapper">

        <!-- SIDEBAR -->
        <jsp:include page="AdminLeftSidebar.jsp"></jsp:include>

        <!-- MAIN PANEL -->
        <div class="main-panel">
            <div class="content-wrapper">

                <h3 class="mb-3">My Income</h3>

                <div class="card">
                    <div class="card-header bg-dark text-white">
                        Income List
                    </div>

                    <div class="card-body">

                        <div class="table-responsive">
                            <table class="table table-bordered table-hover text-center">

                                <thead class="table-light">
                                    <tr>
                                        <th>Title</th>
                                        <th>Account</th>
                                        <th>Amount</th>
                                        <th>Date</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>

                                <tbody>

                                    <c:choose>

                                        <c:when test="${empty incomes}">
                                            <tr>
                                                <td colspan="5">No income records found</td>
                                            </tr>
                                        </c:when>

                                        <c:otherwise>
                                            <c:forEach var="i" items="${incomes}">
												    <tr>
												        <td>${i.title}</td>
												        <td>${i.account.title}</td>
												        <td>₹ ${i.amount}</td>
												        <td>${i.date}</td>
												        <td>${i.status.status}</td>
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

            <!-- FOOTER -->
            <jsp:include page="AdminFooter.jsp"></jsp:include>

        </div>
    </div>
</div>

<jsp:include page="AdminJS.jsp"></jsp:include>

</body>
</html>
