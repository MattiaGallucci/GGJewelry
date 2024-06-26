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

<!--== Page Content Wrapper Start ==-->
<div id="page-content-wrapper" class="p-9">
    <div class="container">
        <!-- Cart Page Content Start -->
        <div class="row">
            <div class="col-lg-12">
                <!-- Cart Table Area -->
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
                        <%-- Iterate through the items in the cart --%>
                        <c:forEach var="entry" items="${sessionScope.carrello}">
                            <%-- Get product details using the product ID (entry.key) --%>
                            <%@ page import="model.ProdottoBean" %>
                            <%@ page import="model.ProdottoDAO" %>
                            <%-- Retrieve the product bean --%>
                            <%
                                String productId = entry.key;
                                int quantity = entry.value;
                                
                                ProdottoDAO prodottoDAO = new ProdottoDAO();
                                ProdottoBean prodotto = prodottoDAO.doRetrieveByKey(productId);
                            %>
                            <tr>
                                <td class="pro-thumbnail"><img class="img-fluid" src="<%= prodotto.getImmagine() %>" alt="Product"/></td>
                                <td class="pro-title"><a href="DettaglioProdotto?prodotto=<%= prodotto.getId() %>"><%= prodotto.getNome() %></a></td>
                                <td class="pro-price">$<%= prodotto.getCosto() %></td>
                                <td class="pro-quantity">
                                    <form action="Carrello" method="get">
                                        <input type="hidden" name="mode" value="update">
                                        <input type="hidden" name="prodotto" value="<%= prodotto.getId() %>">
                                        <input type="number" name="quantita" min="0" value="<%= quantity %>">
                                        <button type="submit" class="btn btn-update-quantity">Aggiorna</button>
                                    </form>
                                </td>
                                <td class="pro-subtotal">$<%= prodotto.getCosto() * quantity %></td>
                                <td class="pro-remove">
                                    <form action="Carrello" method="get">
                                        <input type="hidden" name="mode" value="remove">
                                        <input type="hidden" name="prodotto" value="<%= prodotto.getId() %>">
                                        <button type="submit" class="btn btn-remove">Rimuovi</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

                <!-- Cart Update Option -->
                <div class="cart-update-option d-block d-lg-flex">
                    <div class="cart-update">
                        <form action="Carrello" method="get">
                            <input type="hidden" name="mode" value="reset">
                            <button type="submit" class="btn btn-clear-cart">Svuota Carrello</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6 ml-auto">
                <!-- Cart Calculation Area -->
                <div class="cart-calculator-wrapper">
                    <h3>Riepilogo</h3>
                    <div class="cart-calculate-items">
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <tr>
                                    <td>Totale Prezzo</td>
                                    <td>$<%= getTotalPrice() %></td>
                                </tr>
                                <tr>
                                    <td>Spedizione</td>
                                    <td>$70</td>
                                </tr>
                                <tr>
                                    <td>Totale finale</td>
                                    <td class="total-amount">$<%= getTotalPrice() + 70 %></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <a href="checkout.html" class="btn btn-proceed-to-checkout">Procedi al Checkout</a>
                </div>
            </div>
        </div>
        <!-- Cart Page Content End -->
    </div>
</div>
 
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

<%-- Function to calculate total price of items in cart --%>
<%! 
    double getTotalPrice() {
        double total = 0.0;
        if (session.getAttribute("carrello") != null) {
            Map<String, Integer> carrello = (Map<String, Integer>) session.getAttribute("carrello");
            ProdottoDAO prodottoDAO = new ProdottoDAO();
            for (Map.Entry<String, Integer> entry : carrello.entrySet()) {
                String productId = entry.getKey();
                int quantity = entry.getValue();
                try {
                    ProdottoBean prodotto = prodottoDAO.doRetrieveByKey(productId);
                    total += prodotto.getCosto() * quantity;
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return total;
    }
%>
