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
		
        try {
            // Retrieve all products
			prodotti = dao.doRetrieveAll("");
			
			// Set products list in session
			request.getSession().setAttribute("prodotti", prodotti);
			
			// Get 3 random products
			List<ProdottoBean> randomProdotti = getRandomProducts(prodotti, 3);
			
			// Set random products list in session
			request.getSession().setAttribute("randomProdotti", randomProdotti);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// Forward to the homePage.jsp
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/homePage.jsp");
		dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
    
    /**
     * Retrieves a list of random products from the given list.
     * 
     * @param products List of all products available
     * @param count Number of random products to retrieve
     * @return List of randomly selected products
     */
    private List<ProdottoBean> getRandomProducts(List<ProdottoBean> products, int count) {
        List<ProdottoBean> randomProducts = new ArrayList<>();
        Random random = new Random();
        
        // Ensure we don't exceed available products count
        int maxIndex = Math.min(count, products.size());
        
        // Select random products
        for (int i = 0; i < maxIndex; i++) {
            int randomIndex = random.nextInt(products.size());
            ProdottoBean randomProduct = products.get(randomIndex);
            randomProducts.add(randomProduct);
        }
        
        return randomProducts;
    }
}
