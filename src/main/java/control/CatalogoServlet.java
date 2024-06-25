package control;

import model.ProdottoBean;
import model.ProdottoDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@WebServlet("/catalogo")
public class CatalogoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public CatalogoServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProdottoDAO dao = new ProdottoDAO();
        List<ProdottoBean> prodotti = new ArrayList<>();
        List<ProdottoBean> randomProdotti = new ArrayList<>();

        try {
            // Recupera tutti i prodotti
            prodotti = dao.doRetrieveAll("");

            // Ottieni 3 prodotti casuali
            randomProdotti = getRandomProducts(prodotti, 3);

            // Imposta entrambe le liste nella sessione
            request.getSession().setAttribute("prodotti", prodotti);
            request.getSession().setAttribute("randomProdotti", randomProdotti);

        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Reindirizza alla catalogo.jsp
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/homePage.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private List<ProdottoBean> getRandomProducts(List<ProdottoBean> products, int count) {
        List<ProdottoBean> randomProducts = new ArrayList<>();
        Random random = new Random();

        for (int i = 0; i < count; i++) {
            int randomIndex = random.nextInt(products.size());
            ProdottoBean randomProduct = products.get(randomIndex);
            randomProducts.add(randomProduct);
        }

        return randomProducts;
    }
}
