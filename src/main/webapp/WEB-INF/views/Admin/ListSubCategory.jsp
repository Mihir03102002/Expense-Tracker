<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Context Path -->
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>List Sub-Categories | Admin</title>

<!-- Admin CSS -->
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

                <!-- ================= SUBCATEGORY LIST CARD ================= -->
                <div class="row">
                    <div class="col-md-12">

                        <div class="card shadow-sm">

                            <!-- CARD HEADER -->
                            <div class="card-header d-flex justify-content-between align-items-center">

                                <span>Sub-Category List</span>

                                <a href="${ctx}/admin/subCategory"
                                   class="btn btn-success btn-sm">
                                   + Add New Sub-Category
                                </a>

                            </div>

                            <!-- CARD BODY -->
                            <div class="card-body">

                                <div class="table-responsive">

                                    <table class="table table-bordered table-hover text-center align-middle">

                                        <!-- TABLE HEADER -->
                                        <thead class="table-primary">
                                            <tr>
                                                <th>#</th>
                                                <th>Sub-Category Name</th>
                                                <th>Category</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>

                                        <!-- TABLE BODY -->
                                        <tbody>

                                            <!-- IF EMPTY -->
                                            <c:if test="${empty subCategories}">
                                                <tr>
                                                    <td colspan="4">No sub-categories found</td>
                                                </tr>
                                            </c:if>

                                            <!-- LOOP DATA -->
                                            <c:forEach var="s" items="${subCategories}" varStatus="i">

                                                <tr>

                                                    <td>${i.count}</td>

                                                    <td>${s.subCategoryName}</td>

                                                    <td>${s.category.categoryName}</td>

                                                    <td>

                                                        <!-- EDIT BUTTON -->
                                                        <a href="${ctx}/admin/editSubCategory?subCategoryId=${s.subCategoryId}"
                                                           class="btn btn-warning btn-sm">
                                                           Edit
                                                        </a>

                                                        <!-- DELETE BUTTON -->
                                                        <a href="${ctx}/admin/deleteSubCategory?subCategoryId=${s.subCategoryId}"
                                                           class="btn btn-danger btn-sm"
                                                           onclick="return confirm('Are you sure you want to delete this sub-category?')">
                                                           Delete
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
                </div>

            </div>

            <!-- ================= FOOTER ================= -->
            <jsp:include page="AdminFooter.jsp"></jsp:include>

        </div>

    </div>

</div>

<!-- ================= ADMIN JS ================= -->
<jsp:include page="AdminJS.jsp" />

</body>
</html>