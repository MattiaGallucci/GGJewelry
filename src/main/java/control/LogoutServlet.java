package control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LogOutServlet")
public class LogoutServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().removeAttribute("nome");
		request.getSession().removeAttribute("cognome");
		request.getSession().removeAttribute("logged");
		request.getSession().removeAttribute("admin");
		request.getSession().removeAttribute("ordini");
		request.getSession().removeAttribute("metodiPagamento");
		request.getSession().removeAttribute("indirizzi");
		request.getSession().removeAttribute("carrello");
		request.getSession().invalidate();
		//response.sendRedirect("catalogo");
		response.sendRedirect("loginPage.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
