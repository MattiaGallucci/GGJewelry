package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Base64.Encoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.IndirizzoBean;
import model.IndirizzoDAO;
import model.MetodoDiPagamentoBean;
import model.MetodoDiPagamentoDAO;
import model.OrdineBean;
import model.OrdineDao;
import model.UtenteBean;
import model.UtenteDAO;

@WebServlet("/login")

public class ServletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/*protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mode = request.getParameter("mode");
		String path = null;
		
		if(mode.equalsIgnoreCase("getInfo")) {
			String email = (String) request.getSession().getAttribute("email");
			boolean admin = (boolean) request.getSession().getAttribute("admin");
			
			List<IndirizzoBean> indirizzi = new ArrayList<>();
			List<MetodoDiPagamentoBean> metodiPagamento = new ArrayList<>();
			List<OrdineBean> ordini = new ArrayList<>();
			
			IndirizzoDAO dbIndirizzo = new IndirizzoDAO();
			MetodoDiPagamentoDAO dbPagamento = new MetodoDiPagamentoDAO();
			OrdineDao dbOrdine = new OrdineDao();
			
			if(!admin) {
				try {
					indirizzi = dbIndirizzo.doRetrieveByEmail(email);
					metodiPagamento = dbPagamento.doRetrieveByEmail(email);
					ordini = dbOrdine.doRetrieveByEmail(email);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				request.getSession().setAttribute("indirizzi", indirizzi);
				request.getSession().setAttribute("metodiPagamento", metodiPagamento);
				request.getSession().setAttribute("ordini", ordini);
			}
		}
	}*/

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
			request.getSession().setAttribute("email", user.getEmail());
			request.getSession().setAttribute("logged", true);

			if (user.isAdmin()) {
				request.getSession().setAttribute("admin", true);
				response.sendRedirect("adminArea.jsp");
			} else {
				request.getSession().setAttribute("admin", false);
				response.sendRedirect("memberArea.jsp");
			}

			
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
