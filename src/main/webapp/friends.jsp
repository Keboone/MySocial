<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Friends</title>
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
		
			<div>
				<h3 class="cooper-font-left">Friends list:</h3>
				
				<sql:setDataSource var="mysocial" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/mysocial?serverTimezone=UTC" user="root"  password="!sZyMeK9111!"/>
				
				<sql:query dataSource="${mysocial}" var="result">
					SELECT * FROM user WHERE id != 1;
				</sql:query>
				
				<form action="selectFriendServlet" name="friend">
				
					<table border="1" width="57%">
						<tr>
						
							<th width="5%">GO TO</th>
							<th width="15%">Name</th>
							<th width="15%">Surname</th>
							<th width="15%">Role</th>
							<th width="7%">Registered since</th>
							
						</tr>
						
						<c:forEach var="row" items="${result.rows}">
						
							<tr align="center">
							
								<td><a href="friend${row.id-1}.jsp">@</a></td>
								<td><c:out value="${row.name}"/></td>
								<td><c:out value="${row.surname}"/></td>
								<td><c:out value="${row.role}"/></td>
								<td><c:out value="${row.registeredAt}"/></td>
								
							</tr>
							
						</c:forEach>
						
					</table>
				</form>
			</div>
			
		</div>
		
		<section>
			<div class="main-box clearfix">
				<h6 align="center">© Copyright 2022 MySocial Web Application Project. All rights reserved. Developed by SP & MK.</h6>
			</div>
		</section>
		
	</body>
</html>