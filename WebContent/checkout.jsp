<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="model.ProdottoBean"%>
<%@page import="model.ProdottoDAO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="meta description">

    <title>Checkout</title>

    <!--== Google Fonts ==-->
    <link rel="stylesheet" type="text/css"
          href="https://fonts.googleapis.com/css?family=Droid+Serif:400,400i,700,700i"/>
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700"/>
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
 
<!--== Page Title Area Start ==-->
<div id="page-title-area">
    <div class="container">
        <div class="row">
            <div class="col-12 text-center">
                <div class="page-title-content">
                    <h1>Checkout</h1>
                    <ul class="breadcrumb">
                        <li><a href="homePage.jsp">Home</a></li>
                        <li><a href="catalogo.jsp">Shop</a></li>
                        <li><a href="#" class="active">Checkout</a></li>
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
            <!-- Checkout Billing Details -->
            <div class="col-lg-6">
                <div class="checkout-billing-details-wrap">
                    <h2>Informazioni sulla spedizione</h2>
                    <div class="billing-form-wrap">
                        <form action="#">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="single-input-item">
                                        <label for="f_name" class="required">Nome</label>
                                        <input type="text" id="f_name" placeholder="Nome"/>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="single-input-item">
                                        <label for="l_name" class="required">Cognome</label>
                                        <input type="text" id="l_name" placeholder=Cognome/>
                                    </div>
                                </div>
                            </div>

                            <div class="single-input-item">
                                <label for="email" class="required">Email</label>
                                <input type="email" id="email" placeholder="Email"/>
                            </div>

                      
     
                            <div class="single-input-item">
                                <label for="street-address" class="required">Via</label>
                                <input type="text" id="street-address" placeholder="Via"/>
                            </div>

                         
                            <div class="single-input-item">
                                <label for="town" class="required">Città</label>
                                <input type="text" id="town" placeholder="Città"/>
                            </div>

                            <div class="single-input-item">
                                <label for="state">Stato</label>
                                <input type="text" id="state" placeholder="Stato"/>
                            </div>

                            <div class="single-input-item">
                                <label for="postcode" class="required">Cap</label>
                                <input type="text" id="postcode" placeholder="Cap"/>
                            </div>

                            <div class="single-input-item">
                                <label for="ordernote">Note</label>
                                <textarea name="ordernote" id="ordernote" cols="30" rows="3"
                                          placeholder="Aggiungi indicazioni sull'abitazione."></textarea>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Order Summary Details -->
            <div class="col-lg-6 mt-5 mt-lg-0">
                <<div class="order-summary-details">
        <h2>Riepilogo Ordine</h2>
        <div class="order-summary-content">
            <div class="order-summary-table table-responsive text-center">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>Prodotti</th>
                        <th>Totale</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        Map<String, Integer> carrello = (Map<String, Integer>) request.getAttribute("carrello");
                        double costoTotale = (Double) request.getAttribute("costoTot");
                        ProdottoDAO prodottoDAO = new ProdottoDAO();
                        
                        for (Map.Entry<String, Integer> entry : carrello.entrySet()) {
                            String prodottoId = entry.getKey();
                            int quantita = entry.getValue();
                            ProdottoBean prodotto = prodottoDAO.doRetrieveByKey(prodottoId);
                            if (prodotto != null) {
                                double prezzo = prodotto.getCosto();
                                double totaleProdotto = prezzo * quantita;
                    %>
                    <tr>
                        <td><a href="dettagliProdotto.jsp?id=<%= prodottoId %>"><%= prodotto.getNome() %><strong> × <%= quantita %></strong></a></td>
                        <td>$<%= totaleProdotto %></td>
                    </tr>
                    <%
                            }
                        }
                    %>
                    </tbody>
                    <tfoot>
                    <tr>
                        <td>Totale</td>
                        <td><strong>$<%= costoTotale %></strong></td>
                    </tr>
                    </tfoot>
                </table>
            </div>

            <div class="order-payment-method">
                <div class="single-payment-method show">
                    <div class="payment-method-name">
                        <div class="custom-control custom-radio">
                            <input type="radio" id="cashon" name="paymentmethod" value="cash" class="custom-control-input" checked/>
                            <label class="custom-control-label" for="cashon">Numero carta</label>
                        </div>
                    </div>
                    <div class="payment-method-details" data-method="cash">
                        <input type="text" id="carta" placeholder="carta"/>
                    </div>
                </div>

                <div class="summary-footer-area">
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="terms" required/>
                        <label class="custom-control-label" for="terms">Ho letto le informazioni sul sito e sono d'accordo con termini e condizioni</label>
                    </div>
                    <a href="completeOrderServlet" class="btn-add-to-cart">Completa Ordine</a>
                </div>
            </div>
        </div>
    </div>
        </div>
        <!--== Checkout Page Content End ==-->
    </div>
</div>
<!--== Page Content Wrapper End ==-->


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