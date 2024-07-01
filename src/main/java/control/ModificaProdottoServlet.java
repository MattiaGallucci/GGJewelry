package control;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.ProdottoBean;
import model.ProdottoDAO;

@WebServlet("/modificaProdotto")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
public class ModificaProdottoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "uploads";

    public ModificaProdottoServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mode = request.getParameter("mode");
        ProdottoDAO dbProdotto = new ProdottoDAO();
        String pathForward = null;

        try {
            if (mode.equalsIgnoreCase("elimina")) {
                String prodottoId = request.getParameter("prodotto");
                dbProdotto.doDelete(prodottoId);
                pathForward = "catalogo";  // Può essere un servlet o una JSP
            } else if (mode.equalsIgnoreCase("modifica")) {
                String id = request.getParameter("prodotto");
                ProdottoBean prodotto = dbProdotto.doRetrieveByKey(id);
                request.setAttribute("prodotto", prodotto);
                pathForward = "./modificaProdotto.jsp";
            } else if (mode.equalsIgnoreCase("aggiungi")) {
                Integer id = Integer.parseInt(request.getParameter("id"));
                String nome = request.getParameter("nome");
                String descrizione = request.getParameter("descrizione");
                Integer quantita = Integer.parseInt(request.getParameter("quantita"));
                Integer costo = Integer.parseInt(request.getParameter("costo"));
                String sesso = request.getParameter("sesso");
                String immagine = request.getParameter("immagine");
                String categoria = request.getParameter("categoria");

                ProdottoBean prodotto = new ProdottoBean();

                prodotto.setId(id);
                prodotto.setNome(nome);
                prodotto.setDescrizione(descrizione);
                prodotto.setQuantita(quantita);
                prodotto.setCosto(costo);
                prodotto.setSesso(sesso);
                prodotto.setImmagine(immagine);
                prodotto.setCategoriaNome(categoria);

                try {
                    dbProdotto.doSave(prodotto);
                } catch (SQLException e) {
                    e.printStackTrace();
                }

                pathForward = "catalogo";
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

        String id = request.getParameter("id");
        String nome = request.getParameter("nome");
        String descrizione = request.getParameter("descrizione");
        Integer quantita = Integer.parseInt(request.getParameter("quantita"));
        Integer costo = Integer.parseInt(request.getParameter("costo"));
        String sesso = request.getParameter("sesso");
        String categoria = request.getParameter("categoriaNome");

        ProdottoBean prodotto = new ProdottoBean();

        try {
            prodotto = dbProdotto.doRetrieveByKey(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (!prodotto.getNome().equals(nome)) {
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
        if (!prodotto.getCategoriaNome().equals(categoria)) {
            prodotto.setCategoriaNome(categoria);
        }

        // Gestione del caricamento dell'immagine
        Part filePart = request.getPart("immagine");
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String applicationPath = getServletContext().getRealPath("");
            String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;

            File uploadDir = new File(uploadFilePath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            String sanitizedFileName = fileName.replaceAll("\\s+", "_");
            String filePath = uploadFilePath + File.separator + sanitizedFileName;

            try {
                // Copia il file nella cartella uploads
                Files.copy(filePart.getInputStream(), Paths.get(filePath));
                prodotto.setImmagine(UPLOAD_DIR + "/" + sanitizedFileName);
            } catch (IOException e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp");
                return;
            }
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
