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
        Boolean isLoggedIn = (Boolean) session.getAttribute("logged");
        if (isLoggedIn != null && isLoggedIn) {
            String nome = (String) session.getAttribute("nome");
            String cognome = (String) session.getAttribute("cognome");
            out.println("<p>Welcome, " + nome + " " + cognome + "!</p>");
        } else {
            out.println("<p>Please <a href='loginPage.jsp'>login</a> to continue.</p>");
        }

        String error = (String) session.getAttribute("error");
        if (error != null) {
            out.println("<p style='color:red;'>" + error + "</p>");
            session.removeAttribute("error"); // Rimuovi l'attributo per evitare di visualizzarlo nuovamente
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
        <li><a href="loginPage.jsp">Login</a></li>
        <li><a href="mostraMieiOrdini.jsp">Mostra Miei Ordini</a></li>
        <li><a href="LogOutServlet">Logout</a></li>
        <li><a href="collane.jsp">Collane</a></li>
    </ul>
</body>
</html>
