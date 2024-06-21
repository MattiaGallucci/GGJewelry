<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="model.MetodoDiPagamentoBean" %>
<%@ page import="model.MetodoDiPagamentoDAO" %>
<!DOCTYPE html>
<html>
<head>
    <title>Mostra Metodi di Pagamento</title>
</head>
<body>
    <h1>Mostra Metodi di Pagamento</h1>
    <%
        MetodoDiPagamentoDAO metodoDiPagamentoDAO = new MetodoDiPagamentoDAO();
        List<MetodoDiPagamentoBean> metodiDiPagamento = null;
        try {
            metodiDiPagamento = metodoDiPagamentoDAO.doRetrieveAll(null);
        } catch (Exception e) {
            out.println("Errore: " + e.getMessage());
        }
    %>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Tipo</th>
            <th>IBAN</th>
            <th>Numero Carta</th>
            <th>Email Utente</th>
        </tr>
        <%
            if (metodiDiPagamento != null) {
                for (MetodoDiPagamentoBean metodo : metodiDiPagamento) {
        %>
        <tr>
            <td><%= metodo.getId() %></td>
            <td><%= metodo.getTipo() %></td>
            <td><%= metodo.getIban() != null ? metodo.getIban() : "N/A" %></td>
            <td><%= metodo.getNumeroCarta() != null ? metodo.getNumeroCarta() : "N/A" %></td>
            <td><%= metodo.getUtenteEmail() %></td>
        </tr>
        <%
                }
            }
        %>
    </table>
</body>
</html>
