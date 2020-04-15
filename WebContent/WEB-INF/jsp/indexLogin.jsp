<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Login page</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
	integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="Style.css">
<script
	src="//ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$("#loginForm").validate({

			rules : {
				userId : {
					required : true,
					number : true
				},
				password : {
					required : true,
					minlength : 6
				}

			},

			messages : {
				userId : {
					required : "Please Enter User ID",
					number : "Please Enter Digits Only"
				},
				password : {
					required : "Please Enter Password",
					minlength : "Password should be of atleast 6 digits"
				}

			},

			submitHandler : function(form) {
				form.submit();
			}

		})
	});
</script>


<style type="text/css">
h1 {
	font-family: Arial;
}

input[type=text], [type=password] {
	/* width: 100px;
	height: 10px; */
	padding: 6px 6px;
	box-sizing: border-box;
	border: 1px solid grey;
	border-radius: 4px;
}

.btn {
	background-color: #4CAF50;
	padding: 10px 20px;
	font-size: 17px;
	font-family: Arial;
	border: none;
	border-radius: 5px;
	cursor: auto;
}

sup {
	color: red;
}

.logintable td {
	color: blue;
}

label {
	color: red;
}
</style>
</head>
<body>
	<div>
		<div class="jumbotron text-center"
			style="background: linear-gradient(141deg, #0fb8ad 0%, #1fc8db 51%, #2cb5e8 75%)">
			<h1>Phoenix Clothing Store</h1>
		</div>

		<div>
			<h4 align="center">
				Login with your credentials or <small><a
					href="registerform.html" style="text-decoration: blink; color: red">SignUp
						Here</a></small>
			</h4>
			<form name="loginForm" id="loginForm" method="POST"
				commandName="loginForm" action="doLogin" autocomplete="off">
				<!--  action="login.html"-->

				<div align="center">
					<span style="color: red;">${message}</span>
					<table cellpadding="12px" class="logintable" >
						<tr>
							<td colspan="3">${msg}</td>
						</tr>
						<tr>
							<td>User ID<sup> *</sup></td>
							<td><input type="text" name="userId" id="userId"
								placeholder="User ID" /></td>
							<!--  onblur="validateUserId()"  -->
							<td><span id="errmsg" style="color: red"></span></td>
						</tr>
						<tr>
							<td>Password<sup> *</sup></td>
							<td><input type="password" name="password"
								placeholder="Password" /></td>
						</tr>
						<tr>
							<td></td>
							<td align="left"><input class="btn" type="submit"
								value="Log In" />
						</tr>
					</table>


				</div>
			</form>
			<div align="center">
				<form action="generatePass" method="post" name="forgotForm"
					id="forgotForm">
					<!-- <input type="hidden" id="hiddenId" /> -->
					<h5>
						Forgot Password ? <input class="btn" type="submit"
							value="Click Here" />
					</h5>
				</form>
			</div>
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
	</div>
	<div style="color: red;">* fields are mandatory</div>
</body>
</html>