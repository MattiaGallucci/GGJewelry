<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="model.OrdineBean" %>
<%@ page import="model.OrdineDAO" %>
<!DOCTYPE html>
<html>
<head>
    <title>Mostra Ordini</title>
</head>
<body>
    <h1>Mostra Ordini</h1>
    <%
        OrdineDAO ordineDAO = new OrdineDAO();
        List<OrdineBean> ordini = null;
        try {
            ordini = ordineDAO.doRetrieveAll(null);
        } catch (Exception e) {
            out.println("Errore: " + e.getMessage());
        }
    %>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Data</th>
            <th>Costo Totale</th>
            <th>Email Utente</th>
        </tr>
        <%
            if (ordini != null) {
                for (OrdineBean ordine : ordini) {
        %>
        <tr>
            <td><%= ordine.getId() %></td>
            <td><%= ordine.getData() %></td>
            <td><%= ordine.getCostoTotale() %></td>
            <td><%= ordine.getUtenteEmail() %></td>
        </tr>
        <%
                }
            }
        %>
    </table>
</body>
</html>
