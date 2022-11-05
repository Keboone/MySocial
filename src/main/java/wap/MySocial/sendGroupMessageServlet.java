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

@WebServlet("/sendGroupMessageServlet")
public class sendGroupMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public sendGroupMessageServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String message = request.getParameter("message");
		String from = request.getParameter("from");
		String to = request.getParameter("to");

		String databaseSchema = "mysocial";
        String username = "root";
        String dbPassword = "!sZyMeK9111!";
		
		Connection connection;
		Statement stmt = null;
		
		try
		{
			request.setAttribute("message", message);
			request.setAttribute("from", from);
			request.setAttribute("to", to);
			
			Class.forName("com.mysql.cj.jdbc.Driver").getDeclaredConstructor().newInstance();
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+databaseSchema+"?serverTimezone=UTC",username,dbPassword);
			
			stmt = connection.createStatement();
			
			if(message != null)
			{
				stmt.executeUpdate("INSERT INTO message VALUES (NULL, '"+from+"', '"+to+"', '"+message+"', "+3+")");
				
				request.getRequestDispatcher("groupChat.jsp").include(request, response);
			}
			else
			{
				request.getRequestDispatcher("groupChatError.jsp").include(request, response);
			}
			out.close();
		}
		catch (Exception e) 
		{
			out.println("Exception: " + e.getMessage());
		}
	}

}
