<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>First Conversation</title>
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
			
			<sql:query dataSource="${mysocial}" var="result">
				SELECT * FROM conversation WHERE conversationId = 1;
			</sql:query>
			
			<div class="wrong-login">
				<c:forEach var="row" items="${result.rows}">
					<c:out value="${row.conversationName}"/>
				</c:forEach>
			</div><br>
			
			<sql:query dataSource="${mysocial}" var="result">
				SELECT * FROM message m JOIN conversation c ON m.conversation_id = c.conversationId AND conversationId = 1;
			</sql:query>
			
			<table border="1" width="100%" align="right">
				<tr>
				
					<th width="10%">From</th>
					<th>Message</th>
					<th width="10%">To</th>
					
				</tr>
				
				<c:forEach var="row" items="${result.rows}">
					<tr>
					
						<td align="center"><c:out value="${row.from}"/></td>
						<td><c:out value="${row.messageText}"/></td>
						<td align="center"><c:out value="${row.to}"/></td>
						
					</tr>
				</c:forEach>
			</table>
				
			<br><br><br><br><br><br><br>
			
			<form action="sendMessageServlet" method="post">
			
			<div align="center">
				<table border="1" width="20%">
					<tr>
					
						<th width="10%">From</th>
						<th width="10%">To</th>
						
					</tr>
					
					<tr align="center">
						<td>
							<select type="text" name="from">  
								<option>
									<sql:query dataSource="${mysocial}" var="result">
										SELECT name FROM user WHERE id=1;
									</sql:query>
								
									<c:forEach var="row" items="${result.rows}">
										<c:out value="${row.name}"/>
									</c:forEach>
								</option>
							</select>
						</td>
					
						<td>
							<select type="text" name="to">  
				
								<option>
								
									<sql:query dataSource="${mysocial}" var="result">
										SELECT name FROM user WHERE id=2;
									</sql:query>
									
									<c:forEach var="row" items="${result.rows}">
											<c:out value="${row.name}"/>
									</c:forEach>
									
								</option>
								
							</select>
						</td>	
					</tr>
				</table>
				
				<textarea name="message" cols="29" rows="5" align="left"></textarea><br>
				
				<button type="submit">Send message</button>
			</div>
			</form>
				
		</div>
		
		<section>
			<div class="main-box clearfix">
				<h6 align="center">© Copyright 2022 MySocial Web Application Project. All rights reserved. Developed by SP & MK.</h6>
			</div>
		</section>
		
	</body>
</html>