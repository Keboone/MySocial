<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Conversations</title>
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
				<a href="../MySocial/firstConversation.jsp"><button class="button">Conversation with Harry</button></a>
				
				<a href="../MySocial/secondConversation.jsp"><button class="button">Conversation with Richard</button></a>
			</div>
		
		</div>
		
		<section>
			<div class="main-box clearfix">
				<h6 align="center">© Copyright 2022 MySocial Web Application Project. All rights reserved. Developed by SP & MK.</h6>
			</div>
		</section>
		
	</body>
</html>