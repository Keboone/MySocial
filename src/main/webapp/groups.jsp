<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Group chat</title>
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
		
			<div align="center">
				<a href="../MySocial/groupChat.jsp"><button class="button">Group chat</button></a>
			</div>
			
		</div>
		
		<section>
			<div class="main-box clearfix">
				<h6 align="center">© Copyright 2022 MySocial Web Application Project. All rights reserved. Developed by SP & MK.</h6>
			</div>
		</section>
		
	</body>
</html>