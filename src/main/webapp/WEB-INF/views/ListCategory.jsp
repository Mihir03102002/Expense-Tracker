<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Categories | Admin</title>

<!-- Common Admin CSS -->
<jsp:include page="AdminCSS.jsp"></jsp:include>

<style>
body {
    background-color: #f8f9fa;
}

.card {
    margin-top: 80px;
    border-radius: 12px;
}

.container {
    width: 95%;
    margin: 20px auto;
    background: #fff;
    padding: 20px;
    border-radius: 6px;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
}

table {
    width: 100%;
    border-collapse: collapse;
}

th, td {
    padding: 10px;
    border: 1px solid #ddd;
    text-align: center;
}

th {
    background: #007bff;
    color: white;
}

tr:nth-child(even) {
    background: #f9f9f9;
}

.btn {
    padding: 6px 10px;
    text-decoration: none;
    border-radius: 4px;
    font-size: 13px;
    color: white;
}

.btn-add { background: #28a745; }
.btn-edit { background: #ffc107; color: black; }
.btn-delete { background: #dc3545; }
</style>

</head>

<body>

<!-- ================= HEADER ================= -->
<jsp:include page="AdminHeader.jsp"></jsp:include>

<!-- ================= SIDEBAR ================= -->
<jsp:include page="AdminSidebar.jsp"></jsp:include>

<!-- ================= MAIN CONTENT ================= -->
<div class="content">
    <div class="row justify-content-center">
        <div class="col-md-12 col-lg-10">
            <div class="card shadow">
                <div class="card-body p-4">

                    <h4 class="text-center mb-4">All Categories</h4>

                    <!-- ADD CATEGORY BUTTON -->
                    <div class="mb-3 text-end">
                        <a href="/category" class="btn btn-add">
                            + Add New Category
                        </a>
                    </div>

                    <table>
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Category Name</th>
                                <th>Actions</th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:choose>

                                <c:when test="${empty listCategory}">
                                    <tr>
                                        <td colspan="3">No categories found</td>
                                    </tr>
                                </c:when>

                                <c:otherwise>
                                    <c:forEach var="c" items="${listCategory}" varStatus="i">
                                        <tr>
                                            <td>${i.count}</td>
                                            <td>${c.categoryName}</td>
                                            <td>
                                                <a href="Category=${c.categoryId}"
                                                   class="btn btn-edit">
                                                    Edit
                                                </a>

                                                <a href="deleteCategory?categoryId=${c.categoryId}"
                                                   class="btn btn-delete"
                                                   onclick="return confirm('Are you sure you want to delete this category?')">
                                                    Delete
                                                </a>
                                            </td>
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
</div>

<!-- ================= FOOTER ================= -->
<jsp:include page="AdminFooter.jsp"></jsp:include>

</body>
</html>
