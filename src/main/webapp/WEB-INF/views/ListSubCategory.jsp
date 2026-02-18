<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Sub-Categories | Admin</title>

<!-- Common Admin CSS -->
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

                <!-- PAGE TITLE -->
                <div class="row mb-4">
                    <div class="col-md-12">
                        <h3>All Sub-Categories</h3>
                    </div>
                </div>

                <!-- CARD -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="card shadow-sm">

                            <div class="card-header d-flex justify-content-between align-items-center">
                                <span>Sub-Category List</span>
                                <a href="/subCategory" class="btn btn-success btn-sm">
                                    + Add New Sub-Category
                                </a>
                            </div>

                            <div class="card-body">
                                <div class="table-responsive">

                                    <table class="table table-bordered table-hover text-center align-middle">

                                        <thead class="table-primary">
                                            <tr>
                                                <th>#</th>
                                                <th>Sub-Category Name</th>
                                                <th>Category</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>

                                        <tbody>

                                            <c:choose>

                                                <c:when test="${empty subCategories}">
                                                    <tr>
                                                        <td colspan="4">No sub-categories found</td>
                                                    </tr>
                                                </c:when>

                                                <c:otherwise>
                                                    <c:forEach var="s" items="${subCategories}" varStatus="i">
                                                        <tr>
                                                            <td>${i.count}</td>
                                                            <td>${s.subCategoryName}</td>
                                                            <td>${s.category.categoryName}</td>
                                                            <td>

                                                                <a href="/admin/subcategory/edit?subCategoryId=${s.subCategoryId}"
                                                                   class="btn btn-warning btn-sm">
                                                                    Edit
                                                                </a>

                                                                <a href="/deleteSubCategory?subCategoryId=${s.subCategoryId}"
                                                                   class="btn btn-danger btn-sm"
                                                                   onclick="return confirm('Are you sure?')">
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

            </div>

            <!-- FOOTER -->
            <jsp:include page="AdminFooter.jsp"></jsp:include>

        </div>

    </div>

</div>

<!-- ADMIN JS -->
<jsp:include page="AdminJS.jsp" />

</body>
</html>
