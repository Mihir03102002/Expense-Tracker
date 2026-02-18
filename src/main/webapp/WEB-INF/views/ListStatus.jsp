<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Status | Admin</title>

<!-- Common Admin CSS -->
<jsp:include page="AdminCSS.jsp"></jsp:include>

</head>

<body>

<div class="container-scroller">

    <!-- HEADER -->
    <jsp:include page="AdminHeader.jsp"></jsp:include>

    <div class="container-fluid page-body-wrapper">

        <!-- SIDEBAR -->
        <jsp:include page="AdminLeftSidebar.jsp"></jsp:include>

        <!-- MAIN PANEL -->
        <div class="main-panel">
            <div class="content-wrapper">

                <!-- PAGE TITLE -->
                <div class="row mb-4">
                    <div class="col-md-12">
                        <h3>All Status Records</h3>
                    </div>
                </div>

                <!-- CARD -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="card shadow-sm">

                            <div class="card-header d-flex justify-content-between align-items-center">
                                <span>Status List</span>
                                <a href="/status" class="btn btn-success btn-sm">
                                    + Add New Status
                                </a>
                            </div>

                            <div class="card-body">
                                <div class="table-responsive">

                                    <table class="table table-bordered table-hover text-center align-middle">

                                        <thead class="table-light">
                                            <tr>
                                                <th>#</th>
                                                <th>Status Name</th>
                                                <th>Preview</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>

                                        <tbody>

                                            <c:if test="${empty statuses}">
                                                <tr>
                                                    <td colspan="4">
                                                        No status records found
                                                    </td>
                                                </tr>
                                            </c:if>

                                            <c:forEach var="s" items="${statuses}" varStatus="i">
                                                <tr>
                                                    <td>${i.count}</td>
                                                    <td>${s.status}</td>

                                                    <!-- Badge Preview -->
                                                    <td>
                                                        <span class="badge 
                                                            ${fn:toUpperCase(s.status) == 'PAID' ? 'bg-success' :
                                                              fn:toUpperCase(s.status) == 'UNPAID' ? 'bg-danger' :
                                                              'bg-warning text-dark'}">
                                                            ${s.status}
                                                        </span>
                                                    </td>

                                                    <td>
                                                        <a href="/admin/status/edit?statusId=${s.statusId}"
                                                           class="btn btn-warning btn-sm">
                                                            Edit
                                                        </a>

                                                        <a href="deleteStatus?statusId=${s.statusId}"
                                                           class="btn btn-danger btn-sm"
                                                           onclick="return confirm('Are you sure you want to delete this status?')">
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
