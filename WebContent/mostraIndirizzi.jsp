<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="model.IndirizzoBean" %>
<%@ page import="model.IndirizzoDAO" %>
<!DOCTYPE html>
<html>
<head>
    <title>Mostra Indirizzi</title>
</head>
<body>
    <h1>Mostra Indirizzi</h1>
    <%
        IndirizzoDAO indirizzoDAO = new IndirizzoDAO();
        List<IndirizzoBean> indirizzi = null;
        try {
            indirizzi = indirizzoDAO.doRetrieveAll();
        } catch (Exception e) {
            out.println("Errore: " + e.getMessage());
        }
    %>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Città</th>
            <th>Provincia</th>
            <th>CAP</th>
            <th>Via</th>
            <th>Civico</th>
            <th>Username Utente</th>
        </tr>
        <%
            if (indirizzi != null) {
                for (IndirizzoBean indirizzo : indirizzi) {
        %>
        <tr>
            <td><%= indirizzo.getId() %></td>
            <td><%= indirizzo.getCitta() %></td>
            <td><%= indirizzo.getProvincia() %></td>
            <td><%= indirizzo.getCap() %></td>
            <td><%= indirizzo.getVia() %></td>
            <td><%= indirizzo.getCivico() %></td>
            <td><%= indirizzo.getUtenteUsername() %></td>
        </tr>
        <%
                }
            }
        %>
    </table>
</body>
</html>
