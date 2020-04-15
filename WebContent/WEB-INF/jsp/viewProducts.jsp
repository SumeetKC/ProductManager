<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product List</title>
<style>
body {
	margin-left: 70px;
	margin-right: 70px;
	background: lightgrey no-repeat top left;
	
	font-family: "Segoe UI";
	font-size: 15px;
}

.tablikelink {
	margin-right:5px;
	color: white;
	background-color: #4CAF50;
	padding:8px;
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
	font-family:  "Segoe UI";
	font-size: 10pt;
}

TH {
	font-family:  "Segoe UI";
	font-size: 12pt;
	height: 5px;
}

h2 {
	font-family:  "Segoe UI";
	font-size: 25px;
}
/* TD{
width:"10%";
height:"1";
} */
</style>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.4.2/css/buttons.dataTables.min.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/buttons/1.4.2/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/buttons/1.4.2/js/buttons.flash.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/buttons/1.4.2/js/buttons.html5.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/buttons/1.4.2/js/buttons.print.min.js"></script>

</head>
<body>

<%@include file="/WEB-INF/jsp/header.jsp" %>
	
	<h2 align="center">Product List</h2>
	<br />
	<div align="center">
	<span id="errmsg" style="color: red">${msg}</span>

		<table border="2"
			style="width: 70%; height: 100%; border-collapse: collapse; background-color: white;"
			class="productdata" id="productdataid">
	
			<thead>
			<tr>
				<th>Sr. No.</th>
				<th>Product ID</th>
				<th>Product Name</th>
				<th>Description</th>
				<th>Category</th>
				<th>Cost</th>
				<th>Quantity</th>
				<th></th>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${productList}" var="productdata" varStatus="i">
				<tr bgcolor="${bgcolorValue}">
				<form name="addcart" method="POST" commandName="addcart"
					action="addcart">
					<td>${i.count}</td>
					<td>${productdata.productId}</td>
					<td>${productdata.name}</td>
					<td>${productdata.description}</td>
					<td>${productdata.category}</td>
					<td>${productdata.cost}</td>
					<td>
						<input type="number" id="quantity" name="quantity" min="1" max="5"/>
						<input type="hidden" name="productId" id="productId" value="${productdata.productId }" />
					</td>
					<c:choose>
    					<c:when test="${sessionScope.userValid.role=='A'}">
       					<td>
       						<div>
       							<a href="updateproductview?productId=${productdata.productId}">Update</a>
       						</div>
       						<div>
       							<a href="deleteproduct?productId=${productdata.productId}" onclick="return confirm('Are you sure?')">Delete</a>
       						</div>
       					</td>
    					</c:when>    
    					<c:otherwise>
    						<td>	
	    						<div>
	       							<input class="btn" type="submit" value="Add To Cart" />
	       						</div>
	       					</td>
    					</c:otherwise>
					</c:choose>	
					</form>
				</tr>
				
			</c:forEach>

		</tbody>
		</table>
	
		<c:if test="${sessionScope.userValid.role!='A'}">
		<div align="center" class="dropdown">
			<a href="cart"><button class="dropbtn">Checkout</button></a>
		</div>
		</c:if>
	</div>
	
	<%@include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>