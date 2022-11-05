<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Groups</title>
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
								<a href="profileDr.jsp">Profile</a>
							</td>
							<td>
								<a href="friendsDr.jsp">Friends</a>
							</td>
							<td>
								<a href="conversationsDr.jsp">Conversations</a>
							</td>
							<td>
								<a href="groupsDr.jsp">Group chat</a>
							</td>
							<td>
								<a href="bigGroups.jsp">Groups</a>
							</td>
							<td>
								<a href="supportDr.jsp">Support</a>
							</td>
							<td>
								<a href="settingsDr.jsp">Settings</a>
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
				<a href="../MySocial/financeGroup.jsp"><button class="button">Finance Group</button></a>
			</div>
			
			<br>
			
			<div align="center">
				<a href="../MySocial/ITGroup.jsp"><button class="button">IT Group</button></a>
			</div>
			
			<br>
			
			<div align="center">
				<a href="../MySocial/managerGroup.jsp"><button class="button">Manager Group</button></a>
			</div>
			
		</div>
		
		<section>
			<div class="main-box clearfix">
				<h6 align="center">© Copyright 2022 MySocial Web Application Project. All rights reserved. Developed by SP & MK.</h6>
			</div>
		</section>
		
	</body>
</html>