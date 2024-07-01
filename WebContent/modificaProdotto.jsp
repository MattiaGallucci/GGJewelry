<%@page import="model.ProdottoBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="meta description">
    <title>Modifica Prodotto</title>
    <link rel="shortcut icon" href="assets/img/logo.png" type="image/x-icon"/>

    <!--== Google Fonts ==-->
    <link rel="stylesheet" type="text/css"
          href="https://fonts.googleapis.com/css?family=Droid+Serif:400,400i,700,700i"/>
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Montserrat:400,700"/>
    <link rel="stylesheet" type="text/css"
          href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i"/>

    <!--=== Bootstrap CSS ===-->
    <link href="assets/css/vendor/bootstrap.min.css" rel="stylesheet">
    <!--=== Font-Awesome CSS ===-->
    <link href="assets/css/vendor/font-awesome.css" rel="stylesheet">
    <!--=== Plugins CSS ===-->
    <link href="assets/css/plugins.css" rel="stylesheet">
    <!--=== Main Style CSS ===-->
    <link href="assets/css/style.css" rel="stylesheet">
    <!-- Modernizer JS -->
    <script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
</head>
<body>

<jsp:include page="fragments/header.jsp" />

<!--== Page Title Area Start ==-->
<div id="page-title-area">
    <div class="container">
        <div class="row">
            <div class="col-12 text-center">
                <div class="page-title-content">
                    <h1>Modifica Prodotto</h1>
                    <ul class="breadcrumb">
                        <li><a href="homePage.jsp">Home</a></li>
                        <li><a href="adminArea.jsp">Indietro</a></li>
                        <li><a class="active">Modifica Prodotto</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!--== Page Title Area End ==-->

<!--== Page Content Wrapper Start ==-->
<div id="page-content-wrapper" class="p-9">
    <div class="container">
        <div class="row">
            <div class="col-lg-7 m-auto">
                <div class="login-register-wrapper">
                    <div class="tab-content" id="login-reg-tabcontent">
                        <div class="tab-pane fade show active" id="register" role="tabpanel">
                            <div class="login-reg-form-wrap">
                                <% 
                                    ProdottoBean prodotto = (ProdottoBean) request.getAttribute("prodotto");
                                    if (prodotto == null) {
                                        out.println("Errore: prodotto non trovato");
                                        return;
                                    }
                                %>
                                <form action="modificaProdotto" method="post">
    <div class="single-input-item">
        <input type="hidden" id="id" name="id" value="<%= prodotto.getId() %>">
    </div>
    <div class="single-input-item">
        <label for="nome">Nome:</label>
        <input type="text" placeholder="Nome" id="nome" name="nome" value="<%= prodotto.getNome() %>" required>
    </div>
    <div class="single-input-item">
        <label for="descrizione">Descrizione:</label>
        <textarea placeholder="Descrizione" id="descrizione" name="descrizione" required><%= prodotto.getDescrizione() %></textarea>
    </div>
    <div class="single-input-item">
        <label for="quantita">Quantità:</label>
        <input type="number" placeholder="Quantità" id="quantita" name="quantita" value="<%= prodotto.getQuantita() %>" required>
    </div>
    <div class="single-input-item">
        <label for="costo">Costo:</label>
        <input type="number" placeholder="Costo" id="costo" name="costo" value="<%= prodotto.getCosto() %>" required>
    </div>
    <div class="single-input-item">
        <label for="sesso">Sesso:</label>
        <select class="form-control" id="sesso" name="sesso" required>
            <option value="M" <%= prodotto.getSesso().equals("M") ? "selected" : "" %>>Maschile</option>
            <option value="F" <%= prodotto.getSesso().equals("F") ? "selected" : "" %>>Femminile</option>
        </select>
    </div>
    <div class="single-input-item">
        <label for="immagine">Immagine URL:</label>
        <input type="text" placeholder="Immagine URL" id="immagine" name="immagine" value="<%= prodotto.getImmagine() %>" required>
    </div>
    <div class="single-input-item">
        <label for="categoriaNome">Categoria:</label>
        <input type="text" placeholder="Categoria" id="categoriaNome" name="categoriaNome" value="<%= prodotto.getCategoriaNome() %>" required>
    </div>
    <div class="single-input-item">
        <button class="btn-login" type="submit">Salva Modifiche</button>
    </div>
</form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--== Page Content Wrapper End ==-->

<jsp:include page="fragments/footer.jsp" />

<!-- Scroll to Top Start -->
<a href="#" class="scrolltotop"><i class="fa fa-angle-up"></i></a>
<!-- Scroll to Top End -->

<!--=== Javascript ===-->
<script src="assets/js/vendor/jquery-3.3.1.min.js"></script>
<script src="assets/js/vendor/bootstrap.min.js"></script>
<script src="assets/js/plugins.js"></script>
<script src="assets/js/active.js"></script>

</body>
</html>
