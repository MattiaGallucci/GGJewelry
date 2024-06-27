<!DOCTYPE html>
<%@page import="java.util.Iterator"%>
<%@page import="model.ProdottoBean"%>
<%@page import="java.util.List"%>
<html class="no-js" lang="zxx">
<%
    List<ProdottoBean> prodottiCasuali = (List<ProdottoBean>) request.getSession().getAttribute("randomProdotti");
%> 
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="meta description">

    <title>G&G Jewelry</title> 

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


<!--== Banner // Slider Area Start ==-->
<section id="banner-area">
    <div class="ruby-container">
        <div class="row">
            <div class="col-lg-12">
                <div id="banner-carousel" class="owl-carousel">
                    <!-- Banner Single Carousel Start -->
                    <div class="single-carousel-wrap slide-item-1">
                        <div class="banner-caption text-center text-lg-left">
                            <h4>G&G Jewelry</h4>
                            <h3>Presto fuori!!</h3>
                            <h2>Anello Angel</h2>
                            <p>L'anello "Anello Angel" è un'opera d'arte. Realizzato in oro bianco 18 carati, il suo design elegante incornicia una splendida pietra centrale. </p>
                             
                        </div>
                    </div>
                    <!-- Banner Single Carousel End -->

                    <!-- Banner Single Carousel Start -->
                    <div class="single-carousel-wrap slide-item-2">
                        <div class="banner-caption text-center text-lg-left">
                            <h4>Nuova Collezione 2024</h4>
                            <h3>Presto fuori!!</h3>
                            <h2>Collana boreale</h2>
                            <p>Il set collana "boreale" è una creazione raffinata e incantevole, ideale per illuminare ogni occasione speciale</p>
                             
                        </div>
                    </div>
                    <!-- Banner Single Carousel End -->
                </div>
            </div>
        </div>
    </div>
</section>
<!--== Banner Slider End ==-->

<!--== About Us Area Start ==-->
<section id="aboutUs-area" class="pt-9">
    <div class="ruby-container">
        <div class="row">
            <div class="col-lg-6">
                <!-- About Image Area Start -->
                <div class="about-image-wrap">
                    <a href="about.html"><img src="assets/img/about-img.png" alt="About Us" class="img-fluid"/></a>
                </div>
                <!-- About Image Area End -->
            </div>

            <div class="col-lg-6 m-auto">
                <!-- About Text Area Start -->
                <div class="about-content-wrap ml-0 ml-lg-5 mt-5 mt-lg-0">
                    <h2>Chi siamo</h2>
                    <h3>SIAMO VISIONARI</h3>
                    <div class="about-text">
                        <p>
                            Benvenuti da G&G Jewelry, dove l'arte della gioielleria prende vita. Da anni siamo specializzati nella creazione e vendita di gioielli unici 
                            e di alta qualità, realizzati con passione e maestria artigianale. Ogni pezzo che trovate nel nostro negozio è una testimonianza del nostro impegno 
                            per l'eccellenza, combinando design innovativi con materiali preziosi. 

                        </p>
                        
                        <p> 
                            Che siate alla ricerca di un regalo speciale o di un pezzo esclusivo per voi stessi,
                            da G&G Jewelry troverete un servizio personalizzato e una collezione che incanta e ispira. La nostra missione è trasformare ogni desiderio in realtà, 
                            creando gioielli che raccontano storie e celebrano momenti indimenticabili.
                        </p>

                        <h4 class="vertical-text">CHI SIAMO?</h4>
                    </div>
                </div>
                <!-- About Text Area End -->
            </div>
        </div>
    </div>
</section>
<!--== About Us Area End ==-->

<!--== New Collection Area Start ==-->
<section id="new-collection-area" class="p-9">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="section-title">
                    <h2>Nuova Collezione di prodotti</h2>
                    <p>Prodotti in Saldo.</p>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="new-collection-tabs">
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="feature-products" role="tabpanel" aria-labelledby="feature-products-tab">
                            <div class="products-wrapper">
                                <div class="products-carousel owl-carousel">
                                    <% for (ProdottoBean prodotto : prodottiCasuali) { %>
                                    <!-- Loop through the randomProducts stored in session -->
                                    <div class="single-product-item text-center">
                                        <figure class="product-thumb">
                                            <a href="DettaglioProdotto?id=<%= prodotto.getId() %>">
                                                <img src="<%= prodotto.getImmagine() %>" alt="<%= prodotto.getNome() %>" class="img-fluid">
                                            </a>
                                        </figure>
                                    <div class="product-details">
                                        <h2><a href="DettaglioProdotto?id=<%= prodotto.getId() %>"><%= prodotto.getNome() %></a></h2>
                                        <span class="price">$<%= prodotto.getCosto() %></span>
                                        <% 
                                        if(request.getSession().getAttribute("logged") != null) 
									    {%>
			                           			<button class="btn-add-to-cart" onclick="addToCart('<% out.print(prodotto.getId());%>')" value="Acquista">Acquista</button>
			                            <%}
                                        else 
                                        {%>
                                        		<button class="btn-add-to-cart" onclick="window.location.href='loginPage.jsp'" value="Acquista">Accedi per acquistare</button>
                                        <%}	
			                            %>
			                            
                                        
                                    </div>
                                    </div>
                                    <% } %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--== New Collection Area End ==-->
 

<!--== Testimonial Area Start ==-->
<section id="testimonial-area">
    <div class="ruby-container">
        <div class="testimonial-wrapper">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <!-- Section Title Start -->
                    <div class="section-title">
                        <h2>Le persone cosa pensano di noi</h2>
                        <p>Feedbacks</p>
                    </div>
                    <!-- Section Title End -->
                </div>
            </div>

            <div class="row">
                <div class="col-lg-7 m-auto text-center">
                    <div class="testimonial-content-wrap">
                        <div id="testimonialCarousel" class="owl-carousel">
                            <div class="single-testimonial-item">
                                <p>
                                    "Ho recentemente acquistato un anello da G&G Jewelry e non potrei essere più soddisfatto della mia esperienza.
                                    l'assistentenza è stata estremamente competente e paziente, aiutandomi a trovare il gioiello perfetto per il mio anniversario.
                                </p>

                                <h3 class="client-name">Angela Mercanti</h3>
                                 
                            </div>

                            <div class="single-testimonial-item">
                                <p>
                                    Consiglio vivamente Eterna Gioielli a chiunque cerchi un gioiello unico e di alta qualità. Non vedo l'ora di tornare per i miei futuri acquisti!"
                                </p>

                                <h3 class="client-name">Maria Boreali</h3>
                                 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</section>
<!--== Testimonial Area End ==-->

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