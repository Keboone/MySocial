<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="ISO-8859-1">
		<title>Profile</title>
	</head>
	
	<link href="styles.css" type="text/css" rel="stylesheet">
	
	<body>
	
	    <div class="main-dark clearfix">
	    	<div>
				<h1 class="logo">MySocial</h1>
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
								<a href="bigGroupsDr.jsp">Groups</a>
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
			
		<div class="main-dark clearfix">
			<sql:setDataSource var="mysocial" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/mysocial?serverTimezone=UTC" user="root"  password="!sZyMeK9111!"/>

			<sql:query dataSource="${mysocial}" var="result">
				SELECT * FROM user WHERE id=1;
			</sql:query>
			
			<h2>
				<c:forEach  var="row" items="${result.rows}">
						<c:out value="${row.name}"/>
						<c:out value="${row.surname}"/>
				</c:forEach>
			</h2>
			<p align="center">
				<sql:query dataSource="${mysocial}" var="result">
				
					SELECT  u.id, u.name, up.writtenText, up.userPostId, up.like, up.funny, up.sad, up.angry
					FROM user u 
					JOIN userpost up 
					ON u.id = up.user_id;
				
				</sql:query>
				
				<table border="1" width="75%" align="right">
					<tr>
					
						<th>Post Content</th>
						<th width="15%">Publisher</th>
						<th width="5%">User ID</th>
						<th width="5%">Post ID</th>
						
						<th width="5%">Like</th>
						<th width="5%">Funny</th>
						<th width="5%">Sad</th>
						<th width="5%">Angry</th>
						
						<th width="5%">Comments</th>
						
					</tr>
					<c:forEach var="row" items="${result.rows}">
						<tr>
						
							<td><c:out value="${row.writtenText}"/></td>
							<td align="center"><c:out value="${row.name}"/></td>
							<td align="center"><c:out value="${row.id}"/></td>
							<td align="center"><c:out value="${row.userPostId}"/></td>
							
							<td align="center"><c:out value="${row.like}"/></td>
							<td align="center"><c:out value="${row.funny}"/></td>
							<td align="center"><c:out value="${row.sad}"/></td>
							<td align="center"><c:out value="${row.angry}"/></td>
							
							<td align="center"><a href="comment.jsp">@</a></td>
							
						</tr>
					</c:forEach>
				</table>
			</p>
			
			<img class="prof-pic" src="profPic.png" alt="profilePicture">
			
			<div>
				<b>Role:</b>
				
				<sql:query dataSource="${mysocial}" var="result">
					SELECT * FROM user WHERE id=1;
				</sql:query>
				
				
				<c:forEach var="row" items="${result.rows}">
						<c:out value="${row.role}"/>
				</c:forEach>
				
				<br>
				
				<b>Member since:</b>
				
				<c:forEach var="row" items="${result.rows}">
						<c:out value="${row.registeredAt}"/>
				</c:forEach>
				
			</div>
			
			<hr>
			
			<h3><span>User info</span></h3>

			<div>
				<div class="profile-details">
					<b>First Name:</b>
					<c:forEach var="row" items="${result.rows}">
						<c:out value="${row.name}"/>
					</c:forEach>
				</div>
				<div class="profile-details">
					<b>Last Name:</b>
					<c:forEach var="row" items="${result.rows}">
						<c:out value="${row.surname}"/>
					</c:forEach>
				</div>
				<div class="profile-details">
					<b>Email:</b>
					<c:forEach var="row" items="${result.rows}">
						<c:out value="${row.email}"/>
					</c:forEach>
				</div>
				<div class="profile-details">
					<b>Address:</b>
					Towarowa Str. 66, 61-662 Poznan 
				</div>
			</div>
		</div>
		
		<section>
			<div class="main-dark clearfix">
				<h6 align="center">© Copyright 2022 MySocial Web Application Project. All rights reserved. Developed by SP & MK.</h6>
			</div>
		</section>
		
	</body>
</html>