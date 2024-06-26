package control;

import java.io.IOException;
import java.io.Writer;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ProdottoBean;
import model.ProdottoDAO;

@WebServlet("/modificaProdotto")
public class ModificaProdottoServlet extends HttpServlet{
    private static final long serialVersionUID = 1L;

    public ModificaProdottoServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mode = request.getParameter("mode");
        ProdottoDAO dbProdotto = new ProdottoDAO();
        String pathForward = null;

        try {
            if(mode.equalsIgnoreCase("elimina")) {
                String prodottoId = request.getParameter("prodotto");
                dbProdotto.doDelete(prodottoId);
                pathForward = "catalogo";  // Può essere un servlet o una JSP
            } else if (mode.equalsIgnoreCase("modifica")) {
                String id = request.getParameter("prodotto");
                ProdottoBean prodotto = dbProdotto.doRetrieveByKey(id);
                request.setAttribute("prodotto", prodotto);
                pathForward = "./modificaProdotto.jsp";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            pathForward = "error.jsp";  // Pagina di errore personalizzata
        }

        // Forward della richiesta alla pagina appropriata
        if (pathForward != null) {
            request.getRequestDispatcher(pathForward).forward(request, response);
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	ProdottoDAO dbProdotto = new ProdottoDAO();
    	Writer out = response.getWriter();
		
    	String id = request.getParameter("id");
    	String nome = request.getParameter("nome");
    	String descrizione = request.getParameter("descrizione");
    	Integer quantita = Integer.parseInt(request.getParameter("quantita"));
		Integer costo = Integer.parseInt(request.getParameter("costo"));
		String sesso = request.getParameter("sesso");
		String immagine = request.getParameter("immagine");
		String categoria = request.getParameter("categoriaNome");
		
		ProdottoBean prodotto = new ProdottoBean();
		
		try {
			prodotto = dbProdotto.doRetrieveByKey(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if(!prodotto.getNome().equals(nome)) {
			prodotto.setNome(nome);
		}
		
		if (!prodotto.getDescrizione().equals(descrizione)) {
            prodotto.setDescrizione(descrizione);
        }
        if (!(prodotto.getQuantita() == quantita)) {
            prodotto.setQuantita(quantita);
        }
        if (!(prodotto.getCosto() == costo)) {
            prodotto.setCosto(costo);
        }
        if (!prodotto.getSesso().equals(sesso)) {
            prodotto.setSesso(sesso);
        }
        if (!prodotto.getImmagine().equals(immagine)) {
            prodotto.setImmagine(immagine);
        }
        if (!prodotto.getCategoriaNome().equals(categoria)) {
            prodotto.setCategoriaNome(categoria);
        }
        try {
            dbProdotto.doUpdate(prodotto);
            
            // Aggiorna la lista dei prodotti nella sessione
            List<ProdottoBean> prodottiAggiornati = dbProdotto.doRetrieveAll("");
            request.getSession().removeAttribute("prodotti");
            request.getSession().setAttribute("prodotti", prodottiAggiornati);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        RequestDispatcher view = request.getRequestDispatcher("catalogo");
        view.forward(request, response);
    }
}
