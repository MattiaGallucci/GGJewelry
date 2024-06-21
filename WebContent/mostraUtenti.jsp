<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.UtenteBean" %>
<%@ page import="model.UtenteDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mostra Utenti</title>
</head>
<body>
    <h1>Mostra Utenti</h1>
    <% 
        // Istanzia la DAO
        UtenteDAO utenteDAO = new UtenteDAO();
        
        // Ottieni tutti gli utenti dal database
        List<UtenteBean> utenti = utenteDAO.doRetrieveAll(null);
    %>
    
    <table border="1">
        <thead>
            <tr>
                <th>Email</th>
                <th>Username</th>
                <th>Password</th>
                <th>Nome</th>
                <th>Cognome</th>
                <th>Admin</th>
            </tr>
        </thead>
        <tbody>
            <% 
                // Itera attraverso tutti gli utenti e visualizzali nella tabella
                for (UtenteBean utente : utenti) { 
            %>
            <tr>
                <td><%= utente.getEmail() %></td>
                <td><%= utente.getUsername() %></td>
                <td><%= utente.getPassword() %></td>
                <td><%= utente.getNome() %></td>
                <td><%= utente.getCognome() %></td>
                <td><%= utente.isAdmin() ? "Sì" : "No" %></td>
            </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>
