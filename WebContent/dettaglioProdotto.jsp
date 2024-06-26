<%@page import="model.ProdottoBean"%>
<%@page import="model.*" import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="meta description">
    <title>Dettaglio Prodotto</title>
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Droid+Serif:400,400i,700,700i"/>
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Montserrat:400,700"/>
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i"/>
    <link href="assets/css/vendor/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/vendor/font-awesome.css" rel="stylesheet">
    <link href="assets/css/plugins.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
    <script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<jsp:include page="fragments/header.jsp" />

<% 
ProdottoBean prodotto = (ProdottoBean) request.getAttribute("prodotto");
if (prodotto == null) {
    response.sendRedirect("error.jsp");
    return;
}
%>

<!-- Page Title Area Start -->
<div id="page-title-area">
    <div class="container">
        <div class="row">
            <div class="col-12 text-center">
                <div class="page-title-content">
                    <ul class="breadcrumb">
                        <li><a href="homePage.jsp">Home</a></li>
                        <li><a href="catalogo.jsp">Catalogo</a></li>
                        <li><a href="dettaglioProdotto.jsp" class="active"><%= prodotto.getNome() %></a></li>
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
            <!-- Single Product Page Content Start -->
            <div class="col-lg-12">
                <div class="single-product-page-content">
                    <div class="row">
                        <!-- Product Thumbnail Start -->
                        <div class="col-lg-5">
                            <div class="product-thumbnail-wrap">
                                <div class="product-thumb-carousel owl-carousel">
                                    <div class="single-thumb-item">
                                        <img class="img-fluid" src="<%= prodotto.getImmagine() %>" alt="Product">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Product Thumbnail End -->

                        <!-- Product Details Start -->
                        <div class="col-lg-7 mt-5 mt-lg-0">
                            <div class="product-details">
                                <h2><a href="DettaglioProdotto"><%= prodotto.getNome() %></a></h2>
                                <span class="price"><%= prodotto.getCosto() %></span>
                                <% if(prodotto.getQuantita() == 0) { %>
                                <div class="product-info-stock-sku">
                                    <span class="product-stock-status">Non disponibile</span>
                                </div>
                                <% } else { %>
                                <div class="product-info-stock-sku">
                                    <span class="product-stock-status">Disponibile</span>
                                </div>
                                <% } %>
                                <p class="products-desc"><%= prodotto.getDescrizione() %></p>                                  
                                <div class="product-quantity d-flex align-items-center">
                                    <div class="quantity-field">
                                        <label for="qty">Quantità</label>
                                        <input type="number" id="quantita" name="quantita" min="1" max="<%= prodotto.getQuantita() %>" value="1"/>
                                    </div>
									<button class="btn btn-add-to-cart" onclick="addToCartN('<% out.print(prodotto.getId());%>')" value="Acquista">Acquista</button>                                    
                                </div>
                            </div>
                        </div>
                        <!-- Product Details End -->
                    </div>
                </div>
            </div>
            <!-- Single Product Page Content End -->
        </div>
    </div>
</div>
<!-- Page Content Wrapper End -->

<jsp:include page="fragments/footer.jsp" />
<!-- Scroll to Top Start -->
<a href="#" class="scrolltotop"><i class="fa fa-angle-up"></i></a>
<!-- Scroll to Top End -->

<!--=======================Javascript============================-->
<script src="assets/js/vendor/jquery-3.3.1.min.js"></script>
<script src="assets/js/vendor/jquery-migrate-1.4.1.min.js"></script>
<script src="assets/js/vendor/popper.min.js"></script>
<script src="assets/js/vendor/bootstrap.min.js"></script>
<script src="assets/js/plugins.js"></script>
<script src="assets/js/active.js"></script>

<script src="assets/js/addedToCart.js"></script>

</body>
</html>
