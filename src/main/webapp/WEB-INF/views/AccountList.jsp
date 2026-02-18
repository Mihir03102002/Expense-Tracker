<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Account List | Expense Tracker</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        background-color: #f4f6f9;
    }

    /* Sidebar */
    .sidebar {
        height: 100vh;
        background-color: #212529;
        color: #fff;
        position: fixed;
        width: 240px;
        top: 0;
        left: 0;
    }

    .sidebar a {
        color: #adb5bd;
        text-decoration: none;
        padding: 12px 20px;
        display: block;
    }

    .sidebar a:hover {
        background-color: #343a40;
        color: #fff;
    }

    .sidebar .active {
        background-color: #0d6efd;
        color: #fff;
    }

    /* Main content */
    .content {
        margin-left: 240px;
        margin-top:100px;
        padding: 20px;
    }

    footer {
        background-color: #fff;
        border-top: 1px solid #dee2e6;
        padding: 10px;
        text-align: center;
        margin-top: 30px;
    }
</style>


<jsp:include page="AdminCSS.jsp"></jsp:include>

</head>

<body>

<!-- ================= HEADER ================= -->
<jsp:include page="AdminHeader.jsp"></jsp:include>

<!-- ================= SIDEBAR ================= -->
<jsp:include page="AdminLeftSidebar.jsp"></jsp:include>

<!-- ================= MAIN CONTENT ================= -->
<div class="content">

    <!-- Page Title -->
    <h3>Account List</h3>
    <p class="text-muted">View and manage all accounts</p>

    <!-- Account Table Card -->
    <div class="card shadow-sm">

        <!-- Card Header -->
        <div class="card-header bg-dark text-white">
            All Accounts
        </div>

        <!-- Card Body -->
        <div class="card-body">

            <table class="table table-bordered table-hover text-center">

                <!-- Table Header -->
                <thead class="table-light">
                    <tr>
                        <th>ID</th>
                        <th>Account Title</th>
                        <th>Account Type</th>
                        <th>Balance</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <!-- Table Body -->
                <tbody>

                    <!-- If no accounts available -->
                    <c:if test="${empty accounts}">
                        <tr>
                            <td colspan="5">No accounts found</td>
                        </tr>
                    </c:if>

                    <!-- Loop through account list -->
                    <c:forEach var="a" items="${accounts}">
                        <tr>
                            <td>${a.accountId}</td>
                            <td>${a.title}</td>
                            <td>${a.accountType}</td>
                            <td>₹ ${a.amount}</td>

                            <!-- Delete Button -->
                            <td>
                                <a href="/account/delete?accountId=${a.accountId}"
                                   class="btn btn-danger btn-sm"
                                   onclick="return confirm('Are you sure you want to delete this account?')">
                                    Delete
                                </a>
                            </td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>

            <!-- Back Button -->
            <div class="text-end mt-3">
                <a href="/account" class="btn btn-success">
                    ← Back to Account Page
                </a>
            </div>

        </div>
    </div>

    <!-- ================= FOOTER ================= -->
    <footer>
         <jsp:include page="AdminFooter.jsp"></jsp:include>
    </footer>

</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
