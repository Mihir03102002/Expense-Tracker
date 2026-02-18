<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Vendors | Admin</title>

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
                        <h3>All Vendors</h3>
                    </div>
                </div>

                <!-- CARD -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="card shadow-sm">

                            <div class="card-header d-flex justify-content-between align-items-center">
                                <span>Vendor List</span>
                                <a href="/vendor" class="btn btn-success btn-sm">
                                    + Add New Vendor
                                </a>
                            </div>

                            <div class="card-body">
                                <div class="table-responsive">

                                    <table class="table table-bordered table-hover text-center align-middle">

                                        <thead class="table-light">
                                            <tr>
                                                <th>#</th>
                                                <th>Vendor Name</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>

                                        <tbody>

                                            <c:if test="${empty vendors}">
                                                <tr>
                                                    <td colspan="3">
                                                        No vendors found
                                                    </td>
                                                </tr>
                                            </c:if>

                                            <c:forEach var="v" items="${vendors}" varStatus="i">
                                                <tr>
                                                    <td>${i.count}</td>
                                                    <td>${v.vendorName}</td>
                                                    <td>

                                                        <a href="/admin/vendor/edit?vendorId=${v.vendorId}"
                                                           class="btn btn-warning btn-sm">
                                                            Edit
                                                        </a>

                                                        <a href="deleteVendor?vendorId=${v.vendorId}"
                                                           class="btn btn-danger btn-sm"
                                                           onclick="return confirm('Are you sure you want to delete this vendor?')">
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

            <!-- FOOTER -->
            <jsp:include page="AdminFooter.jsp"></jsp:include>

        </div>

    </div>

</div>

<!-- ADMIN JS -->
<jsp:include page="AdminJS.jsp" />

</body>
</html>
