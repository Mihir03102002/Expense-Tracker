<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Category Management | Expense Tracker</title>

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
        margin-top: 100px;   /* Added like Account.jsp */
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

    <h3>Category Management</h3>
    <p class="text-muted">Add and manage expense categories</p>

    <!-- ================= ADD CATEGORY FORM ================= -->
    <div class="card shadow-sm mb-4">
        <div class="card-header bg-primary text-white">
            Add New Category
        </div>

        <div class="card-body">
            <form action="category" method="post">
                <div class="row">

                    <div class="col-md-6">
                        <label class="form-label">Category Name</label>
                        <input type="text" name="categoryName"
                               class="form-control"
                               placeholder="Enter category name"
                               required>
                    </div>

                    <div class="col-md-3 d-flex align-items-end">
                        <button type="submit" class="btn btn-success">
                            <i class="bi bi-plus-circle"></i> Add Category
                        </button>
                    </div>

                </div>
            </form>
        </div>
    </div>

    <!-- ================= CATEGORY TABLE ================= -->
    <div class="card shadow-sm">
        <div class="card-header bg-dark text-white">
            Category List
        </div>

        <div class="card-body">
            <table class="table table-bordered text-center">
                <thead class="table-light">
                    <tr>
                        <th>ID</th>
                        <th>Category Name</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>

                    <!-- If Empty -->
                    <c:if test="${empty listCategory}">
                        <tr>
                            <td colspan="3" class="text-muted">
                                No categories found
                            </td>
                        </tr>
                    </c:if>

                    <!-- Loop Categories -->
                    <c:forEach var="cat" items="${listCategory}">
                        <tr>
                            <td>${cat.categoryId}</td>
                            <td>${cat.categoryName}</td>
                            <td>
                                <a href="deleteCategory?categoryId=${cat.categoryId}"
                                   class="btn btn-sm btn-danger"
                                   onclick="return confirm('Are you sure you want to delete this category?')">
                                    <i class="bi bi-trash"></i> Delete
                                </a>
                            </td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
        </div>
    </div>

    <!-- ================= FOOTER ================= -->
    <jsp:include page="AdminFooter.jsp"></jsp:include>

</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
