package wap.MySocial;

import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.sql.*;
import java.time.LocalDate;

@WebServlet("/Register")
public class Register extends HttpServlet 
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		LocalDate localDate = LocalDate.now();
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		String surname = request.getParameter("surname");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String password2 = request.getParameter("password2");
		String userRole = request.getParameter("userRole");

		String databaseSchema = "mysocial";
        String username = "root";
        String dbPassword = "!sZyMeK9111!";
		
		Connection connection;
		Statement stmt = null;
		
		try
		{
			request.setAttribute("name", name);
			request.setAttribute("surname", surname);
			request.setAttribute("email", email);
			request.setAttribute("password", password);
			request.setAttribute("password2", password2);
			request.setAttribute("userRole", userRole);
			
			Class.forName("com.mysql.cj.jdbc.Driver").getDeclaredConstructor().newInstance();
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+databaseSchema+"?serverTimezone=UTC",username,dbPassword);
			
			stmt = connection.createStatement();
			
			/*
			 * Dodaj do tabeli "articles" wartoœci id, title i text. id jest nullem,
			 * poniewa¿ pole id jest autoinkrementowane przez bazê danych. INSERT INTO
			 * articles VALUES (NULL, 'title', 'text');
			 */
			
			if(password2.equals(password) && name != null && surname != null && email != null && password != null)
			{
				stmt.executeUpdate("INSERT INTO user (id, name, surname, email, password, registeredAt, role) "
						+ "VALUES (NULL, '"+name+"', '"+surname+"', '"+email+"', '"+password+"', '"+localDate+"', '"+userRole+"')");
				
				out.print("Welcome for the first time, " + name + "!");
				request.getRequestDispatcher("profile.jsp").include(request, response);
			}
			else
			{
				request.getRequestDispatcher("wrongRegister.jsp").include(request, response);
			}
			out.close();
		}
		catch (Exception e) 
		{
			out.println("Exception: " + e.getMessage());
		}
	}
}