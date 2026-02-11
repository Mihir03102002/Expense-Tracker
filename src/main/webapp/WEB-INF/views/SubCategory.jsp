<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Sub Categories | Admin</title>

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

	<jsp:include page="AdminHeader.jsp"></jsp:include>

<!-- ================= SIDEBAR ================= -->

	<jsp:include page="AdminSidebar.jsp"></jsp:include>

<!-- ================= MAIN CONTENT ================= -->
<div class="content">

    <h3>Sub-Category Management</h3>
    <p class="text-muted">Add and manage sub-categories</p>

    <!-- ================= ADD SUB CATEGORY FORM ================= -->
    <div class="card shadow-sm mb-4">
        <div class="card-header bg-primary text-white">
            Add New Sub-Category
        </div>

        <div class="card-body">
            <form action="subCategory" method="post">
                <div class="row">

                    <div class="col-md-4">
                        <label class="form-label">Category</label>
                        <select name="categoryId" class="form-select" required>
                            <option value="">-- Select Category --</option>
                            <c:forEach var="cat" items="${categories}">
                                <option value="${cat.categoryId}">
                                    ${cat.categoryName}
                                </option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="col-md-4">
                        <label class="form-label">Sub-Category Name</label>
                        <input type="text" name="subCategoryName"
                               class="form-control"
                               placeholder="Enter sub-category name"
                               required>
                    </div>

                    <div class="col-md-3 d-flex align-items-end">
                        <button type="submit" class="btn btn-success">
                            <i class="bi bi-plus-circle"></i> Add Sub-Category
                        </button>
                    </div>

                </div>
            </form>
        </div>
    </div>

    <!-- ================= SUB CATEGORY TABLE ================= -->
    <div class="card shadow-sm">
        <div class="card-header bg-dark text-white">
            Sub-Category List
        </div>

        <div class="card-body">
            <table class="table table-bordered table-hover text-center">
                <thead class="table-light">
                    <tr>
                        <th>ID</th>
                        <th>Sub-Category</th>
                        <th>Category</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach var="sub" items="${subCategories}">
                        <tr>
                            <td>${sub.subCategoryId}</td>
                            <td>${sub.subCategoryName}</td>
                            <td>${sub.category.categoryName}</td>
                            <td>
                                <a href="subCategory${sub.subCategoryId}"
                                   class="btn btn-sm btn-danger"
                                   onclick="return confirm('Are you sure?')">
                                    <i class="bi bi-trash"></i> Delete
                                </a>
                            </td>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty subCategories}">
                        <tr>
                            <td colspan="4" class="text-muted">
                                No sub-categories found
                            </td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>

    <!-- ================= FOOTER ================= -->
    <footer>
        © 2026 Expense Tracker | Sub-Category Module
    </footer>

</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
