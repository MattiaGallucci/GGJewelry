package control;
import model.ProdottoBean;
import model.ProdottoDAO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
@WebServlet("/catalogo")

public class CatalogoServlet extends HttpServlet 
{
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProdottoDAO dao = new ProdottoDAO();
        ArrayList<ArrayList<ProdottoBean>> categorie = new ArrayList<>();

        try {
            ArrayList<ProdottoBean> abbigliamento = dao.doRetrieveByCategoria("Abbigliamento");
            ArrayList<ProdottoBean> anelli = dao.doRetrieveByCategoria("anelli");
            ArrayList<ProdottoBean> collane = dao.doRetrieveByCategoria("collane");

            categorie.add(abbigliamento);
            categorie.add(anelli);
            categorie.add(collane);

            request.getSession().setAttribute("categorie", categorie);

            // Combine all products into a single list for random selection
            List<ProdottoBean> allProducts = new ArrayList<>();
            allProducts.addAll(abbigliamento);
            allProducts.addAll(anelli);
            allProducts.addAll(collane);

            // Select random products
            List<ProdottoBean> randomProducts = getRandomProducts(allProducts, 10); // for example, select 10 random products
            request.getSession().setAttribute("randomProducts", randomProducts);

            // Log image URLs for debugging
            for (ProdottoBean product : randomProducts) {
                System.out.println("Product Image URL: assets/images/" + product.getImmagine());
            }

        } catch(SQLException e) {
            e.printStackTrace();
        }

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/homePage.jsp");
        dispatcher.forward(request, response);
    }

    private List<ProdottoBean> getRandomProducts(List<ProdottoBean> allProducts, int numberOfProducts) {
        List<ProdottoBean> randomProducts = new ArrayList<>();
        Random rand = new Random();
        for (int i = 0; i < numberOfProducts && !allProducts.isEmpty(); i++) {
            int randomIndex = rand.nextInt(allProducts.size());
            randomProducts.add(allProducts.remove(randomIndex));
        }
        return randomProducts;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}

