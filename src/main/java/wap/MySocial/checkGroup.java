package wap.MySocial;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class checkGroup
 */
@WebServlet("/checkGroup")
public class checkGroup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkGroup() {
        super();
        // TODO Auto-generated constructor stub
    }
    private String getHtmlTableFromResultSet(ResultSet rs) throws SQLException
	{
		ResultSetMetaData meta = rs.getMetaData();
		int colCount = meta.getColumnCount();
		String htmlTable = "<table border=\"1\">";
		
		//header row:
		htmlTable +="<tr>";
		for (int col=1; col <= colCount; col++)
		{
			htmlTable +="<th>";
			htmlTable +=meta.getColumnLabel(col);
			htmlTable +="</th>";
		}
		htmlTable +="</tr>";

		//data rows:
		while(rs.next()) 
		{
    
			htmlTable +="<tr>";

			for (int col=1; col <= colCount; col++)
			{
				Object value = rs.getObject(col);
				htmlTable +="<td>";

				if (value != null)
				{
					htmlTable += value.toString();
				}
				htmlTable +="</td>";
			}
			htmlTable +="</tr>";
		}
		htmlTable +="</table>";
		return htmlTable;
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement pst;
		
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
			pst = conn.prepareStatement("SELECT * FROM user WHERE biggroupid_bigGroupId = 1");
//			String resultString="";
			ResultSet result = pst.executeQuery();
			if(result.next())
			{
//				rs = stmt.getResultSet();
//				resultString = getHtmlTableFromResultSet(rs);
//				
//				response.getWriter().append(resultString);
				request.getRequestDispatcher("financeGroup.jsp").include(request, response);
			}
			else
				response.getWriter().append("You are not in this group!");
				request.getRequestDispatcher("bigGroup.jsp").include(request, response);
			//sending response to the client:
//			response.getWriter().append(resultString);
			} 
			catch (Exception ex) 
			{
//			System.out.println("Exception: " + ex.getMessage());
				response.getWriter().append(ex.getMessage());
			}
			finally 
			{
				if (rs != null) 
				{
					try 
					{rs.close();} 
					catch (SQLException sqlEx) { }
			
					rs = null;
				}
			
				if (stmt != null) {
					try {stmt.close();} 
					catch (SQLException sqlEx) { }
	
					stmt = null;
				}
			}
//			PreparedStatement pst = (PreparedStatement) conn.prepareStatement("Update user set password=? where name=?");
			
//			pst.setString(1, password);
//			pst.setString(2, name);
//			
//			pst.executeUpdate();
//			request.getRequestDispatcher("settingsCommited.jsp").include(request, response);
	}

}
