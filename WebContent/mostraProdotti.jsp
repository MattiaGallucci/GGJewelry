<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="model.ProdottoBean" %>
<%@ page import="model.ProdottoDAO" %>
<!DOCTYPE html>
<html>
<head>
    <title>Mostra Prodotti</title>
</head>
<body>
    <h1>Mostra Prodotti</h1>
    <%
        ProdottoDAO prodottoDAO = new ProdottoDAO();
        List<ProdottoBean> prodotti = null;
        try {
            prodotti = prodottoDAO.doRetrieveAll(null);
        } catch (Exception e) {
            out.println("Errore: " + e.getMessage());
        }
    %>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Descrizione</th>
            <th>Quantità</th>
            <th>Costo</th>
            <th>Sesso</th>
            <th>Immagine</th>
            <th>Categoria</th>
        </tr>
        <%
            if (prodotti != null) {
                for (ProdottoBean prodotto : prodotti) {
        %>
        <tr>
            <td><%= prodotto.getId() %></td>
            <td><%= prodotto.getNome() %></td>
            <td><%= prodotto.getDescrizione() %></td>
            <td><%= prodotto.getQuantita() %></td>
            <td><%= prodotto.getCosto() %></td>
            <td><%= prodotto.getSesso() %></td>
            <td><img src="<%= prodotto.getImmagine() %>" alt="Immagine Prodotto" width="100"></td>
            <td><%= prodotto.getCategoriaNome() %></td>
        </tr>
        <%
                }
            }
        %>
    </table>
</body>
</html>
