<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Accounts | Expense Tracker</title>

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
        margin-top:100px;
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

    <h3>Account Management</h3>
    <p class="text-muted">Add and view your accounts</p>

  <!-- ================= ADD STATUS FORM ================= -->
  
    <div class="card shadow-sm mb-4">
        <div class="card-header bg-primary text-white">
            Add New Account
        </div>
        <div class="card-body">
            <form action="/account" method="post">
    <div class="row">

        <div class="col-md-3">
            <label class="form-label">Account Title</label>
            <input type="text" name="title" class="form-control" required>
        </div>

        <div class="col-md-3">
            <label class="form-label">Payment Type</label>
            <select name="accountType" class="form-select" required>
                <option value="">-- Select Type --</option>
                <option value="Cash">Cash</option>
                <option value="UPI">UPI</option>
                <option value="Credit Card">Credit Card</option>
                <option value="Debit Card">Debit Card</option>
                <option value="Net Banking">Net Banking</option>
                <option value="Other">Other</option>
            </select>
        </div>

        <div class="col-md-3">
            <label class="form-label">Initial Amount</label>
            <input type="number" name="amount" class="form-control" required>
        </div>

        <div class="col-md-3 d-flex align-items-end">
            <button class="btn btn-success">
                Add Account
            </button>
        </div>

    </div>
</form>
            
        </div>
    </div>

    <!-- ACCOUNT TABLE -->
    <div class="card shadow-sm">
        <div class="card-header bg-dark text-white">
            Account List
        </div>
        <div class="card-body">
            <table class="table table-bordered text-center">
                <thead class="table-light">
                    <tr>
                        <th>ID</th>
                        <th>Account</th>
                        <th>Type</th>
                        <th>Balance</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="a" items="${accounts}">
                        <tr>
                            <td>${a.accountId}</td>
                            <td>${a.title}</td>
                            <td>${a.accountType}</td>
                            <td>₹ ${a.amount}</td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty accounts}">
                        <tr>
                            <td colspan="3">No accounts found</td>
                        </tr>
                    </c:if>
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
