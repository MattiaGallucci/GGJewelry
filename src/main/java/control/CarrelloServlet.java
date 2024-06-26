package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

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

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String prodotto = request.getParameter("prodotto");
        Integer quantita;
        String mode = request.getParameter("mode");
        String redirectPath = null;
        
        Map<String, Integer> carrello = (Map<String, Integer>) request.getSession().getAttribute("carrello");
        
        if (carrello == null) {
            carrello = new HashMap<>();
            request.getSession().setAttribute("carrello", carrello);
        }

        ProdottoDAO prodottoDAO = new ProdottoDAO();

        if (mode.equalsIgnoreCase("add")) {
            quantita = Integer.parseInt(request.getParameter("quantita"));
            if (carrello.containsKey(prodotto)) {
                quantita += carrello.get(prodotto);
            }
            carrello.put(prodotto, quantita);
            
            if (request.getParameter("catalogo") != null) {
                redirectPath = "catalogo.jsp";
            } else {
                request.getSession().setAttribute("aggiunto", "Aggiunto al carrello!");
                redirectPath = "DettaglioProdotto?prodotto=" + prodotto;
            }
        } else if (mode.equalsIgnoreCase("update")) {
            quantita = Integer.parseInt(request.getParameter("quantita"));
            if (quantita <= 0) {
                carrello.remove(prodotto);
            } else {
                carrello.put(prodotto, quantita);
            }
            redirectPath = "cart.jsp";
        } else if (mode.equalsIgnoreCase("remove")) {
            carrello.remove(prodotto);
            redirectPath = "cart.jsp";
        } else if (mode.equalsIgnoreCase("reset")) {
            carrello.clear();
            request.getSession().removeAttribute("carrello");
            redirectPath = "cart.jsp";
        } else if (mode.equalsIgnoreCase("getTotal")) {
            double total = 0.0;
            for (Entry<String, Integer> entry : carrello.entrySet()) {
                String key = entry.getKey();
                Integer qty = entry.getValue();
                try {
                    ProdottoBean prodottoBean = prodottoDAO.doRetrieveByKey(key);
                    total += prodottoBean.getCosto() * qty;
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            response.getWriter().print(String.format("%.2f", total));
            return;
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher(redirectPath);
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
