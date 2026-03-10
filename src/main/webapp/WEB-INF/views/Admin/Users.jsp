<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Management | Expense Tracker</title>

<!-- Bootstrap CSS -->  
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

<style>
    body {
        background-color: #f4f6f9;
    }

    /* Sidebar */
    .sidebar {
        height: 100vh;
        background-color: #212529;
        color: #fff;
        position: fixed;
        width: 240px;
        top: 0;
        left: 0;
    }

    .sidebar a {
        color: #adb5bd;
        text-decoration: none;
        padding: 12px 20px;
        display: block;
    }

    .sidebar a:hover {
        background-color: #343a40;
        color: #fff;
    }

    .sidebar .active {
        background-color: #0d6efd;
        color: #fff;
    }

    /* Main content */
    .content {
        margin-left: 240px;
        margin-top: 100px;
        padding: 20px;
    }

    footer {
        background-color: #fff;
        border-top: 1px solid #dee2e6;
        padding: 10px;
        text-align: center;
        margin-top: 30px;
    }
</style>

<jsp:include page="AdminCSS.jsp"></jsp:include>

</head>

<body>

<!-- ================= HEADER ================= -->
<jsp:include page="AdminHeader.jsp"></jsp:include>

<!-- ================= SIDEBAR ================= -->
<jsp:include page="AdminLeftSidebar.jsp"></jsp:include>

<!-- ================= MAIN CONTENT ================= -->
<div class="content">

    <h3>User Management</h3>
    <p class="text-muted">View and manage registered users</p>

    <!-- ================= USER TABLE ================= -->
    <div class="card shadow-sm">
        <div class="card-header bg-dark text-white">
            User List
        </div>

        <div class="card-body">
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

                    <!-- If No Users -->
                    <c:if test="${empty users}">
                        <tr>
                            <td colspan="8">No users found</td>
                        </tr>
                    </c:if>

                    <!-- Loop Users -->
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
                                        <span class="badge bg-success">Active</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge bg-danger">Inactive</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>

                            <td>${u.createdAt}</td>

                               <td>
								    <!-- VIEW BUTTON -->
								    <a href="viewUser?userId=${u.userId}"
								       class="btn btn-sm btn-info text-white">
								       <i class="bi bi-eye"></i> View
								    </a>
								
								    <!-- EDIT BUTTON -->
								    <a href="editUser?userId=${u.userId}"
								       class="btn btn-sm btn-warning text-dark">
								       <i class="bi bi-pencil"></i> Edit
								    </a>
								
								    <!-- DELETE BUTTON -->
								    <a href="deleteUser?userId=${u.userId}"
								       class="btn btn-sm btn-danger"
								       onclick="return confirm('Are you sure you want to delete this user?')">
								       <i class="bi bi-trash"></i> Delete
								    </a>
								</td>    
                               
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
        </div>
    </div>

    <!-- ================= FOOTER ================= -->
    <jsp:include page="AdminFooter.jsp"></jsp:include>

</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
