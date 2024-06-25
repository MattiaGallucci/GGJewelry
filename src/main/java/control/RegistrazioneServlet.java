package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Base64;
import java.util.Iterator;
import java.util.List;
import java.util.Base64.Encoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.UtenteBean;
import model.UtenteDAO;

@WebServlet("/registrazione")
public class RegistrazioneServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UtenteDAO dbUtenti = new UtenteDAO();
		String path = null;

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String passwordCheck = request.getParameter("passwordCheck");
		String email = request.getParameter("email");
		String nome = request.getParameter("nome");
		String cognome = request.getParameter("cognome");
		Encoder encoder = Base64.getEncoder();
		String pwd64 = null;
		String pwdchk64 = null;
		
		pwd64 = encoder.encodeToString(password.getBytes());
		pwdchk64 = encoder.encodeToString(passwordCheck.getBytes());
		
		try {
			if(pwd64.equals(pwdchk64)) {
				UtenteBean utente = new UtenteBean();
				UtenteBean utenteRicercato = new UtenteBean();
				boolean flag = false;
				List<UtenteBean> listaUtenti = dbUtenti.doRetrieveAll(username);
				Iterator<UtenteBean> iterUtenti = listaUtenti.iterator();
				
				utente.setUsername(username);
				utente.setPassword(pwd64);
				
				while(iterUtenti.hasNext()) {
					utenteRicercato = iterUtenti.next();
					if(!utenteRicercato.getUsername().equalsIgnoreCase(utente.getUsername())) {
						if(utenteRicercato.getEmail().equalsIgnoreCase(email)) {
							flag = true;
							break;
						}
					}
				}
				
				utente.setEmail(email);
				utente.setNome(nome);
				utente.setCognome(cognome);
				utente.setAdmin(false);
				
				if(!flag) {
					dbUtenti.doSave(utente);
					request.getSession().setAttribute("result", "Registrato con successo!");
				} else {
					request.getSession().setAttribute("error", "Registrazione non completata. Riprovare.");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		path = "./loginForm.jsp";
		request.removeAttribute("acquisto");
		
		RequestDispatcher view = request.getRequestDispatcher(path);
		view.forward(request, response);
	}
}
