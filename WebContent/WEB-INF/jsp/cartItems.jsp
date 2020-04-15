<%@page import="com.product.model.Item"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cart Items</title>
<style>
.dropbtn {
	background-color: #4CAF50;
	color: white;
	padding: 11px;
	font-size: 14px;
	border: none;
	cursor: pointer;
	font-family: Arial;
	/* font-size: 9pt; */
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
	position: relative;
	display: inline-block;
}

body {
	margin-left: 70px;
	margin-right: 70px;
	background: lightgrey no-repeat top left;
	font-family: "Segoe UI";
	font-size: 15px;
}

.tablikelink {
	margin-right: 5px;
	color: white;
	background-color: #4CAF50;
	padding: 8px;
	font-size: 12px;
	font-family: "Segoe UI";
}

#export {
	background-color: #4CAF50;
	color: white;
	padding: 10px;
	font-size: 13px;
	font-family: "Segoe UI";
	border: none;
	cursor: pointer;
}

.productdata tr td, th {
	border: 1px solid #999;
	padding: 0.5rem;
}

.productdata tr th {
	background-color: lightsalmon;
}

TD {
	font-family: "Segoe UI";
	font-size: 10pt;
}

TH {
	font-family: "Segoe UI";
	font-size: 12pt;
	height: 5px;
}

h2 {
	font-family: "Segoe UI";
	font-size: 25px;
}
/* TD{
width:"10%";
height:"1";
} */
</style>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/buttons/1.4.2/css/buttons.dataTables.min.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/buttons/1.4.2/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/buttons/1.4.2/js/buttons.flash.min.js"></script>
<script type="text/javascript" charset="utf8"
	src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript" charset="utf8"
	src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
<script type="text/javascript" charset="utf8"
	src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/buttons/1.4.2/js/buttons.html5.min.js"></script>
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/buttons/1.4.2/js/buttons.print.min.js"></script>


</head>
<body>

	<%@include file="/WEB-INF/jsp/header.jsp"%>

	<h2 align="center">Cart Items</h2>
	<br />
	<div align="center">
		<span id="errmsg" style="color: red">${msg}</span>
		<form name="confirmorder" method="POST" commandName="confirmorder"
			action="confirmorder">
			<table border="2"
				style="width: 70%; height: 100%; border-collapse: collapse; background-color: white;"
				class="productdata" id="productdataid">

				<thead>
					<tr>
						<th>Sr. No.</th>
						<th>Product Name</th>
						<th>Description</th>
						<th>Category</th>
						<th>Cost</th>
						<th>Quantity</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:set var="total" value="0"></c:set>
					<c:forEach var="item" items="${cart}" varStatus="i">
						<c:set var="total" value="${total + item.cost * item.quantity }"></c:set>
						<tr bgcolor="${bgcolorValue}">
							<td>${i.count}</td>
							<td>${item.name}</td>
							<td>${item.description}</td>
							<td>${item.category}</td>
							<td>${item.cost}</td>
							<td>${item.quantity}</td>
							<td>
								<div>
									<a href="removecart?&itemName=${item.name }"
										onclick="return confirm('Are you sure?')">Remove</a>
								</div>
							</td>
						</tr>
					</c:forEach>
					<input type="hidden" name="amount" id="amount" value="${total }" />
					<tr>
						<td colspan="5" align="right">Total Amount</td>
						<td colspan="5">${total }</td>
					</tr>

				</tbody>
			</table>
			<div class="dropdown">
				<input class="dropbtn" type="submit" value="Confirm Order" />
			</div>
		</form>
	</div>

	<%@include file="/WEB-INF/jsp/footer.jsp"%>
</body>
</html>