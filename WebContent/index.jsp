<%@page import="model.ProdottoBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.UtenteBean" %>
<!DOCTYPE html>
<html>
<head>
    <title>Gestione</title>
</head>
<body>
    <h1>Gestione</h1>
    
    <%
        UtenteBean currentUser = (UtenteBean) session.getAttribute("currentSessionUser");
        if (currentUser != null) {
            out.println("<p>Welcome, " + currentUser.getUsername() + "! You are logged in.</p>");
        } else {
            out.println("<p>You are not logged in. Please <a href='Login.jsp'>login</a>.</p>");
        }
    %>
    
    <ul>
        <li><a href="mostraIndirizzi.jsp">Mostra Indirizzi</a></li>
        <li><a href="mostraCategorie.jsp">Mostra Categorie</a></li>
        <li><a href="mostraInserimenti.jsp">Mostra Inserimenti</a></li>
        <li><a href="mostraMetodiDiPagamento.jsp">Mostra Metodi Di Pagamento</a></li>
        <li><a href="mostraOrdini.jsp">Mostra Ordini</a></li>
        <li><a href="mostraProdotti.jsp">Mostra Prodotti</a></li>
        <li><a href="mostraUtenti.jsp">Mostra Utenti</a></li>
        <li><a href="Login.jsp">Login</a></li>
        <li><a href="mostraMieiOrdini.jsp">Mostra Miei Ordini</a></li>
        <li><a href="<%= request.getContextPath() %>/Logout">Logout</a></li>
        <li><a href="collane.jsp">Collane</a></li>
    </ul>
</body>
</html>
