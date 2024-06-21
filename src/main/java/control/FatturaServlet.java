package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ComposizioneOrdineBean;
import model.ComposizioneOrdineDAO;
import model.IndirizzoBean;
import model.IndirizzoDAO;
import model.MetodoDiPagamentoBean;
import model.MetodoDiPagamentoDAO;
import model.OrdineBean;
import model.OrdineDao;
import model.UtenteBean;
import model.UtenteDAO;

/**
 * Servlet implementation class FatturaServlet
 */
@WebServlet("/fattura")
public class FatturaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FatturaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ordineID = request.getParameter("ordine");
		String cliente = request.getParameter("cliente");
		OrdineBean ordine = new OrdineBean();
		UtenteBean utente = new UtenteBean();
		List<ComposizioneOrdineBean> listaComposizioneOrdine = new ArrayList<>();
		OrdineDao dbOrdini = new OrdineDao();
		UtenteDAO dbUtenti = new UtenteDAO();
		ComposizioneOrdineDAO dbComposizioniOrdini = new ComposizioneOrdineDAO();
		
		try {
			ordine = dbOrdini.doRetrieveByKey(ordineID, cliente);
			utente = dbUtenti.doRetrieveByKey(cliente);
			listaComposizioneOrdine = dbComposizioniOrdini.doRetrieveAllByKey(ordineID);
			
			request.setAttribute("ordine", ordine);
			request.setAttribute("cliente", utente);
			request.setAttribute("listaComposizioneOrdine", listaComposizioneOrdine);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		RequestDispatcher view = request.getRequestDispatcher("./fattura.jsp");
		view.forward(request, response);
	}

}
