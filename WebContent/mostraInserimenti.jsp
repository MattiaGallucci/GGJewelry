<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="model.InserimentoBean" %>
<%@ page import="model.InserimentoDAO" %>
<!DOCTYPE html>
<html>
<head>
    <title>Mostra Inserimenti</title>
</head>
<body>
    <h1>Mostra Inserimenti</h1>
    <%
        InserimentoDAO inserimentoDAO = new InserimentoDAO();
        List<InserimentoBean> inserimenti = null;
        try {
            inserimenti = inserimentoDAO.doRetrieveAll(null);
        } catch (Exception e) {
            out.println("Errore: " + e.getMessage());
        }
    %>
    <table border="1">
        <tr>
            <th>Prodotto ID</th>
            <th>Ordine ID</th>
            <th>Quantità</th>
        </tr>
        <%
            if (inserimenti != null) {
                for (InserimentoBean inserimento : inserimenti) {
        %>
        <tr>
            <td><%= inserimento.getProdottoId() %></td>
            <td><%= inserimento.getOrdineId() %></td>
            <td><%= inserimento.getQuantita() %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="3">Nessun inserimento trovato</td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>
