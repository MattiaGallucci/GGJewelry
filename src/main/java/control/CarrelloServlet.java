package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ProdottoBean;
import model.ProdottoDAO;

@WebServlet("/CarrelloServlet")
public class CarrelloServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public CarrelloServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String prodotto = request.getParameter("prodotto");
        Integer quantita;
        Integer quantitaPresente;
        String mode = request.getParameter("mode");
        response.setContentType("text/plain");
        
        Map<String, Integer> carrello = (Map<String, Integer>) request.getSession().getAttribute("carrello");
        
        if (carrello == null) {
            carrello = new HashMap<>();
            request.getSession().setAttribute("carrello", carrello);
        }

        ProdottoDAO prodottoDAO = new ProdottoDAO();

        if (mode.equalsIgnoreCase("add")) {
            quantita = Integer.parseInt(request.getParameter("quantita"));
            if(request.getSession().getAttribute("carrello") != null) {
            	if(carrello.containsKey(prodotto)) {
					quantitaPresente = carrello.get(prodotto);
					carrello.put(prodotto,quantita + quantitaPresente);
				} else {
					carrello.put(prodotto,quantita);
				}
            	request.getSession().setAttribute("carrello", carrello);
            }
        } else if(mode.equalsIgnoreCase("update")) {
        	quantita = Integer.parseInt(request.getParameter("quantita"));
			carrello = (Map<String,Integer>) request.getSession().getAttribute("carrello");
			if(quantita == 0) {
				carrello.remove(prodotto);
				if(carrello.isEmpty()) {
					request.getSession().removeAttribute("carrello");
				}
				response.getWriter().print("reload");
			} else {
			carrello.put(prodotto, quantita);
			request.getSession().setAttribute("carrello", carrello);
			}
        } else if(mode.equalsIgnoreCase("remove")) {
			carrello = (Map<String,Integer>) request.getSession().getAttribute("carrello");
			carrello.remove(prodotto);
			
			if(carrello.isEmpty()) {
				request.getSession().removeAttribute("carrello");
			}
			RequestDispatcher view = request.getRequestDispatcher("./cart.jsp");
			view.forward(request, response);
		} else if(mode.equalsIgnoreCase("reset")) {
			request.getSession().removeAttribute("carrello");
			RequestDispatcher view = request.getRequestDispatcher("./cart.jsp");
			view.forward(request, response);
		} else if(mode.equalsIgnoreCase("getTotal")) {
			if(request.getSession().getAttribute("carrello") == null) {
				return;
			} else {
				Double total = 0.0;
				carrello = (Map<String,Integer>) request.getSession().getAttribute("carrello");
				ProdottoDAO dbProdotti = new ProdottoDAO();
				ProdottoBean prodottoBean = new ProdottoBean();
				String key;
				Iterator<String> iterKeys = carrello.keySet().iterator();
				
				while(iterKeys.hasNext()) {
					key = iterKeys.next();
					try {
						prodottoBean = dbProdotti.doRetrieveByKey(key);
						total += prodottoBean.getCosto() * carrello.get(key);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				response.getWriter().print(String.format("%.2f", total));
			}
		}

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
