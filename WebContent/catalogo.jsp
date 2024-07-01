<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.ProdottoBean"%>
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

    <title>Catalogo</title>

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
        List<ProdottoBean> prodotti = (List<ProdottoBean>) request.getSession().getAttribute("prodotti");
        Iterator<ProdottoBean> iterProdotto = prodotti.iterator();
%>

<!-- Page Title Area Start -->
<div id="page-title-area">
    <div class="container">
        <div class="row">
            <div class="col-12 text-center">
                <div class="page-title-content">
                    <h1>Catalogo</h1>
                    <ul class="breadcrumb">
                        <li><a href="homePage.jsp">Home</a></li>
                        <li><a href="catalogo.jsp" class="active">Catalogo</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Page Title Area End -->

<!-- Page Content Wrapper Start -->
<div id="page-content-wrapper" class="p-9">
    <div class="ruby-container">
        <div class="row">
            <!-- Shop Page Content Start -->
            <div class="col-lg-12">
                <div class="shop-page-content-wrap">
                    <div class="shop-page-products-wrap">
                        <div class="products-wrapper">
                            <div class="row">
                                <% 
                                    for (ProdottoBean prodotto : prodotti) {
                                %>
                                <div class="col-lg-4 col-sm-6">
                                    <!-- Single Product Item -->
                                    <div class="single-product-item text-center">
                                        <figure class="product-thumb">
                                            <a href="DettaglioProdotto?id=<%= prodotto.getId() %>">
                                                <img src="<%= prodotto.getImmagine() %>"
                                                    alt="<%= prodotto.getNome() %>" class="img-fluid">
                                            </a>
                                        </figure>
                                        <div class="product-details">
                                            <h2><a href="DettaglioProdotto?id=<%= prodotto.getId() %>"><%= prodotto.getNome() %></a></h2>
                                            <!-- Example to show product description -->
                                            <p class="products-desc"><%= prodotto.getDescrizione() %></p>
                                            <!-- Example to show product price -->
                                            <span class="price">$<%= prodotto.getCosto() %></span>
                                            <!-- Example to show product quantity -->
                                            <p class="products-desc">Quantità disponibile: <%= prodotto.getQuantita() %></p>
                                            <!-- Assuming you have a category name attribute -->
                                            <p class="products-desc">Categoria: <%= prodotto.getCategoriaNome() %></p>
	                                        
	                                        
	                                        
	                                        <%
                                            if(request.getSession().getAttribute("admin") == Boolean.TRUE) {
                                            %>       	
                                            	<button class="btn-add-to-cart" onclick="window.location.href='modificaProdotto?mode=modifica&prodotto=<%= prodotto.getId() %>'">Modifica prodotto</button>
                                            <% 
                                            } else {
                                                if(request.getSession().getAttribute("logged") != null) {
                                                %>
                                                    <button class="btn-add-to-cart" onclick="addToCart('<% out.print(prodotto.getId()); %>')" value="Acquista">Acquista</button>
                                                <%
                                                } else {
                                                    if(prodotto.getQuantita() != 0) {
                                                    %>   
                                                        <button class="btn-add-to-cart" onclick="window.location.href='loginPage.jsp'" value="Acquista">Accedi per acquistare</button>
                                                    <% 
                                                    } else { 
                                                    %>
                                                        <button class="btn-add-to-cart" value="Acquista">Esaurito</button>
                                                    <%
                                                    }
                                                }	
                                            }
                                            %>
				                            
				                            
				                            
                                            
                                        </div>
                                    </div>
                                    <!-- Single Product Item -->
                                </div>
                                <% } %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Shop Page Content End -->
        </div>
    </div>
</div>
<!-- Page Content Wrapper End -->

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

<script src="assets/js/addedToCart.js"></script>
		
</body>

</html>
