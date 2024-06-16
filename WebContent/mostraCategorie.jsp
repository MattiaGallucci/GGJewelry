<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="model.CategoriaBean"%>
<%@ page import="model.CategoriaDAO"%>
<!DOCTYPE html>
<html>
<head>
<title>Mostra Categorie</title>
</head>
<body>
	<h1>Mostra Categorie</h1>
	<%
		CategoriaDAO categoriaDAO = new CategoriaDAO();
		List<CategoriaBean> categorie = null;
		try {
			categorie = categoriaDAO.doRetrieveAll(null);
		} catch (Exception e) {
			out.println("Errore: " + e.getMessage());
		}
	%>
	<table border="1">
		<tr>
			<th>Nome</th>
		</tr>
		<%
		if (categorie != null) {
			for (CategoriaBean categoria : categorie) {
		%>
		<tr>
			<td><%=categoria.getNome()%></td>
		</tr>
		<%
			}
		} else {
		%>
		<tr>
			<td colspan="1">Nessuna categoria trovata.</td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>
