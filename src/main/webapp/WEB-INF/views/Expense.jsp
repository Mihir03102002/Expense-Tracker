<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Expense | Expense Tracker</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

<style>
    body { background-color:#f4f6f9; }

    .sidebar {
        height:100vh;
        background:#0d6efd;
        color:#fff;
        position:fixed;
        width:240px;
    }

    .sidebar a {
        color:#e9ecef;
        text-decoration:none;
        padding:12px 20px;
        display:block;
    }

    .sidebar a:hover {
        background:#084298;
        color:#fff;
    }

    .sidebar .active {
        background:#052c65;
    }

    .content {
        margin-left:240px;
        padding:20px;
    }

    footer {
        background:#fff;
        border-top:1px solid #dee2e6;
        padding:10px;
        text-align:center;
        margin-top:30px;
    }
</style>
</head>

<body>

<!-- ================= HEADER ================= -->

	<jsp:include page="AdminHeader.jsp"></jsp:include>

<!-- ================= SIDEBAR ================= -->

	<jsp:include page="AdminSidebar.jsp"></jsp:include>

<!-- ================= MAIN CONTENT ================= -->
<div class="content">

    <h3>Add Expense</h3>
    <p class="text-muted">Record your daily expenses</p>

    <!-- ================= ADD EXPENSE FORM ================= -->
    <div class="card shadow-sm">
        <div class="card-header bg-primary text-white">
            Expense Details
        </div>

        <div class="card-body">
            <form action="/expense/save" method="post">

                <div class="row mb-3">
                    <div class="col-md-4">
                        <label class="form-label">Title</label>
                        <input type="text" name="title" class="form-control"
                               placeholder="Expense title" required>
                    </div>

                    <div class="col-md-4">
                        <label class="form-label">Date</label>
                        <input type="date" name="date" class="form-control" required>
                    </div>

                    <div class="col-md-4">
                        <label class="form-label">Amount</label>
                        <input type="number" name="amount" step="0.01"
                               class="form-control" required>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-4">
                        <label class="form-label">Category</label>
                        <select name="categoryId" class="form-select" required>
                            <option value="">-- Select Category --</option>
                            <c:forEach var="c" items="${categories}">
                                <option value="${c.categoryId}">
                                    ${c.categoryName}
                                </option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="col-md-4">
                        <label class="form-label">Sub Category</label>
                        <select name="subCategoryId" class="form-select" required>
                            <option value="">-- Select Sub Category --</option>
                            <c:forEach var="s" items="${subCategories}">
                                <option value="${s.subCategoryId}">
                                    ${s.subCategoryName}
                                </option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="col-md-4">
                        <label class="form-label">Vendor</label>
                        <select name="vendorId" class="form-select" required>
                            <option value="">-- Select Vendor --</option>
                            <c:forEach var="v" items="${vendors}">
                                <option value="${v.vendorId}">
                                    ${v.vendorName}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-4">
                        <label class="form-label">Account</label>
                        <select name="accountId" class="form-select" required>
                            <option value="">-- Select Account --</option>
                            <c:forEach var="a" items="${accounts}">
                                <option value="${a.accountId}">
                                    ${a.title}
                                </option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="col-md-4">
                        <label class="form-label">Status</label>
                        <select name="statusId" class="form-select" required>
                            <option value="">-- Select Status --</option>
                            <c:forEach var="st" items="${statuses}">
                                <option value="${st.statusId}">
                                    ${st.status}
                                </option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="col-md-4">
                        <label class="form-label">Description</label>
                        <input type="text" name="description"
                               class="form-control"
                               placeholder="Optional note">
                    </div>
                </div>

                <button type="submit" class="btn btn-success">
                    <i class="bi bi-save"></i> Save Expense
                </button>

            </form>
        </div>
    </div>

    <!-- ================= FOOTER ================= -->
    <footer>
        © 2026 Expense Tracker | Add Expense
    </footer>

</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
