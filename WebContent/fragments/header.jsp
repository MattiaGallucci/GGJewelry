<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<meta charset="ISO-8859-1">
</head>
<header>

<<<<<<< HEAD
<!--== Header Area Start ==-->
<header id="header-area">
    <div class="ruby-container">
        <div class="row">
            <!-- Logo Area Start -->
            <div class="col-3 col-lg-1 col-xl-2 m-auto">
                <a href="homePage.jsp" class="logo-area">
                    <img src="assets/img/logo.png" alt="Logo" class="img-fluid"/>
                </a>
            </div>
           
=======
	<!--== Header Area Start ==-->
	<header id="header-area">
		<div class="ruby-container">
			<div class="row">
				<!-- Logo Area Start -->
				<div class="col-3 col-lg-1 col-xl-2 m-auto">
					<a href="index.html" class="logo-area"> <img
						src="assets/img/logo.png" alt="Logo" class="img-fluid" />
					</a>
				</div>
>>>>>>> branch 'master' of https://github.com/MattiaGallucci/GGJewelry.git


				<!-- Navigation Area Start -->
				<div class="col-3 col-lg-9 col-xl-8 m-auto">
					<div class="main-menu-wrap">
						<nav id="mainmenu">
							<ul>
								<li><a href="homePage.jsp">Home</a></li>
								<li><a href="shop-full-wide.html">Shop</a></li>

								<li><a href="blog.html">Chi siamo</a></li>

								<li><a href="contact.html">Contattaci</a></li>
								<%
								Boolean isAdmin = (Boolean) request.getSession().getAttribute("admin");
								if (isAdmin != null && isAdmin.equals(Boolean.TRUE)) {
								%>
								<li><a href="contact.html">CIAO</a></li>
								<%
								}
								%>

							</ul>
						</nav>
					</div>
				</div>
				<!-- Navigation Area End -->

				<!-- BARRA LATERALE -->

				<div class="col-6 col-lg-2 m-auto">
					<div class="header-right-meta text-right">
						<ul>
							<li><a href="#" class="modal-active"><i
									class="fa fa-search"></i></a></li>
							<li class="shop-cart"><a href="#"><i
									class="fa fa-shopping-bag"></i> <span class="count">3</span></a>
								<div class="mini-cart">
									<div class="mini-cart-body">
										<div class="single-cart-item d-flex">
											<figure class="product-thumb">
												<a href="#"><img class="img-fluid"
													src="assets/img/product-1.jpg" alt="Products" /></a>
											</figure>

											<div class="product-details">
												<h2>
													<a href="#">Sprite Yoga Companion</a>
												</h2>
												<div class="cal d-flex align-items-center">
													<span class="quantity">3</span> <span
														class="multiplication">X</span> <span class="price">$77.00</span>
												</div>
											</div>
											<a href="#" class="remove-icon"><i class="fa fa-trash-o"></i></a>
										</div>
										<div class="single-cart-item d-flex">
											<figure class="product-thumb">
												<a href="#"><img class="img-fluid"
													src="assets/img/product-2.jpg" alt="Products" /></a>
											</figure>
											<div class="product-details">
												<h2>
													<a href="#">Yoga Companion Kit</a>
												</h2>
												<div class="cal d-flex align-items-center">
													<span class="quantity">2</span> <span
														class="multiplication">X</span> <span class="price">$6.00</span>
												</div>
											</div>
											<a href="#" class="remove-icon"><i class="fa fa-trash-o"></i></a>
										</div>
										<div class="single-cart-item d-flex">
											<figure class="product-thumb">
												<a href="#"><img class="img-fluid"
													src="assets/img/product-3.jpg" alt="Products" /></a>
											</figure>
											<div class="product-details">
												<h2>
													<a href="#">Sprite Yoga Companion Kit</a>
												</h2>
												<div class="cal d-flex align-items-center">
													<span class="quantity">1</span> <span
														class="multiplication">X</span> <span class="price">$116.00</span>
												</div>
											</div>
											<a href="#" class="remove-icon"><i class="fa fa-trash-o"></i></a>
										</div>
									</div>
									<div class="mini-cart-footer">
										<a href="checkout.html" class="btn-add-to-cart">Checkout</a>
									</div>
								</div></li>
						</ul>
					</div>
				</div>
				<!-- Header Right Meta End -->

			</div>
		</div>
	</header>
</header>
</html>