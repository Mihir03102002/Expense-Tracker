<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>User Management | Expense Tracker</title>

<jsp:include page="AdminCSS.jsp"/>

</head>

<body>

<div class="container-scroller">

    <jsp:include page="AdminHeader.jsp"/>

    <div class="container-fluid page-body-wrapper">

        <jsp:include page="AdminLeftSidebar.jsp"/>

        <div class="main-panel">

            <div class="content-wrapper">

                <div class="row mb-3">
                    <div class="col-md-12">
                        <h3 class="font-weight-bold">User Management</h3>
                        <p class="text-muted">View and manage registered users</p>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12 grid-margin stretch-card">

                        <div class="card">

                            <div class="card-header bg-dark text-white">
                                User List
                            </div>

                            <div class="card-body">

                                <!-- 🔍 SEARCH BAR -->
                                <form method="get" action="${ctx}/admin/users" class="mb-3 d-flex">

                                    <input type="text"
                                           name="keyword"
                                           value="${keyword}"
                                           placeholder="Search user..."
                                           class="form-control me-2"/>

                                    <button type="submit" class="btn btn-primary">Search</button>

                                </form>

                                <div class="table-responsive">

                                    <table class="table table-bordered text-center">

                                        <thead class="table-light">
                                            <tr>
                                                <th>Sr. No</th>
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

                                            <c:if test="${empty users}">
                                                <tr>
                                                    <td colspan="8">No users found</td>
                                                </tr>
                                            </c:if>

                                            <c:forEach var="u" items="${users}" varStatus="status">

                                                <tr>

                                                    <!-- ✅ SERIAL FIX -->
                                                    <td>${currentPage * 10 + status.index + 1}</td>

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
                                                        <a href="viewUser?userId=${u.userId}" class="btn btn-info btn-sm">View</a>
                                                        <a href="editUser?userId=${u.userId}" class="btn btn-warning btn-sm">Edit</a>
                                                        <a href="deleteUser?userId=${u.userId}"
                                                           class="btn btn-danger btn-sm"
                                                           onclick="return confirm('Are you sure?')">Delete</a>
                                                    </td>

                                                </tr>

                                            </c:forEach>

                                        </tbody>

                                    </table>

                                </div>

                                <!-- 🔢 PAGINATION -->
                                <c:if test="${totalPages > 1}">
                                    <nav class="mt-3">
                                        <ul class="pagination justify-content-center">

                                            <li class="page-item ${currentPage == 0 ? 'disabled' : ''}">
                                                <a class="page-link"
                                                   href="${ctx}/admin/users?page=${currentPage - 1}&keyword=${keyword}">
                                                    Previous
                                                </a>
                                            </li>

                                            <c:forEach begin="0" end="${totalPages - 1}" var="i">
                                                <li class="page-item ${i == currentPage ? 'active' : ''}">
                                                    <a class="page-link"
                                                       href="${ctx}/admin/users?page=${i}&keyword=${keyword}">
                                                        ${i + 1}
                                                    </a>
                                                </li>
                                            </c:forEach>

                                            <li class="page-item ${currentPage == totalPages - 1 ? 'disabled' : ''}">
                                                <a class="page-link"
                                                   href="${ctx}/admin/users?page=${currentPage + 1}&keyword=${keyword}">
                                                    Next
                                                </a>
                                            </li>

                                        </ul>
                                    </nav>
                                </c:if>

                            </div>

                        </div>

                    </div>
                </div>

            </div>

            <jsp:include page="AdminFooter.jsp"/>

        </div>

    </div>

</div>

<jsp:include page="AdminJS.jsp"/>

</body>
</html>