<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Sub Categories | Admin</title>

<!-- ================= ADMIN CSS ================= -->
<jsp:include page="AdminCSS.jsp"></jsp:include>

</head>

<body>

<div class="container-scroller">

    <!-- ================= HEADER ================= -->
    <jsp:include page="AdminHeader.jsp"></jsp:include>

    <div class="container-fluid page-body-wrapper">

        <!-- ================= SIDEBAR ================= -->
        <jsp:include page="AdminLeftSidebar.jsp"></jsp:include>

        <!-- ================= MAIN PANEL ================= -->
        <div class="main-panel">
            <div class="content-wrapper">

                <!-- ================= PAGE TITLE ================= -->
                <div class="row mb-4">
                    <div class="col-md-12">
                        <h3>Sub-Category Management</h3>
                        <p class="text-muted">Add and manage sub-categories</p>
                    </div>
                </div>

                <!-- ================= ADD SUB CATEGORY FORM ================= -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="card shadow-sm mb-4">
                            <div class="card-header bg-primary text-white">
                                Add New Sub-Category
                            </div>

                            <div class="card-body">
                                <form action="subCategory" method="post">
                                    <div class="row g-3">

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
                                            <input type="text"
                                                   name="subCategoryName"
                                                   class="form-control"
                                                   placeholder="Enter sub-category name"
                                                   required>
                                        </div>

                                        <div class="col-md-3 d-flex align-items-end">
                                            <button type="submit" class="btn btn-success w-100">
                                                <i class="bi bi-plus-circle"></i> Add Sub-Category
                                            </button>
                                        </div>

                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- ================= SUB CATEGORY TABLE ================= -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="card shadow-sm">
                            <div class="card-header bg-dark text-white">
                                Sub-Category List
                            </div>

                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover text-center align-middle">
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
                                                        <a href="deleteSubCategory?subCategoryId=${sub.subCategoryId}"
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
                        </div>
                    </div>
                </div>

            </div>

            <!-- ================= FOOTER ================= -->
            <jsp:include page="AdminFooter.jsp"></jsp:include>

        </div>

    </div>

</div>

<jsp:include page="AdminJS.jsp" />

</body>
</html>


