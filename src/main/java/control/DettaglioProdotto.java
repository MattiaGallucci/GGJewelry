package control;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ProdottoBean;
import model.ProdottoDAO;

@WebServlet("/DettaglioProdotto")
public class DettaglioProdotto extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DettaglioProdotto() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProdottoDAO dbProdotti = new ProdottoDAO();
        ProdottoBean prodotto = null;
        String prodottoId = request.getParameter("id");
        
        if (prodottoId != null && !prodottoId.isEmpty()) {
            try {
                prodotto = dbProdotti.doRetrieveByKey(prodottoId);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        if (prodotto != null) 
        {
            request.setAttribute("prodotto", prodotto);
            RequestDispatcher view = request.getRequestDispatcher("./dettaglioProdotto.jsp");
            view.forward(request, response);

        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
