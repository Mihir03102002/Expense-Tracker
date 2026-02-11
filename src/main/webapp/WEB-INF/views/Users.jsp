<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Users | Admin</title>

    <!-- Bootstrap & Font Awesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">

    <style>
        body { background:#f4f6f9; }
        .sidebar {
            height:100vh;
            width:240px;
            background:#212529;
            position:fixed;
        }
        .sidebar a {
            color:white;
            padding:12px 20px;
            display:block;
            text-decoration:none;
        }
        .sidebar a:hover {
            background:#0d6efd;
        }
        .content {
            margin-left:240px;
            padding:20px;
        }
    </style>
</head>

<body>


<!-- ================= HEADER ================= -->

	<jsp:include page="AdminHeader.jsp"></jsp:include>

<!-- ================= SIDEBAR ================= -->

	<jsp:include page="AdminSidebar.jsp"></jsp:include>

<!-- MAIN CONTENT -->
<div class="content">

    <div class="d-flex justify-content-between align-items-center mb-3">
        <h3>Manage Users</h3>
    </div>

    <!-- USERS TABLE -->
    <div class="card shadow-sm">
        <div class="card-header bg-dark text-white">
            Registered Users
        </div>
        <div class="card-body">

            <table class="table table-bordered table-hover text-center">
                <thead class="table-light">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Role</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach var="u" items="${users}">
                        <tr>
                            <td>${u.userId}</td>
                            <td>${u.firstName} ${u.lastName}</td>
                            <td>${u.email}</td>
                            <td>
                                <span class="badge bg-info">${u.role}</span>
                            </td>
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

                            <td>
                                <a href="/admin/user/status/${u.userId}" 
                                   class="btn btn-sm btn-warning">
                                    <i class="fa fa-sync"></i>
                                </a>

                                <a href="/admin/user/delete/${u.userId}" 
                                   class="btn btn-sm btn-danger"
                                   onclick="return confirm('Are you sure?')">
                                    <i class="fa fa-trash"></i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>

            </table>

        </div>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>