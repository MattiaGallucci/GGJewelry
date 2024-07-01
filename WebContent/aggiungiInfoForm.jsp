<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="meta description">
    <title>Aggiungi Informazioni</title> 
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
                    <h1>Aggiungi Informazioni</h1>
                    <ul class="breadcrumb">
                        <li><a href="homePage.jsp">Home</a></li>
                       	<li><a href="memberArea.jsp">Indietro</a></li>
                        <li><a class="active">Aggiungi Informazoni</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!--== Page Title Area End ==-->

<% String target = (String) request.getAttribute("target"); 
		String utente = (String) request.getAttribute("email");
		String error = (String) request.getSession().getAttribute("error");
		
		if(error != null){%> 
			<p><%out.println(error); %>
		<% request.getSession().removeAttribute("error");
		}
		if (target.equals("indirizzo")) {%>

<!--== Page Content Wrapper Start ==-->
<div id="page-content-wrapper" class="p-9">
    <div class="container">
        <div class="row">
            <div class="col-lg-7 m-auto">
                <div class="login-register-wrapper">
                    <div class="tab-content" id="login-reg-tabcontent">
                        <div class="tab-pane fade show active" id="register" role="tabpanel">
                            <div class="login-reg-form-wrap">
                                <form action="modificaInfo" method="post">
                                <input type="hidden" name="utente" value="<%= request.getSession().getAttribute("email")%>">
								<input type="hidden" name="target" value="indirizzo">
								<input type="hidden" name="mode" value="add">
	                                <div class="single-input-item">
	                                    <input type="text" placeholder="Via" id="via" name="via" required>
	                                </div>
                                    <div class="single-input-item">
                                        <input type="text" placeholder="Città" id="citta" name="citta" required>
                                    </div>
                                    <div class="single-input-item">
                                        <input type="text" placeholder="CAP" id="CAP" name="CAP" required></input>
                                    </div>
                                    <div class="single-input-item">
                                        <input type="text" placeholder="Civico" id="civico" name="civico" required>
                                    </div>
                                    <div class="single-input-item">
                                        <input type="text" placeholder="Provincia" id="provincia" name="provincia" required>
                                    </div>
                                    <div class="single-input-item">
                                        <button class="btn-login" type="submit">Aggiungi Indirizzo</button>
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

<% } else if (target.equals("metodoPagamento")) {%>
<!--== Page Content Wrapper Start ==-->
<div id="page-content-wrapper" class="p-9">
    <div class="container">
        <div class="row">
            <div class="col-lg-7 m-auto">
                <div class="login-register-wrapper">
                    <div class="tab-content" id="login-reg-tabcontent">
                        <div class="tab-pane fade show active" id="register" role="tabpanel">
                            <div class="login-reg-form-wrap">
                                <form action="modificaInfo" method="post">
                                <input type="hidden" name="utente" value="<%= request.getSession().getAttribute("email")%>">
								<input type="hidden" name="target" value="metodoPagamento">
								<input type="hidden" name="mode" value="add">
	                                <div class="single-input-item">
	                                        <select required id="tipo" name="tipo">
							 					<!-- <option value="IBAN" selected>IBAN</option> -->
							 					<option value="carta">Carta</option>
				        					</select>
	                                </div>
                                    <!-- <div class="single-input-item">
                                        <input type="text" placeholder="IBAN" id="iban" name="iban">
                                    </div> -->
                                    <div class="single-input-item">
                                        <input type="text" placeholder="XXXX-XXXX-XXXX-XXXX" id="carta" name="carta" required>
                                    </div>
                                    <div class="single-input-item">
                                        <button class="btn-login" type="submit">Aggiungi Metodo di Pagamento</button>
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
<%}%>


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
