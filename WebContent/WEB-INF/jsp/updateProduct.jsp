<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Product</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
	integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ"
	crossorigin="anonymous">

<link rel="stylesheet" type="text/css" href="Style.css">
<style type="text/css">
body {
	margin-left: 70px;
	margin-right: 70px;
	background: lightgrey no-repeat top left;
	
	font-family: "Segoe UI";
	font-size: 15px;
}

label {
	font-weight: bold;
	color: blue;
}

input[type=text], input[type=password] {
	/* width: 100px;
	height: 10px; */
	padding: 6px 8px;
	box-sizing: border-box;
	border: 1px solid grey;
	border-radius: 3px;
}

.btn {
	background-color: #4CAF50;
	padding: 8px;
	font-size: 17px;
	font-family: Arial;
	border: none;
	border-radius: 5px;
	cursor: default;
}

sup {
	color: red;
	font-size: 13px;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/jsp/header.jsp" %>
	<div>
		<h2 align="center">Update Product</h2>
		<hr />

		<form name="registerform" method="POST" commandName="registerform"
			action="updateproduct" autocomplete="off">

			<div align="center">
			<input type="hidden" name="productId" id="productId" value="${product.productId }" />
				<table cellpadding="6">
					<tr>
						<td colspan="3" style="color: red">${msg}</td>
						<td><span id="errmsg" style="color: red"></span></td>
					</tr>
					<tr style="color: blue">
						
						<td>Product Name<sup>*</sup></td>
						<td><input type="text" name="name" id="name" value="${product.name }"
							placeholder="Product Name" required /></td>
						<td>Description</td>
						<td><input type="text" name="description" id="description" value="${product.description }"
							placeholder="Description" /></td>

					</tr>
					<tr style="color: blue">
						<td>Cost<sup>*</sup></td>
						<td><input type="text" name="cost" value="${product.cost }" name="cost"
							placeholder="cost" required /></td>
						<td>Category<sup>*</sup></td>
						<td><input type="text" name="category" id="category" value="${product.category }"
							placeholder="Quantity" required /></td> 
					</tr>
					<tr>
						<td colspan="6" align="center"><input class="btn"
							type="submit" value="Confirm & Save" /> <input class="btn"
							type="reset" value="Reset" /></td>
					</tr>
				</table>
				<div style="color: red" align="left">* mark fields are
					mandatory</div>
			</div>
		</form>
	</div>

	<!-- <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script> -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
		integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"
		integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn"
		crossorigin="anonymous"></script>
		
<%@include file="/WEB-INF/jsp/footer.jsp" %>

</body>
</html>