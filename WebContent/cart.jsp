<%@page import="model.ProdottoBean"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="meta description">

    <title>Carrello</title>

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
    Map<String, Integer> carrello = (Map<String, Integer>) request.getSession().getAttribute("carrello");
    if (carrello == null || carrello.isEmpty()) {
%>
    <div class="">
        <p>Carrello vuoto!</p>
    </div>
    <div class="">
        <a href="catalogo">Continua lo shopping</a>
    </div>
<% } else {
    List<ProdottoBean> prodotti = (List<ProdottoBean>) request.getSession().getAttribute("prodotti");
    if (prodotti == null || prodotti.isEmpty()) {
%>
    <div class="">
        <p>Prodotti non disponibili!</p>
    </div>
    <div class="">
        <a href="catalogo">Continua lo shopping</a>
    </div>
<% } else {
%>
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
                                <th class="pro-subtotal">Totale</th>
                                <th class="pro-remove">Rimuovi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                Iterator<String> iterKeys = carrello.keySet().iterator();
                                while (iterKeys.hasNext()) {
                                    String key = iterKeys.next();
                                    Integer quantita = carrello.get(key);
                                    ProdottoBean prodotto = null;
                                    for (ProdottoBean p : prodotti) {
                                        if (String.valueOf(p.getId()).equals(key)) {
                                            prodotto = p;
                                            break;
                                        }
                                    }
                                    if (prodotto != null) {
                            %>
                            <tr>
                                <td class="pro-thumbnail"><img class="img-fluid" src="<%= prodotto.getImmagine() %>" alt="Product"/></td>
                                <td class="pro-title"><a href="DettaglioProdotto?prodotto=<%= prodotto.getId() %>"><%= prodotto.getNome() %></a></td>
                                <td class="pro-price">$<%= prodotto.getCosto() %></td>
                                <td class="pro-quantity">
                                    <form action="CarrelloServlet" method="get">
                                        <input type="hidden" name="mode" value="update">
                                        <input type="hidden" name="prodotto" value="<%= prodotto.getId() %>">
                                        <input type="number" name="quantita" min="0" max="<%= prodotto.getQuantita() %>" onchange="updateCart(this, '<%= prodotto.getId() %>')" value="<%= quantita %>">
                                        <button type="submit" class="btn btn-update-quantity">Aggiorna</button>
                                    </form>
                                </td>
                                <td class="pro-subtotal">$<%= prodotto.getCosto() * quantita %></td>
                                <td class="pro-remove">
                                    <form action="CarrelloServlet" method="get">
                                        <input type="hidden" name="mode" value="remove">
                                        <input type="hidden" name="prodotto" value="<%= prodotto.getId() %>">
                                        <button type="submit" class="btn btn-remove">Rimuovi</button>
                                    </form>
                                </td>
                            </tr>
                            <%
                                    }
                                }
                            %>
                        </tbody>
                    </table>
                </div>
                <div class="cart-update-option d-block d-lg-flex">
                    <div class="cart-update">
                        <form action="CarrelloServlet" method="get">
                            <input type="hidden" name="mode" value="reset">
                            <button type="submit" class="btn btn-clear-cart">Svuota Carrello</button>
                        </form>
                    </div>
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
                                    <td>Totale Prezzo</td>
                                    <td id="netto"></td>
                                </tr>
                                <tr>
                                    <td>Spedizione</td>
                                    <td id="spedizione"></td>
                                </tr>
                                <tr>
                                    <td>Totale finale</td>
                                    <td class="total-amount" id="prezzoTot"></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <a href="" class="btn btn-proceed-to-checkout">Procedi al Checkout</a>
                </div>
            </div>
        </div>
    </div>
</div>
<%
    }
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

<script src="assets/js/aggiornaCarrello.js"></script>
</body>

</html>