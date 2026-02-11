<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Expenses</title>


<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">


<style>
body { background-color:#f4f6f9; }

		.content { margin-left:240px; padding:20px; 

		footer { background:#fff;
		
		 border-top:1px solid #dee2e6; 
		 
		 padding:10px; margin-top:30px; 
		 
   text-align:center; }
</style>
</head>

<body>


<!-- ================= HEADER ================= -->

	<jsp:include page="AdminHeader.jsp"></jsp:include>

<!-- ================= SIDEBAR ================= -->

	<jsp:include page="AdminSidebar.jsp"></jsp:include>
	
<!-- ================= MAIN CONTENT ================= -->	
<div class="content">

    <h3>My Expenses</h3>

    <div class="card shadow-sm">
        <div class="card-header bg-dark text-white">
            Expense List
        </div>
        <div class="card-body">
            <table class="table table-bordered table-hover text-center">
                <thead class="table-light">
                    <tr>
                        <th>Title</th>
                        <th>Category</th>
                        <th>Vendor</th>
                        <th>Amount</th>
                        <th>Date</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="e" items="${expenses}">
                        <tr>
                            <td>${e.title}</td>
                            <td>${e.category.categoryName}</td>
                            <td>${e.vendor.vendorName}</td>
                            <td>₹ ${e.amount}</td>
                            <td>${e.date}</td>
                            <td>${e.status.status}</td>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty expenses}">
                        <tr>
                            <td colspan="6">No expenses found</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
 <!-- ================= FOOTER ================= -->
    <footer>
        © 2026 Expense Tracker | Expense List
    </footer>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
