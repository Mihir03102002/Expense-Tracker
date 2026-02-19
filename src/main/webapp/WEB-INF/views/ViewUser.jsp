<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>View User | Admin</title>

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

                <div class="row justify-content-center">
                    <div class="col-md-10 col-lg-8">

                        <div class="card shadow">
                            <div class="card-header bg-primary text-white">
                                <h4 class="mb-0">User Details</h4>
                            </div>

                            <div class="card-body">

                                <table class="table table-bordered table-hover">
                                    <tr>
                                        <th width="30%">User ID</th>
                                        <td>${user.userId}</td>
                                    </tr>

                                    <tr>
                                        <th>First Name</th>
                                        <td>${user.firstName}</td>
                                    </tr>

                                    <tr>
                                        <th>Last Name</th>
                                        <td>${user.lastName}</td>
                                    </tr>

                                    <tr>
                                        <th>Email</th>
                                        <td>${user.email}</td>
                                    </tr>

                                    <tr>
                                        <th>Contact Number</th>
                                        <td>${user.contactNum}</td>
                                    </tr>

                                    <tr>
                                        <th>Role</th>
                                        <td>
                                            <span class="badge bg-info text-dark">
                                                ${user.role}
                                            </span>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th>Status</th>
                                        <td>
                                            <c:choose>
                                                <c:when test="${user.active == true}">
                                                    <span class="badge bg-success">Active</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge bg-danger">Inactive</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th>Registered On</th>
                                        <td>${user.createdAt}</td>
                                    </tr>
                                </table>

                                <div class="text-end mt-3">
                                    <a href="${pageContext.request.contextPath}/users" class="btn btn-secondary">
                                        Back to List
                                    </a>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>

            </div> <!-- content-wrapper -->

            <!-- ================= FOOTER ================= -->
            <jsp:include page="AdminFooter.jsp"></jsp:include>

        </div> <!-- main-panel -->

    </div> <!-- page-body-wrapper -->

</div> <!-- container-scroller -->

<!-- ================= COMMON JS ================= -->
<jsp:include page="AdminJS.jsp"></jsp:include>

</body>
</html>