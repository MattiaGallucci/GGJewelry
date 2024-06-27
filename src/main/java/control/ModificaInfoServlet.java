package control;

import java.io.IOException;
import java.io.Writer;
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

@WebServlet("/modificaInfo")
public class ModificaInfoServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	public ModificaInfoServlet() {
        super();
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mode = request.getParameter("mode");
		String target = request.getParameter("target");
		String username = (String) request.getSession().getAttribute("utente");
		String pathRedirect = null;
		
		if(mode.equals("update")) {
			if(target.equals("utente")) {
				UtenteDAO dbUtenti = new UtenteDAO();
				 UtenteBean utente = new UtenteBean();
				 
				 try {
					utente = dbUtenti.doRetrieveByUsername(username);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
				request.setAttribute("utente", utente);
				request.setAttribute("target", "utente");
				pathRedirect = "./memberArea.jsp";
			}
		}
		RequestDispatcher view = request.getRequestDispatcher(pathRedirect);
		view.forward(request, response);
	}
	
	/*protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = null;
		String target = request.getParameter("target");
		String mode = request.getParameter("mode");
		boolean flag = false;
		
		if(mode.equalsIgnoreCase("update")) {
			if(target.equalsIgnoreCase("utente")) {
				UtenteDAO dbUtente = new UtenteDAO();
				UtenteBean utente = new UtenteBean();
				Encoder encoder = Base64.getEncoder();
				
				String username = request.getParameter("utente");
				String newUsername = request.getParameter("usernameNuovo");
				String password = request.getParameter("password");
				String passwordCheck = request.getParameter("passwordCheck");
				String email = request.getParameter("emailNuovo");
				String nome = request.getParameter("nomeNuovo");
				String cognome = request.getParameter("cognomeNuovo");
				String pwd64 = null;
				
				Writer out = response.getWriter();
				out.append(username + "|" + newUsername + "|"  + email + "|" + nome + "|" + cognome + "| \n");
				
				if(password.equals(passwordCheck)) {
					pwd64 = encoder.encodeToString(password.getBytes());
					try {
						utente = dbUtente.doRetrieveByUsername(username);
						
						if(!utente.getUsername().equals(newUsername)) {
							utente.setUsername(newUsername);
							request.getSession().setAttribute("utente", newUsername);
						}
						
						if(!utente.getPassword().equals(pwd64)) {
							utente.setPassword(pwd64);
						}
						
						if(!utente.getEmail().equalsIgnoreCase(email)) {
							List<UtenteBean> listaUtenti = dbUtente.doRetrieveAll("");
							Iterator<UtenteBean> iterUtenti = listaUtenti.iterator();
							UtenteBean utenteRicercato = new UtenteBean();
							while(iterUtenti.hasNext()) {
								utenteRicercato = iterUtenti.next();
								
								if(!utente.getUsername().equalsIgnoreCase(utenteRicercato.getUsername())) {
									if(utenteRicercato.getEmail().equalsIgnoreCase(email)) {
										flag = true;
										break;
									}
								}
							}
							utente.setEmail(email);
						}
						
						if(!utente.getNome().equals(nome)) {
							utente.setNome(nome);
							request.getSession().setAttribute("nome", nome);
						}
						
						if(!utente.getCognome().equals(cognome)) {
							utente.setCognome(cognome);
							request.getSession().setAttribute("cognome", cognome);
						}
						if(!flag) {
							if(!dbUtente.doUpdate(utente,email)) {
								request.getSession().setAttribute("error", "Aggiornamento non effettuato!");
								path = "modificaInfo?mode=update&target=utente";
							} else {
								request.getSession().setAttribute("message", "Aggiornato con successo!");
								request.getSession().setAttribute("utente", utente.getUsername());
								path = "./memberArea.jsp";
							}
						} else {
							request.getSession().setAttribute("error", "Impossibile usare l'email scelta. Riprova.");
							path = "./modificaInfo?mode=update&target=utente&utente=" + username;
						}
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				}
					response.sendRedirect(path);
			}
		}
	}*/
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = null;
        String mode = request.getParameter("mode");
        String target = request.getParameter("target");

        if (mode != null && mode.equalsIgnoreCase("update")) {
            if (target != null && target.equalsIgnoreCase("utente")) {
                UtenteDAO dbUtente = new UtenteDAO();
                UtenteBean utente = new UtenteBean();
                
                String username = (String) request.getSession().getAttribute("utente");
                String newUsername = request.getParameter("usernameNuovo");
                String email = request.getParameter("emailNuovo");
                String nome = request.getParameter("nomeNuovo");
                String cognome = request.getParameter("cognomeNuovo");

                try {
                    utente = dbUtente.doRetrieveByUsername(username);

                    if (!utente.getUsername().equals(newUsername)) {
                        utente.setUsername(newUsername);
                        request.getSession().setAttribute("utente", newUsername);
                    }

                    if (!utente.getEmail().equalsIgnoreCase(email)) {
                        utente.setEmail(email);
                    }

                    if (!utente.getNome().equals(nome)) {
                        utente.setNome(nome);
                        request.getSession().setAttribute("nome", nome);
                    }

                    if (!utente.getCognome().equals(cognome)) {
                        utente.setCognome(cognome);
                        request.getSession().setAttribute("cognome", cognome);
                    }

                    if (!dbUtente.doUpdate(utente, email)) {
                        request.getSession().setAttribute("error", "Aggiornamento non effettuato!");
                        path = "modificaInfo?mode=update&target=utente";
                    } else {
                        request.getSession().setAttribute("message", "Aggiornato con successo!");
                        request.getSession().setAttribute("utente", utente.getUsername());
                        path = "./memberArea.jsp";
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                    request.getSession().setAttribute("error", "Errore durante l'aggiornamento. Riprova.");
                    path = "modificaInfo?mode=update&target=utente";
                }
            }
        }
        response.sendRedirect(path);
    }
}
