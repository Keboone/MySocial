<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Comments</title>
	</head>
	
	<link href="styles.css" type="text/css" rel="stylesheet">
	
	<body>
		<div class="main-dark clearfix">
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
								<a href="bigGroupsDr.jsp">Groups</a>
							</td>s
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
	
		<div class="main-dark clearfix" id="content">
		
			<div>
				<h3 class="cooper-font-left">Comments:</h3>
				
				<sql:setDataSource var="mysocial" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/mysocial?serverTimezone=UTC" user="root"  password="!sZyMeK9111!"/>
				
				<sql:query dataSource="${mysocial}" var="result">
					SELECT pc.userpost_id, u.name, pc.commentText, pc.like FROM user u JOIN postcomment pc ON pc.user_id = u.id WHERE userpost_id = 1;
				</sql:query>
				
				<form>
				
					<table border="1" width="100%">
						<tr>
						
							<th width="5%">Post number</th>
							<th>Commentator</th>
							<th width="100%">Comment content</th>
							<th width="5%">Likes</th>
							
						</tr>
						
						<c:forEach var="row" items="${result.rows}">
						
							<tr>
							
								<td align="center"><c:out value="${row.userpost_id}"/></td>
								<td align="center"><c:out value="${row.name}"/></td>
								<td><c:out value="${row.commentText}"/></td>
								<td align="center"><c:out value="${row.like}"/></td>
								
							</tr>
							
						</c:forEach>
						
					</table>
				</form>
			</div>
			
		</div>
		
		<section>
			<div class="main-dark clearfix">
				<h6 align="center">© Copyright 2022 MySocial Web Application Project. All rights reserved. Developed by SP & MK.</h6>
			</div>
		</section>
		
	</body>
</html>