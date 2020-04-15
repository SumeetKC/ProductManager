<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<style type="text/css">
body {
	margin-left: 70px;
	margin-right: 70px;
	background: lightgrey no-repeat top left;
	font-family: "Segoe UI";
	font-size: 15px;
}

/* Dropdown Button */
.dropbtnheader {
	background-color: black;
	color: white;
	padding: 10px;
	font-size: 13px;
	border: none;
	cursor: pointer;
	font-family: Arial;
	cursor: pointer;
	/* font-size: 9pt; */
}

/* The container <div> - needed to position the dropdown content */
.dropdownheader {
	position: relative;
	display: inline-block;
	float: right;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-contentheader {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 150px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

/* Links inside the dropdown */
.dropdown-contentheader a {
	color: black;
	padding: 8px 14px;
	text-decoration: none;
	display: block;
}

/* Change color of dropdown links on hover */
.dropdown-contentheader a:hover {
	background-color: #f1f1f1
}

/* Show the dropdown menu on hover */
.dropdownheader:hover .dropdown-contentheader {
	display: block;
}

/* Change the background color of the dropdown button when the dropdown content is shown */
.dropdownheader:hover .dropbtn {
	background-color: #3e8e41;
}

.anchorstyleheader {
	font-family: Arial;
	font-size: 9pt;
}

.tablike {
	float: right;
	margin-right: 5px;
	color: white;
	background-color: #4CAF50;
	padding: 10px;
	font-size: 13px;
	font-family: "Segoe UI";
	border: none;
}

h1 {
	font-family: "Segoe UI";
}

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

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {
	background-color: #f1f1f1
}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
	display: block;
}

/* Change the background color of the dropdown button when the dropdown content is shown */
.dropdown:hover .dropbtn {
	background-color: #3e8e41;
}

.anchorstyle {
	font-family: Arial;
	font-size: 9pt;
}
</style>


<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
	integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="Style.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
	//window.onbeforeunload = function() { return "You work will be lost."; };	
	$(window).bind("pageshow", function(event) {
		if (event.originalEvent.persisted) {
			window.location.reload();
		}
	});
</script>
</head>
<body>
	<div
		style="background: linear-gradient(141deg, #0fb8ad 0%, #1fc8db 51%, #2cb5e8 75%); padding: 25px">


		<c:if test="${sessionScope.userValid!=null}">
			<div>
				<form action="doLogout.html" method="post">
					<input
						style="float: right; background-color: black; color: white; padding: 10px; font-size: 13px; font-family: Arial; border: none; cursor: pointer;"
						type="submit" value="Logout" />
				</form>
			</div>

			<div class="dropdownheader">
				<button class="dropbtnheader">
					<i class="fa fa-user" style="color: yellow;"></i>&nbsp; Hi
					${sessionScope.userValid.firstName}
				</button>
				<div class="dropdown-contentheader">
					<a class="anchorstyleheader"
						href="changepass?userid=${sessionScope.userValid.userId}">Change
						Password</a>
						<c:if test="${sessionScope.userValid.role!='A'}">
						<a class="anchorstyleheader"
						href="vieworders?userid=${sessionScope.userValid.userId}">View
						Orders </a>
						</c:if>
				</div>
			</div>
		</c:if>
		<h1 align="center">Phoenix Clothing Store</h1>
	</div>
	<br />

	<c:if test="${sessionScope.userValid!=null}">
		<div class="dropdown">
			<a href="welcome"><button class="dropbtn">Home</button></a>
		</div>
		<div class="dropdown">
			<a href="viewproducts"><button class="dropbtn">Product</button></a>
		</div>

		<c:if test="${sessionScope.userValid.role=='A'}">
			<div class="dropdown">
				<button class="dropbtn">AdminOps</button>
				<div class="dropdown-content">
					<a class="anchorstyle" href="addproduct">Add Product</a> <a
						class="anchorstyle" href="viewproducts">View Products</a>
						<a class="anchorstyle" href="listusers">View Users</a>
				</div>
			</div>
		</c:if>
		<hr>
	</c:if>


</body>
</html>

