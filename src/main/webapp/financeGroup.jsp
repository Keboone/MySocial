<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Finance Group</title>
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
		
			<sql:setDataSource var="mysocial" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/mysocial?serverTimezone=UTC" user="root"  password="!sZyMeK9111!"/>
			
			<h2 align="center">Members of the Finance group:</h2>
			
			<sql:query dataSource="${mysocial}" var="result">
			
				SELECT id, name, surname, role
				FROM user
				WHERE biggroup_bigGroupId = 1;	
			
			</sql:query>
			
			
			<table border="1" width="100%">
				<tr>
				
					<th width="2%">Id</th>
					<th>Name</th>
					<th>Surname</th>
					<th>Role</th>
						
				</tr>
				
				<c:forEach var="row" items="${result.rows}">
					
					<tr>
					
						<td align="center"><c:out value="${row.id}"/></td>
						<td align="center"><c:out value="${row.name}"/></td>
						<td align="center"><c:out value="${row.surname}"/></td>
						<td align="center"><c:out value="${row.role}"/></td>
						
					</tr>

				</c:forEach>
				
			</table>
			
			<h2 align="center">Finance group wall</h2>
			
			<sql:query dataSource="${mysocial}" var="result">
			
				select u.name, writtenText, gp.like, funny, sad, angry
				from grouppost gp
				join user u
				on u.id = gp.user_id
				where gp.biggroup_bigGroupId = 1;
			
			</sql:query>
			
			
			<table border="1" width="100%">
				<tr>
				
					<th width="5%">Publisher</th>
					<th>Content</th>
					<th width="5%">Like</th>
					<th width="5%">Funny</th>
					<th width="5%">Sad</th>
					<th width="5%">Angry</th>
					<th width="5%">Comments</th>
						
				</tr>
				
				<c:forEach var="row" items="${result.rows}">
					
					<tr>
					
						<td align="center"><c:out value="${row.name}"/></td>
						<td><c:out value="${row.writtenText}"/></td>
						<td align="center"><c:out value="${row.like}"/></td>
						<td align="center"><c:out value="${row.funny}"/></td>
						<td align="center"><c:out value="${row.sad}"/></td>
						<td align="center"><c:out value="${row.angry}"/></td>
							
						<td align="center"><a href="groupPostComments.jsp">@</a></td>
						
					</tr>

				</c:forEach>
				
			</table>
				
			<!-- <div align="center">
		
				<form action="sharePostToGroup" method="post">
				
					<h2 align="center">Share a post</h2>
					
					<textarea name="writtenText" cols="29" rows="5" align="left"></textarea><br>
							
					<button type="submit">Share</button>
						
				</form>
			
			</div> -->
			
		</div>
			
		
		<section>
			<div class="main-box clearfix">
				<h6 align="center">© Copyright 2022 MySocial Web Application Project. All rights reserved. Developed by SP & MK.</h6>
			</div>
		</section>
		
	</body>
</html>