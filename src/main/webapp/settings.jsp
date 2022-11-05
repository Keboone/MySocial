<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Settings:</title>
	</head>
	
	<link href="styles.css" type="text/css" rel="stylesheet">
	
	<body>
		<div class="main-box clearfix">
	    	<div>
				<h1 class="logo" align="left">MySocial</h1>
			</div>
	    	<nav>
				<h3>
					<table class="table">
						<tr>
							<td>
								<a href="profile.jsp">Profile</a>
							</td>
							<td>
								<a href="friends.jsp">Friends</a>
							</td>
							<td>
								<a href="conversations.jsp">Conversations</a>
							</td>
							<td>
								<a href="groups.jsp">Group chat</a>
							</td>
							<td>
								<a href="bigGroups.jsp">Groups</a>
							</td>
							<td>
								<a href="support.jsp">Support</a>
							</td>
							<td>
								<a href="settings.jsp">Settings</a>
							</td>
							<td>
								<a href="LogoutServlet">Logout</a>
							</td>
						</tr>
					</table>
				</h3>
			</nav>
		</div>
	
		<div class="main-box clearfix" id="content">
		
			<form action="SettingServlet" method="post">
				<div class="wrong-login">
			
		            <h1>Settings</h1>
	                <h3>If you want to change your password:</h3></br>
	 		
					Type your name:
					<input type="name" name="name"><br>
					Type new password:
					<input type="password" name="password"><br><br>
				    <input class="button" type="submit" value="Confirm"><br><br>
				    <hr>
				</div>
			</form>
			
			<div class="wrong-login">
				<h3>MySocial theme</h3>
				<a href="settingsDr.jsp"><button class="btnDR">DARK</button></a>
				<a href="settings.jsp"><button class="btnLT">LIGHT</button></a>
			</div>
		</div>
		
		<section>
			<div class="main-box clearfix">
				<h6 align="center">© Copyright 2022 MySocial Web Application Project. All rights reserved. Developed by SP & MK.</h6>
			</div>
		</section>
		
	</body>
</html>