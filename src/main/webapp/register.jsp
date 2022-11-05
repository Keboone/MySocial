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
						<option>Staff</option>
						<option>Finance</option>
						<option>IT</option>
						<option>Admin</option>
					</select>
					
					<p align="center"><input type="submit" value="Register"></p>
				 
				 </form>
				 
			</div>
		</div>
		
	</body>
	
</html>