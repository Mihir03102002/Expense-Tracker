<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Category | Expense Tracker</title>

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
                        <h3>Category List</h3>
                        <p class="text-muted">Manage all categories</p>
                    </div>
                </div>

                <!-- ================= CATEGORY TABLE CARD ================= -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="card shadow-sm">

                            <div class="card-header bg-dark text-white">
                                <i class="bi bi-list-ul me-2"></i> Category List
                            </div>

                            <div class="card-body">
                                <div class="table-responsive">

                                    <table class="table table-bordered table-hover text-center align-middle">

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

                                            <!-- Loop Data -->
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
