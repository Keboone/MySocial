package wap.MySocial;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;

@WebServlet("/SettingServlet")
public class SettingServlet extends HttpServlet
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		
		Connection conn = null;
		
		String databaseSchema = "mysocial";
		String username = "root";
		String passW = "!sZyMeK9111!";

		String name = request.getParameter("name");
		String password = request.getParameter("password");

		try 
		{
			request.setAttribute("name", name);
			request.setAttribute("password", password);
			
			Class.forName("com.mysql.cj.jdbc.Driver").getDeclaredConstructor().newInstance();
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+databaseSchema+"?serverTimezone=UTC",username,passW);
			
			PreparedStatement pst = (PreparedStatement) conn.prepareStatement("Update user set password=? where name=?");
			
			pst.setString(1, password);
			pst.setString(2, name);
			
			pst.executeUpdate();
			request.getRequestDispatcher("settingsCommited.jsp").include(request, response);
		} 
		catch (Exception ex) 
		{
			System.out.println("Exception: " + ex.getMessage());
			response.getWriter().append("Internal error");
		}
		
	}
}