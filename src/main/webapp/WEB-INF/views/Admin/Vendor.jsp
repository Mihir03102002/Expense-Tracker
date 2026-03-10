<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Vendors | Admin</title>

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
                        <h3>Vendor Management</h3>
                        <p class="text-muted">Add and manage vendors</p>
                    </div>
                </div>

                <!-- ADD VENDOR FORM -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="card shadow-sm mb-4">
                            <div class="card-header bg-primary text-white">
                                Add New Vendor
                            </div>

                            <div class="card-body">
                                <form action="vendor" method="post">
                                    <div class="row g-3 align-items-end">

                                        <div class="col-md-6">
                                            <label class="form-label">Vendor Name</label>
                                            <input type="text"
                                                   name="vendorName"
                                                   class="form-control"
                                                   placeholder="Enter vendor name"
                                                   required>
                                        </div>

                                        <div class="col-md-3">
                                            <button type="submit" class="btn btn-success w-100">
                                                <i class="bi bi-plus-circle"></i> Add Vendor
                                            </button>
                                        </div>

                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- VENDOR TABLE -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="card shadow-sm">
                            <div class="card-header bg-dark text-white">
                                Vendor List
                            </div>

                            <div class="card-body">
                                <div class="table-responsive">

                                    <table class="table table-bordered table-hover text-center align-middle">

                                        <thead class="table-light">
                                            <tr>
                                                <th>ID</th>
                                                <th>Vendor Name</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>

                                        <tbody>

                                            <c:if test="${empty vendors}">
                                                <tr>
                                                    <td colspan="3" class="text-muted">
                                                        No vendors found
                                                    </td>
                                                </tr>
                                            </c:if>

                                            <c:forEach var="v" items="${vendors}">
                                                <tr>
                                                    <td>${v.vendorId}</td>
                                                    <td>${v.vendorName}</td>
                                                    <td>
                                                        <a href="deleteVendor?vendorId=${v.vendorId}"
                                                           class="btn btn-sm btn-danger"
                                                           onclick="return confirm('Are you sure?')">
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

            <!-- FOOTER -->
            <jsp:include page="AdminFooter.jsp"></jsp:include>

        </div>

    </div>

</div>

<!-- ADMIN JS -->
<jsp:include page="AdminJS.jsp" />

</body>
</html>
