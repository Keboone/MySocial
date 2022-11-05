package wap.MySocial;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/sharePostToGroup")
public class sharePostToGroup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public sharePostToGroup() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String writtenText = request.getParameter("writtenText");

		String databaseSchema = "mysocial";
        String username = "root";
        String dbPassword = "!sZyMeK9111!";
		
		Connection connection;
		Statement stmt = null;
		
		try
		{
			request.setAttribute("writtenText", writtenText);
			
			Class.forName("com.mysql.cj.jdbc.Driver").getDeclaredConstructor().newInstance();
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+databaseSchema+"?serverTimezone=UTC",username,dbPassword);
			
			stmt = connection.createStatement();
			
			if(writtenText != null)
			{
				stmt.executeUpdate("INSERT INTO grouppost VALUES (NULL,'"+writtenText+"', "+0+", "+0+","+0+","+0+","+3+","+1+","+3+")");
				
				request.getRequestDispatcher("adminGroup.jsp").include(request, response);
			}
			else
			{
				
				response.getWriter().append("Something went wrong! Try again!");
				request.getRequestDispatcher("adminGroup.jsp").include(request, response);
			}
			out.close();
		}
		catch (Exception e) 
		{
			out.println("Exception: " + e.getMessage());
		}
	}

}
