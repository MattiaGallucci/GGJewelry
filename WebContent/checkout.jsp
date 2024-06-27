<%@page import="model.MetodoDiPagamentoBean"%>
<%@page import="model.MetodoDiPagamentoDAO"%>
<%@page import="model.IndirizzoBean"%>
<%@page import="model.IndirizzoDAO"%>
<%@page import="model.ProdottoBean"%>
<%@page import="model.ProdottoDAO"%>
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

<%
    String userEmail = (String) session.getAttribute("email");

    IndirizzoDAO indirizzoDAO = new IndirizzoDAO();
    List<IndirizzoBean> listaIndirizzi = null;
    
    MetodoDiPagamentoDAO metodoDiPagamentoDAO = new MetodoDiPagamentoDAO();
    List<MetodoDiPagamentoBean> listaMetodi = null;

    if (userEmail != null && !userEmail.isEmpty()) {
        try {
            listaIndirizzi = indirizzoDAO.doRetrieveByEmail(userEmail);
            listaMetodi = metodoDiPagamentoDAO.doRetrieveByEmail(userEmail);
        } catch (Exception e) {
            out.println("Errore: " + e.getMessage());
        }
    }
    Iterator<MetodoDiPagamentoBean> iterMetodiPagamento = listaMetodi.iterator();
    Iterator<IndirizzoBean> iterIndirizzi = listaIndirizzi.iterator(); 
    
    IndirizzoBean indirizzo = new IndirizzoBean();
    MetodoDiPagamentoBean metodoPagamento = new MetodoDiPagamentoBean();
%>

<%
    Map<String, Integer> carrello = (Map<String, Integer>) request.getSession().getAttribute("carrello");
    List<ProdottoBean> prodotti = (List<ProdottoBean>) request.getSession().getAttribute("prodotti");

    double totale = 10;
%>
                        
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
                    <h2>Scegli indirizzo</h2>
                    <% while(iterIndirizzi.hasNext()) {
                        indirizzo = iterIndirizzi.next();
                    %>
                        <input type="radio" name="indirizzo" id="indirizzo" value="<% out.print(indirizzo.getId()); %>">
                        &nbsp;&nbsp;
                        <label for="indirizzo"><% out.println(indirizzo.getVia() + " " + indirizzo.getCivico() + " " 
                            + indirizzo.getCitta() + " " + indirizzo.getCap() + " " + indirizzo.getProvincia()); %></label><br><br>
                    <% } %>
                    <form action="modificaInfo" method="get">
                        <input type="hidden" value="<% out.print(request.getSession().getAttribute("utente")); %>" name="utente">
                        <input type="hidden" name="mode" value="add">
                        <input type="hidden" name="target" value="indirizzo">
                        <button class="btn btn-primary mb-3">Aggiungi indirizzo</button>
                    </form>
                </div>
                <div class="checkout-billing-details-wrap">
                    <h2>Scegli metodo di pagamento</h2>
					<% while(iterMetodiPagamento.hasNext()) {
					    metodoPagamento = iterMetodiPagamento.next();
					    if(!metodoPagamento.getTipo().equals("iban")) { %>
					        <input type="radio" name="metodoPagamento" id="metodoPagamento" value="<% out.print(metodoPagamento.getId()); %>">
					        <label for="pagamento"><% out.println(metodoPagamento.getTipo() + " " + metodoPagamento.getNumeroCarta()); %></label><br><br>
					    <% } 
					} %>
                    <form action="modificaInfo" method="get">
                        <input type="hidden" value="<% out.print(request.getSession().getAttribute("utente")); %>" name="utente">
                        <input type="hidden" name="mode" value="add">
                        <input type="hidden" name="target" value="metodoPagamento">
                        <button class="btn btn-primary mb-3">Aggiungi metodo di pagamento</button>
                    </form>
                </div>
            </div>

            <div class="col-lg-6 mt-5 mt-lg-0">
                <div class="order-summary-details">
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
                                    <% Iterator<String> iterKeys = carrello.keySet().iterator();
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
                                            double prezzoTotaleProdotto = prodotto.getCosto() * quantita;
                                            totale += prezzoTotaleProdotto;
                                    %>
                                    <tr>
                                        <td><%= prodotto.getNome() %> x <%= quantita %></td>
                                        <td>$<%= prezzoTotaleProdotto %></td>
                                    </tr>
                                    <% }
                                    } %>
                                </tbody>
                                <tfoot>
                         	        <tr>
                                         
                                    <td>Spedizione</td>
                                        <td><strong>$10</strong></td>
                                    </tr>
                                    <tr>
                                         
                                        <td>Totale</td>
                                        <td><strong>$<%= totale %></strong></td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>

                        <div class="order-payment-method">
                            <div class="summary-footer-area">

                                <a href="completeOrderServlet" class="btn-add-to-cart">Completa Ordine</a>
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

<!--=======================Javascript============================-->
<!--=== Jquery Min Js ===-->
<script src="assets/js/vendor/jquery-3.3.1.min.js"></script>
<!--=== Jquery Migrate Min Js ===-->
<script src="assets/js/vendor/jquery-migrate-1.4.1.min.js"></script>
<!--=== Popper Min Js ===-->
<script src="assets/js/vendor/popper.min.js"></script>
<!--=== Bootstrap Min Js ===-->
<script src="assets/js/vendor/bootstrap.min.js"></script>
<!--=== Plugins Js ===-->
<script src="assets/js/plugins.js"></script>

<!--=== Active Js ===-->
<script src="assets/js/active.js"></script>
</body>
</html>
