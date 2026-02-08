<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Status | Admin</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

<style>
    body {
        background-color: #f4f6f9;
    }

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

    .content {
        margin-left: 240px;
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

    <a href="/dashboard">
        <i class="bi bi-speedometer2 me-2"></i> Dashboard
    </a>

    <a href="/category">
        <i class="bi bi-tags me-2"></i> Category
    </a>

    <a href="/subcategory">
        <i class="bi bi-diagram-3 me-2"></i> Sub Category
    </a>

    <a href="/vendor">
        <i class="bi bi-shop me-2"></i> Vendor
    </a>

    <a href="/status" class="active">
        <i class="bi bi-check2-circle me-2"></i> Status
    </a>

    <a href="/admin/expenses">
        <i class="bi bi-wallet2 me-2"></i> Expenses
    </a>

    <a href="/admin/income">
        <i class="bi bi-cash-stack me-2"></i> Income
    </a>
</div>

<!-- ================= MAIN CONTENT ================= -->
<div class="content">

    <h3>Status Management</h3>
    <p class="text-muted">Manage payment status (Paid / Unpaid / Partial)</p>

    <!-- ================= ADD STATUS FORM ================= -->
    <div class="card shadow-sm mb-4">
        <div class="card-header bg-primary text-white">
            Add New Status
        </div>

        <div class="card-body">
            <form action="/admin/status/save" method="post">
                <div class="row">
                    <div class="col-md-6">
                        <label class="form-label">Status Name</label>
                        <input type="text" name="status"
                               class="form-control"
                               placeholder="paid / unpaid / partialPaid"
                               required>
                    </div>

                    <div class="col-md-3 d-flex align-items-end">
                        <button type="submit" class="btn btn-success">
                            <i class="bi bi-plus-circle"></i> Add Status
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <!-- ================= STATUS TABLE ================= -->
    <div class="card shadow-sm">
        <div class="card-header bg-dark text-white">
            Status List
        </div>

        <div class="card-body">
            <table class="table table-bordered table-hover text-center">
                <thead class="table-light">
                    <tr>
                        <th>ID</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach var="s" items="${statuses}">
                        <tr>
                            <td>${s.statusId}</td>
                            <td>${s.status}</td>
                            <td>
                                <a href="/admin/status/delete/${s.statusId}"
                                   class="btn btn-sm btn-danger"
                                   onclick="return confirm('Are you sure?')">
                                    <i class="bi bi-trash"></i> Delete
                                </a>
                            </td>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty statuses}">
                        <tr>
                            <td colspan="3" class="text-muted">
                                No status records found
                            </td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>

    <!-- ================= FOOTER ================= -->
    <footer>
        © 2026 Expense Tracker | Status Master Module
    </footer>

</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
