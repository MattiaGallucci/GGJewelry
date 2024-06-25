<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="meta description">

    <title>Member Area</title> 

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
                    <h1>Member Area</h1>
                    <ul class="breadcrumb">
                        <li><a href="homePage.jsp">Home</a></li>
                        <li><a href="loginPage.jsp." class="active">Login & Register</a></li>
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
            <div class="col-lg-7 m-auto">
                <!-- Login & Register Content Start -->
                <div class="login-register-wrapper">
                    <!-- Login & Register tab Menu -->
                    <nav class="nav login-reg-tab-menu">
                        <a class="active" id="login-tab" data-toggle="tab" href="#login">Login</a>
                        <a id="register-tab" data-toggle="tab" href="#register">Register</a>
                    </nav>
                    <!-- Login & Register tab Menu -->

                    <div class="tab-content" id="login-reg-tabcontent">
                        <div class="tab-pane fade show active" id="login" role="tabpanel">
                            <div class="login-reg-form-wrap">
                                <form action="login" method="post">
                                <% 
                                String error = (String) session.getAttribute("error");
										        if (error != null) {
										            out.println("<p style='color:red;'>" + error + "</p>");
										            session.removeAttribute("error"); // Rimuovi l'attributo per evitare di visualizzarlo nuovamente
										        }
								%>
                                    <div class="single-input-item">
                                        <input type="text" placeholder="Enter your Username" id="username" name="username" required/>
                                    </div>

                                    <div class="single-input-item">
                                        <input type="password" placeholder="Enter your Password" id="password" name="password" required/>
                                    </div>

                                    <div class="single-input-item">
                                        <button class="btn-login">Login</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="register" role="tabpanel">
                            <div class="login-reg-form-wrap">
                                <form action="registrazione" id="registrazione" method="post" autocomplete="off">
								    <div class="single-input-item">
								        <input type="text" placeholder="Nome" id="nome" name="nome" required/>
								        <p style="color:red;" id="error-name"></p>
								    </div>
								    <div class="single-input-item">
								        <input type="text" placeholder="Cognome" name="cognome" id="cognome" required/>
								        <p style="color:red;" id="error-surname"></p>
								    </div>
								    <div class="single-input-item">
								        <input type="text" placeholder="Username" id="username" name="username" required/>
								        <p style="color:red;" id="error-username"></p>
								    </div>
								    <div class="single-input-item">
								        <input type="email" placeholder="Enter your Email" name="email" id="email" required>
								    </div>
								
								    <div class="row">
								        <div class="col-lg-6">
								            <div class="single-input-item">
								                <input type="password" placeholder="Enter your Password" id="password" name="password" required/>
								            </div>
								        </div>
								
								        <div class="col-lg-6">
								            <div class="single-input-item">
								                <input type="password" placeholder="Repeat your Password" id="passwordCheck" name="passwordCheck" required/>
								            </div>
								        </div>
								    </div>
								
								    <div class="single-input-item">
								        <input class="btn-login" type="submit" id="registrati" value="Registrati">
								    </div>
								</form>
							</div>
                        </div>
                    </div>
                </div>
                <!-- Login & Register Content End -->
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
<script src="assets/js/validate.js"></script>
</body>

</html>