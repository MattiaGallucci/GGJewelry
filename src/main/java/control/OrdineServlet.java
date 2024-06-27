package control;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Map;

import javax.servlet.RequestDispatcher;
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
import model.ProdottoBean;
import model.ProdottoDAO;

@WebServlet("/OrdineServlet")
public class OrdineServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public OrdineServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("text/plain");
		
		if(request.getSession().getAttribute("logged") == null) {
			request.getSession().setAttribute("error", "Devi essere loggato per procedere all'acquisto");
			response.getWriter().print("./loginPage.jsp");
		} else {
			request.getSession().setAttribute("costoTot", (String) request.getParameter("costoTot"));
			response.getWriter().print("./checkout.jsp");
		}
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = null;
        if (request.getSession().getAttribute("logged") == null) {
            path = "./loginPage.jsp";
        } else {
             
            
            String email = (String) request.getSession().getAttribute("email");
            String costoStr = (String) request.getSession().getAttribute("costoTot");
            costoStr = costoStr.replace(",", ".");
            double costoTot = Double.parseDouble(costoStr);

            IndirizzoDAO dbIndirizzi = new IndirizzoDAO();
            MetodoDiPagamentoDAO dbMetodi = new MetodoDiPagamentoDAO();
            OrdineDao dbOrdini = new OrdineDao();
            ProdottoDAO dbProdotto = new ProdottoDAO();

            try {
                
                    OrdineBean ordine = new OrdineBean();
                    ordine.setUtenteEmail(email);
                    ordine.setCostoTotale(costoTot);
                    ordine.setData(LocalDate.now().toString());

                    dbOrdini.doSave(ordine);

                    Map<String, Integer> carrello = (Map<String, Integer>) request.getSession().getAttribute("carrello");
                    if (carrello != null) {
                        for (Map.Entry<String, Integer> entry : carrello.entrySet()) {
                            String key = entry.getKey();
                            int quantity = entry.getValue();

                            ProdottoBean prodotto = dbProdotto.doRetrieveByKey(key);
                            if (prodotto != null) {
                                prodotto.setQuantita(prodotto.getQuantita() - quantity);
                                dbProdotto.doUpdate(prodotto);
                            }
                        }
                    }

                    request.getSession().removeAttribute("carrello");
                    request.getSession().removeAttribute("costoTot");
                    response.reset();
                    response.sendRedirect("./homePage.jsp");
                    return;
                }
             catch (SQLException e) {
                e.printStackTrace();
                request.getSession().setAttribute("error", "Errore durante l'elaborazione dell'ordine.");
                path = "./error.jsp";
            }
        }

        RequestDispatcher view = request.getRequestDispatcher(path);
        view.forward(request, response);
    }
}
