<%@page import="model.OrdineDao"%>
<%@page import="model.OrdineBean"%>
<%@page import="model.InserimentoDAO"%>
<%@page import="model.InserimentoBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="meta description">

    <title>Dettagli Ordine</title>
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

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<jsp:include page="fragments/header.jsp" />

<%
    String idOrdine = request.getParameter("id");
    if (idOrdine != null && !idOrdine.isEmpty()) {
        InserimentoDAO inserimentoDAO = new InserimentoDAO();
        List<InserimentoBean> inserimenti = inserimentoDAO.doRetrieveByOrdine(idOrdine);
        OrdineDao ordineDAO = new OrdineDao();
        OrdineBean ordine = ordineDAO.doRetrieveByKey(idOrdine);
%>

<!--== Page Title Area Start ==-->
<div id="page-title-area">
    <div class="container">
        <div class="row">
            <div class="col-12 text-center">
                <div class="page-title-content">
                    <h1>Dettagli Ordine</h1>
                    <ul class="breadcrumb">
                        <li><a href="homePage.jsp">Home</a></li>
                        <% Boolean isAdmin = (Boolean) request.getSession().getAttribute("admin");
                            if (isAdmin != null && isAdmin.equals(Boolean.TRUE)) { %>
                        <li><a href="adminArea.jsp">Ordini</a></li>
                        <% } else { %>
                        <li><a href="memberArea.jsp">Ordini</a></li>
                        <% } %>
                        <li><a href="ordine.jsp?idOrdine=<%= idOrdine %>" class="active">Dettagli Ordine</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!--== Page Title Area End ==-->

<div id="page-content-wrapper" class="p-9">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="cart-table table-responsive">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th class="pro-thumbnail">Immagine</th>
                                <th class="pro-title">Prodotto</th>
                                <th class="pro-price">Prezzo</th>
                                <th class="pro-quantity">Quantità</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (InserimentoBean inserimento : inserimenti) {
                            %>
                            <tr>
                                <td class="pro-thumbnail"><img class="img-fluid" src="<%= inserimento.getImmagine() %>" alt="Product"/></td>
                                <td class="pro-title"><a href="DettaglioProdotto?id=<%= inserimento.getProdottoId() %>"><%= inserimento.getNome() %></a></td>
                                <td class="pro-price">$<%= inserimento.getCosto() %></td>
                                <td class="pro-quantity"><%= inserimento.getQuantita() %></td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6 ml-auto">
                <div class="cart-calculator-wrapper">
                    <h3>Riepilogo</h3>
                    <div class="cart-calculate-items">
                        <div class="table-responsive">
                            <table class="table table-bordered">
                            	<tr>
                                    <td>Spedizione</td>
                                    <td id="netto">$ 10</td>
                                </tr>
                                <tr>
                                    <td>Totale</td>
                                    <td id="netto">$<%= ordine.getCostoTotale() %></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%
    }
%>

<jsp:include page="fragments/footer.jsp" />

<!-- Scroll to Top Start -->
<a href="#" class="scrolltotop"><i class="fa fa-angle-up"></i></a>
<!-- Scroll to Top End -->

<!--=======================Javascript============================-->
<!--=== Jquery Min Js ===-->
<script src="assets/js/vendor/jquery-3.3.1.min.js"></script>
<!--=== Jquery Migrate Min Js ===-->
<script src="assets/js/vendor/jquery-migrate-1.4.1.min.js"></script>
<!--=== Popper Min Js ===-->
<script src="assets/js/vendor/popper.min.js"></script>
<!--=== Bootstrap Min Js ===-->
<script src="assets/js/vendor/bootstrap.min.js"></script>
<!--=== Plugins Min Js ===-->
<script src="assets/js/plugins.js"></script>

<!--=== Active Js ===-->
<script src="assets/js/active.js"></script>

</body>
</html>
