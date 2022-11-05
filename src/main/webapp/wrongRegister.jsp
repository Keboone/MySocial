<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Register</title>
	</head>
	
	<link href="styles.css" type="text/css" rel="stylesheet">
	
	<body class="body-background">
		<div>
			<h3 class="wrong-login">Sorry, name, surname, email or password are empty or password don't match!</h3>
		</div>
		<div class="main-box_2">
			<div class="main-box clearfix">
			
				<h1 class="cooper-font"><a href="index.jsp">Register to MySocial!</a></h1>
			 
				<form action="Register" method="post">
			
					Name:
					<input type="text" name="name"><br>
					Surname:
					<input type="text" name="surname"><br>
					Email:
					<input type="text" name="email"><br>
					Password:
					<input type="password" name="password"><br>
				 	Repeat password:
				 	<input type="password" name="password2"><br>
				 	
				 	<h3>Select user role</h3>  
					
					Role
					<select type="text" name="userRole">  
						<option>User</option>
						<option>Publisher</option>
						<option>Administrator</option>
						<option>Web designer</option>
						<option>Technical support</option>
						<option>Support</option>
						<option>Censor</option>
					</select>
					
					<p align="center"><input type="submit" value="Register"></p>
				 
				 </form>
				 
			</div>
		</div>
		
	</body>
	
</html>