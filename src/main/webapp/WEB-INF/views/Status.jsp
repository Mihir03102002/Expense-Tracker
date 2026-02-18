<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Status | Admin</title>

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
                        <h3>Status Management</h3>
                        <p class="text-muted">
                            Manage payment status (Paid / Unpaid / Partial)
                        </p>
                    </div>
                </div>

                <!-- ADD STATUS FORM -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="card shadow-sm mb-4">

                            <div class="card-header bg-primary text-white">
                                Add New Status
                            </div>

                            <div class="card-body">
                                <form action="status" method="post">
                                    <div class="row">

                                        <div class="col-md-6">
                                            <label class="form-label">Status Name</label>
                                            <input type="text"
                                                   name="status"
                                                   class="form-control"
                                                   placeholder="paid / unpaid / partialPaid"
                                                   required>
                                        </div>

                                        <div class="col-md-3 d-flex align-items-end">
                                            <button type="submit"
                                                    class="btn btn-success">
                                                <i class="bi bi-plus-circle"></i>
                                                Add Status
                                            </button>
                                        </div>

                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                </div>

                <!-- STATUS TABLE -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="card shadow-sm">

                            <div class="card-header bg-dark text-white">
                                Status List
                            </div>

                            <div class="card-body">
                                <div class="table-responsive">

                                    <table class="table table-bordered table-hover text-center align-middle">

                                        <thead class="table-light">
                                            <tr>
                                                <th>ID</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>

                                        <tbody>

                                            <c:if test="${empty statuses}">
                                                <tr>
                                                    <td colspan="3">
                                                        No status records found
                                                    </td>
                                                </tr>
                                            </c:if>

                                            <c:forEach var="s" items="${statuses}">
                                                <tr>
                                                    <td>${s.statusId}</td>
                                                    <td>${s.status}</td>
                                                    <td>
                                                        <a href="deleteStatus?statusId=${s.statusId}"
                                                           class="btn btn-danger btn-sm"
                                                           onclick="return confirm('Are you sure?')">
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
