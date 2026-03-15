<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>User Management | Expense Tracker</title>

<!-- ================= ADMIN CSS ================= -->
<jsp:include page="AdminCSS.jsp"/>

</head>

<body>

<div class="container-scroller">

    <!-- ================= HEADER ================= -->
    <jsp:include page="AdminHeader.jsp"/>

    <div class="container-fluid page-body-wrapper">

        <!-- ================= SIDEBAR ================= -->
        <jsp:include page="AdminLeftSidebar.jsp"/>

        <!-- ================= MAIN PANEL ================= -->
        <div class="main-panel">

            <div class="content-wrapper">

                <!-- PAGE TITLE -->
                <div class="row mb-3">
                    <div class="col-md-12">
                        <h3 class="font-weight-bold">User Management</h3>
                        <p class="text-muted">View and manage registered users</p>
                    </div>
                </div>


                <!-- ================= USER TABLE ================= -->
                <div class="row">
                    <div class="col-md-12 grid-margin stretch-card">

                        <div class="card">

                            <div class="card-header bg-dark text-white">
                                User List
                            </div>

                            <div class="card-body">

                                <div class="table-responsive">

                                    <table class="table table-bordered text-center">

                                        <thead class="table-light">

                                            <tr>
                                                <th>ID</th>
                                                <th>Full Name</th>
                                                <th>Email</th>
                                                <th>Contact</th>
                                                <th>Role</th>
                                                <th>Status</th>
                                                <th>Registered On</th>
                                                <th>Action</th>
                                            </tr>

                                        </thead>

                                        <tbody>

                                            <!-- IF EMPTY -->
                                            <c:if test="${empty users}">
                                                <tr>
                                                    <td colspan="8">No users found</td>
                                                </tr>
                                            </c:if>


                                            <!-- USER LOOP -->
                                            <c:forEach var="u" items="${users}">

                                                <tr>

                                                    <td>${u.userId}</td>

                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${empty u.firstName}">
                                                                N/A
                                                            </c:when>
                                                            <c:otherwise>
                                                                ${u.firstName} ${u.lastName}
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>

                                                    <td>${u.email}</td>

                                                    <td>${u.contactNum}</td>

                                                    <td>${u.role}</td>

                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${u.active}">
                                                                <span class="badge badge-success">Active</span>
                                                            </c:when>

                                                            <c:otherwise>
                                                                <span class="badge badge-danger">Inactive</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>

                                                    <td>${u.createdAt}</td>

                                                    <td>

                                                        <!-- VIEW -->
                                                        <a href="viewUser?userId=${u.userId}"
                                                           class="btn btn-info btn-sm">
                                                            View
                                                        </a>

                                                        <!-- EDIT -->
                                                        <a href="editUser?userId=${u.userId}"
                                                           class="btn btn-warning btn-sm">
                                                            Edit
                                                        </a>

                                                        <!-- DELETE -->
                                                        <a href="deleteUser?userId=${u.userId}"
                                                           class="btn btn-danger btn-sm"
                                                           onclick="return confirm('Are you sure you want to delete this user?')">
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
            <jsp:include page="AdminFooter.jsp"/>

        </div>

    </div>

</div>


<!-- ================= ADMIN JS ================= -->
<jsp:include page="AdminJS.jsp"/>

</body>
</html>