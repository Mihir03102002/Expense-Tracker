<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard | Expense Tracker</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

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
        transition: 0.3s;
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
        padding: 20px;
    }

    /* Footer */
    footer {
        background-color: #fff;
        border-top: 1px solid #dee2e6;
        padding: 10px;
        text-align: center;
        margin-top: 30px;
    }
</style>
</head>

<body>

<!-- ================= HEADER ================= -->
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
    <div class="container-fluid">
        <span class="navbar-brand fw-bold">Admin Panel</span>

        <div class="ms-auto">
            <span class="me-3">Welcome, Admin</span>
            <a href="/logout" class="btn btn-sm btn-outline-danger">
                <i class="bi bi-box-arrow-right"></i> Logout
            </a>
        </div>
    </div>
</nav>

<!-- ================= SIDEBAR ================= -->
<div class="sidebar">
    <h5 class="text-center py-3 border-bottom">Dashboard</h5>

    <a href="#" class="active">
        <i class="bi bi-speedometer2 me-2"></i> Dashboard
    </a>

    <a href="category">
        <i class="bi bi-tags me-2"></i> Category
    </a>

    <a href="users">
        <i class="bi bi-people me-2"></i> Users
    </a>

    <a href="expenses">
        <i class="bi bi-wallet2 me-2"></i> Expenses
    </a>

    <a href="income">
        <i class="bi bi-cash-stack me-2"></i> Income
    </a>

    <a href="settings">
        <i class="bi bi-gear me-2"></i> Settings
    </a>
</div>

<!-- ================= MAIN CONTENT ================= -->
<div class="content">

    <h3>Dashboard</h3>
    <p class="text-muted">Welcome to the admin dashboard.</p>

    <!-- ================= STAT CARDS ================= -->
    <div class="row g-3">

        <div class="col-md-3">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h6>Total Users</h6>
                    <h4>${totalUsers}</h4>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h6>Total Categories</h6>
                    <h4>${totalCategories}</h4>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h6>Total Expenses</h6>
                    <h4>₹ ${totalExpense}</h4>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h6>Total Income</h6>
                    <h4>₹ ${totalIncome}</h4>
                </div>
            </div>
        </div>

    </div>

    <!-- ================= RECENT EXPENSES TABLE ================= -->
    <div class="card shadow-sm mt-4">
        <div class="card-header bg-dark text-white">
            Recent Expenses
        </div>

        <div class="card-body">
            <table class="table table-bordered table-hover text-center">
                <thead class="table-light">
                    <tr>
                        <th>Title</th>
                        <th>User</th>
                        <th>Amount</th>
                        <th>Status</th>
                        <th>Date</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach var="exp" items="${recentExpenses}">
                        <tr>
                            <td>${exp.title}</td>
                            <td>${exp.user.firstName}</td>
                            <td>₹ ${exp.amount}</td>
                            <td>
                                <span class="badge bg-success">
                                    ${exp.status.status}
                                </span>
                            </td>
                            <td>${exp.date}</td>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty recentExpenses}">
                        <tr>
                            <td colspan="5" class="text-muted">
                                No records found
                            </td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>

    <!-- ================= FOOTER ================= -->
    <footer>
        © 2026 Expense Tracker Admin Dashboard | Designed for Academic Project
    </footer>

</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>