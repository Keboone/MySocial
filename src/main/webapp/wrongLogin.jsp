<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>Login</title>
	</head>
	
	<link href="styles.css" type="text/css" rel="stylesheet">
	
	<body class="body-background">
		<div>
			<h3 class="wrong-login">Sorry, name, email or password incorrect! Try again!</h3>
		</div>
		<div class="main-box_2">
			<div class="main-box clearfix">
				<h1 class="cooper-font"><a href="index.jsp">Login to MySocial!</a></h1>
	
				<form action="LoginServlet" method="post">
				
					<div>
						Name:
						<input type="text" name="name"><br>
						Email:
						<input type="text" name="email"><br>
						Password:
						<input type="password" name="password"><br>
					 	
						<p align="center"><input type="submit" value="Login"></p>
					</div>
					
				</form>
		
				
				<p align="center">If you don't have account already please <a href="register.jsp">register</a></p>
			</div>
		</div>
	</body>

</html>