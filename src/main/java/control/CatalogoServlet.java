package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ProdottoBean;
import model.ProdottoDAO;

@WebServlet("/catalogo")
public class CatalogoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get all products
        List<ProdottoBean> prodotti = null;
        ProdottoDAO prodottoDAO = new ProdottoDAO();
        ProdottoBean prodotto = new ProdottoBean();
        try {
            prodotti = prodottoDAO.doRetrieveAll(null);
            
            Iterator<ProdottoBean> iterProdotti = prodotti.iterator();
            while(iterProdotti.hasNext()) {
            	prodotto = iterProdotti.next();
            	prodotti.add(prodotto);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle database errors appropriately
            // Set an error attribute or redirect to an error page
            return;
        }

        // Generate 3 random products
        List<ProdottoBean> randomProdotti = new ArrayList<>();
        Random random = new Random();
        if (prodotti != null && !prodotti.isEmpty()) {
            int size = Math.min(prodotti.size(), 3); // Ensure at least 3 products exist
            for (int i = 0; i < size; i++) {
                int randomIndex = random.nextInt(prodotti.size());
                randomProdotti.add(prodotti.get(randomIndex));
            }
        }

        // Set both lists in session
        request.getSession().setAttribute("prodotti", prodotti);
        request.getSession().setAttribute("randomProdotti", randomProdotti);

        // Forward the request to the appropriate JSP (e.g., catalogo.jsp)
        RequestDispatcher dispatcher = request.getRequestDispatcher("./homePage.jsp");
        dispatcher.forward(request, response);
    }
}
