package wap.MySocial;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet
{
	String name;
	String email;
	String password;
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		name = request.getParameter("name");
		email = request.getParameter("email");
		password = request.getParameter("password");
		
		String databaseSchema = "mysocial";
        String username = "root";
        String dbPassword = "!sZyMeK9111!";
		
		Connection conn;
		PreparedStatement pst;
//		Statement st;
		
		try
		{
//			request.setAttribute("name", name);
//			request.setAttribute("email", email);
//			request.setAttribute("password", password);
			
			HttpSession session = request.getSession();
			session.setAttribute("name", name);
			session.setAttribute("email", email);
			session.setAttribute("password", password);
			
			Class.forName("com.mysql.cj.jdbc.Driver").getDeclaredConstructor().newInstance();
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+databaseSchema+"?serverTimezone=UTC",username,dbPassword);
			
			pst = conn.prepareStatement("SELECT name, email, password FROM user WHERE name=? AND email=? AND password=?");
//			st = conn.createStatement();
			
			pst.setString(1, name);     // e.g. James
			pst.setString(2, email);    // JamesGreen@gmail.com
			pst.setString(3, password); // CARROT123
			
			ResultSet result = pst.executeQuery();
			
			if(result.next())
			{
				out.print("Welcome back, " + name + "!");
				request.getRequestDispatcher("profile.jsp").include(request, response);
			}
			else {request.getRequestDispatcher("wrongLogin.jsp").include(request, response);}
			out.close();
		}
		catch (Exception e) {out.println("Exception: " + e.getMessage());}
	}
}
