<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Register Here...</title>
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

		$("#registerform").validate({

			rules : {
				firstName : {
					required : true
				},
				password : {
					required : true,
					minlength : 6
				},
				cnfrmPass : {
					required : true,
					equalTo : "#password"
				},
				email : {
					required : true
				}

			},

			messages : {
				firstName : {
					required : "Please Enter First Name"
				},
				password : {
					required : "Please Enter Password",
					minlength : "Password should be of atleast 6 digits"
				},
				cnfrmPass : {
					required : "Please Confirm Password",
					equalTo : "Password Mismatch"
				},
				email : {
					required : "Please Enter Email",
				}

			},

			submitHandler : function(form) {
				form.submit();
			}

		})
	});
</script>

<style type="text/css">
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

	<div class="jumbotron text-center"
		style="background: linear-gradient(141deg, #0fb8ad 0%, #1fc8db 51%, #2cb5e8 75%)">
		<h1>Phoenix Clothing Store</h1>
	</div>
	<div>
		<h4 align="center">
			Register with your details or <small><a href="doLogin.html"
				style="text-decoration: blink; color: red">Login Here</a></small>
		</h4>
		<hr />

		<form name="registerform" id="registerform" method="POST"
			commandName="registerform" action="signupprocess" autocomplete="off">

			<div align="center">
				<table cellpadding="6" style="width: 70%; height: 100%;">
					<tr>
						<td colspan="3" style="color: red">${msg}</td>
						<td><span id="errmsg" style="color: red"></span></td>
					</tr>
					<tr style="color: blue">
						<td>First Name<sup>*</sup></td>
						<td><input type="text" name="firstName" id="firstName"
							placeholder="First Name" required /></td>
						<td>Last Name</td>
						<td><input type="text" name="lastName" id="lastName"
							placeholder="Last Name" /></td>

					</tr>
					<tr style="color: blue">
						<td>Enter new Password<sup>*</sup></td>
						<td><input type="password" name="password" id="password"
							placeholder="Enter Password" required /></td>
						<td>Confirm Password<sup>*</sup></td>
						<td><input type="password" name="cnfrmPass" id="cnfrmPass"
							placeholder="Re-enter Password" required /></td>
					</tr>
					<tr style="color: blue">
						<td>Email<sup>*</sup></td>
						<td><input type="text" name="email" id="email"
							placeholder="Email" /></td>
						<td>Mobile Number</td>
						<td><input type="text" name="mobileNumber"
							placeholder="Mobile Number(10 Digits only)" /></td>
					</tr>
					<tr style="color: blue">
						<td>Role<sup>*</sup></td>
						<td><select name="role" class="form-control" required>
								<option value="A">Admin</option>
								<option value="U">User</option>
						</select></td>
					</tr>
					<tr>

						<td colspan="6" align="center"><input class="btn"
							type="submit" value="Confirm & Save" /> <input class="btn"
							type="reset" value="Reset" /></td>
						<!-- onclick="validateForm()" -->

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

</body>
</html>