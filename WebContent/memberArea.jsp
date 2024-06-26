<%@page import="model.IndirizzoBean"%>
<%@page import="model.IndirizzoDAO"%>
<%@page import="model.MetodoDiPagamentoBean"%>
<%@page import="model.MetodoDiPagamentoDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="model.OrdineDao"%>
<%@page import="model.OrdineBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="meta description">

    <title>Area utente</title>

    <!--=== Favicon ===-->
    <link rel="shortcut icon" href="assets/img/favicon.ico" type="image/x-icon"/>

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

<!--== Page Title Area Start ==-->
<div id="page-title-area">
    <div class="container">
        <div class="row">
            <div class="col-12 text-center">
                <div class="page-title-content">
                    <h1>Area Utente</h1>
                    <ul class="breadcrumb">
                        <li><a href="homePage.jsp">Home</a></li>
                        <li><a href="memberArea.jsp" class="active">Area Utente</a></li>
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
            <div class="col-lg-12">
                <!-- My Account Page Start -->
                <div class="myaccount-page-wrapper">
                    <!-- My Account Tab Menu Start -->
                    <div class="row">
                        <div class="col-lg-3">
                            <div class="myaccount-tab-menu nav" role="tablist">
                                <a href="#dashboad" class="active" data-toggle="tab"><i class="fa fa-dashboard"></i>
                                    Area utente</a>

                                <a href="#orders" data-toggle="tab"><i class="fa fa-cart-arrow-down"></i> Ordini</a>

                                <a href="#address" data-toggle="tab"><i class="fa fa-map-marker"></i>Indirizzo</a>
                                
                                <a href="#payment-method" data-toggle="tab"><i class="fa fa-map-marker"></i>Metodi di Pagamento</a>

                                <a href="#account-info" data-toggle="tab"><i class="fa fa-user"></i> Informazioni account</a>

                                <a href="LogOutServlet"><i class="fa fa-sign-out"></i> Logout</a>
                            </div>
                        </div>
                        <!-- My Account Tab Menu End -->

                        <!-- My Account Tab Content Start -->
                        <div class="col-lg-9 mt-5 mt-lg-0">
                            <div class="tab-content" id="myaccountContent">
                                <!-- Single Tab Content Start -->
                                <div class="tab-pane fade show active" id="dashboad" role="tabpanel">
                                    <div class="myaccount-content">
                                        <h3>Area Utente</h3>

                                        <div class="welcome">
                                            <p><%
												Boolean isLoggedIn = (Boolean) session.getAttribute("logged");
										        if (isLoggedIn != null && isLoggedIn) {
										            String nome = (String) session.getAttribute("nome");
										            String cognome = (String) session.getAttribute("cognome");
										            out.println("<p>Bentornato, " + nome + " " + cognome + "!</p>");
										        } else {
										            out.println("<p>Perfavore <a href='loginPage.jsp'>accedi</a> per continuare.</p>");
										        }
										
										        
 												%>
                                        </div>

                                        <p class="mb-0">Dalla dashboard del tuo account. puoi facilmente controllare e visualizzare il tuo
                                            ordini recenti, gestisci i tuoi indirizzi di spedizione e fatturazione e modifica i tuoi
                                            password e dettagli dell'account.
                                         </p>
                                    </div>
                                </div>
                                <!-- Single Tab Content End -->




								
                                <!-- Single Tab Content Start -->
<div class="tab-pane fade" id="orders" role="tabpanel">
    <div class="myaccount-content">
        <h3>I tuoi Ordini</h3>

        

        <div class="myaccount-table table-responsive text-center">
            <table class="table table-bordered">
                <thead class="thead-light">
                    <tr>
                        <th>ID</th>
                        <th>Data</th>
                        <th>Costo Totale</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%-- Recupero gli ordini del cliente loggato --%>
                    <%
                        OrdineDao ordineDAO = new OrdineDao();
                        String userEmail = (String) session.getAttribute("email");
                        List<OrdineBean> ordini = null;

                        if (userEmail != null && !userEmail.isEmpty()) {
                            try {
                                ordini = ordineDAO.doRetrieveByEmail(userEmail);
                            } catch (Exception e) {
                                out.println("Errore: " + e.getMessage());
                            }
                        }

                        if (ordini != null && !ordini.isEmpty()) {
                            for (OrdineBean ordine : ordini) {
                    %>
                    <tr>
                        <td><%= ordine.getId() %></td>
                        <td><%= ordine.getData() %></td>
                        <td><%= ordine.getCostoTotale() %></td>
                        <td><a href="viewOrder.jsp?id=<%= ordine.getId() %>" class="btn-add-to-cart">View</a></td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="4">Nessun ordine trovato per l'email <%= userEmail %>.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- Single Tab Content End -->





                                <!-- Single Tab Content Start -->
                                <!-- Single Tab Content Start -->
<div class="tab-pane fade" id="payment-method" role="tabpanel">
    <div class="myaccount-content">
        <h3>I tuoi Metodi di Pagamento</h3>

        <div class="myaccount-table table-responsive text-center">
            <table class="table table-bordered">
                <thead class="thead-light">
                    <tr>
                        <th>Tipo</th>
                        <th>Ultime 4 cifre</th>
                    </tr>
                </thead>
                <tbody>
                    <%-- Recupero i metodi di pagamento del cliente loggato --%>
                    <%
                        MetodoDiPagamentoDAO metodoDiPagamentoDAO = new MetodoDiPagamentoDAO();
                        List<MetodoDiPagamentoBean> metodiDiPagamento = null;

                        if (userEmail != null && !userEmail.isEmpty()) {
                            try {
                                metodiDiPagamento = metodoDiPagamentoDAO.doRetrieveByEmail(userEmail);
                            } catch (Exception e) {
                                out.println("Errore: " + e.getMessage());
                            }
                        }

                        if (metodiDiPagamento != null && !metodiDiPagamento.isEmpty()) {
                            for (MetodoDiPagamentoBean metodo : metodiDiPagamento) {
                    %>
                    <tr>
                        <td><%= metodo.getTipo() %></td>
                        <td><%= metodo.getNumeroCarta() %></td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="3">Nessun metodo di pagamento trovato per l'email <%= userEmail %>.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- Single Tab Content End -->

                                <!-- Single Tab Content End -->








                                <!-- Single Tab Content Start -->
                                <!-- Single Tab Content Start -->
<div class="tab-pane fade" id="address" role="tabpanel">
    <div class="myaccount-content">
        <h3>I tuoi Indirizzi di Spedizione</h3>

        <div class="myaccount-table table-responsive text-center">
            <table class="table table-bordered">
                <thead class="thead-light">
                    <tr>
                        <th>Citt�</th>
                        <th>Provincia</th>
                        <th>CAP</th>
                        <th>Via</th>
                        <th>Civico</th>
                    </tr>
                </thead>
                <tbody>
                    <%-- Recupero gli indirizzi di spedizione dell'utente loggato --%>
                    <%
                        IndirizzoDAO indirizzoDAO = new IndirizzoDAO();
                        List<IndirizzoBean> indirizzi = null;

                        if (userEmail != null && !userEmail.isEmpty()) {
                            try {
                                indirizzi = indirizzoDAO.doRetrieveByEmail(userEmail);
                            } catch (Exception e) {
                                out.println("Errore: " + e.getMessage());
                            }
                        }

                        if (indirizzi != null && !indirizzi.isEmpty()) {
                            for (IndirizzoBean indirizzo : indirizzi) {
                    %>
                    <tr>
                        <td><%= indirizzo.getCitta() %></td>
                        <td><%= indirizzo.getProvincia() %></td>
                        <td><%= indirizzo.getCap() %></td>
                        <td><%= indirizzo.getVia() %></td>
                        <td><%= indirizzo.getCivico() %></td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="6">Nessun indirizzo trovato per l'email <%= userEmail %>.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- Single Tab Content End -->

                                <!-- Single Tab Content End -->






                                <!-- Single Tab Content Start -->
                                <div class="tab-pane fade" id="account-info" role="tabpanel">
                                    <div class="myaccount-content">
                                        <h3>Account Details</h3>

                                        <div class="account-details-form">
                                            <form action="#">
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <div class="single-input-item">
                                                            <label for="first-name" class="required">First Name</label>
                                                            <input type="text" id="first-name"
                                                                   placeholder="First Name"/>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-6">
                                                        <div class="single-input-item">
                                                            <label for="last-name" class="required">Last Name</label>
                                                            <input type="text" id="last-name" placeholder="Last Name"/>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="single-input-item">
                                                    <label for="display-name" class="required">Display Name</label>
                                                    <input type="text" id="display-name" placeholder="Display Name"/>
                                                </div>

                                                <div class="single-input-item">
                                                    <label for="email" class="required">Email Addres</label>
                                                    <input type="email" id="email" placeholder="Email Address"/>
                                                </div>

                                                <fieldset>
                                                    <legend>Password change</legend>
                                                    <div class="single-input-item">
                                                        <label for="current-pwd" class="required">Current
                                                            Password</label>
                                                        <input type="password" id="current-pwd"
                                                               placeholder="Current Password"/>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-lg-6">
                                                            <div class="single-input-item">
                                                                <label for="new-pwd" class="required">New
                                                                    Password</label>
                                                                <input type="password" id="new-pwd"
                                                                       placeholder="New Password"/>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-6">
                                                            <div class="single-input-item">
                                                                <label for="confirm-pwd" class="required">Confirm
                                                                    Password</label>
                                                                <input type="password" id="confirm-pwd"
                                                                       placeholder="Confirm Password"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </fieldset>

                                                <div class="single-input-item">
                                                    <button class="btn-login btn-add-to-cart">Save Changes</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <!-- Single Tab Content End -->
                                
                                
                                
                                
                                
                            </div>
                        </div>
                        <!-- My Account Tab Content End -->
                    </div>
                </div>
                <!-- My Account Page End -->
            </div>
        </div>
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
