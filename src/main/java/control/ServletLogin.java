package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Base64;
import java.util.Base64.Encoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.UtenteBean;
import model.UtenteDAO;

@WebServlet("/login")

public class ServletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		Encoder encoder = Base64.getEncoder();
		String password64 = encoder.encodeToString(request.getParameter("password").getBytes());
		UtenteBean user = checkLogin(username, password64);

		if (user != null) {
			request.getSession().setAttribute("nome", user.getNome());
			request.getSession().setAttribute("cognome", user.getCognome());
			request.getSession().setAttribute("utente", user.getUsername());
			request.getSession().setAttribute("logged", true);

			if (user.isAdmin()) {
				request.getSession().setAttribute("admin", true);
			} else {
				request.getSession().setAttribute("admin", false);
			}

			response.sendRedirect("memberArea.jsp");
		} else {
			request.getSession().setAttribute("logged", false);
			request.getSession().setAttribute("error", "Username e/o password invalidi.");
			response.sendRedirect("loginPage.jsp?action=error");
		}
	}

	private UtenteBean checkLogin(String username, String password64) 
	{
		UtenteDAO database = new UtenteDAO();
		UtenteBean user = new UtenteBean();
		
		try 
		{
			user = database.doRetrieveByUsername(username);
			
			if(user.getUsername().equals(username) && user.getPassword().equals(password64)) {
				return user;
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		return null;
	}
}
