<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<meta charset="ISO-8859-1">
</head>
<!--== Header Area Start ==-->
<header id="header-area">
		<div class="ruby-container">
			<div class="row">
				<!-- Logo Area Start -->
				<div class="col-3 col-lg-1 col-xl-2 m-auto">
					<a href="homePage.jsp" class="logo-area"> <img
						src="assets/img/logo.png" alt="Logo" class="img-fluid" />
					</a>
				</div>


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
						    <li>
							    <a href="loginPage.jsp">
							    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
							    	
	  								<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
								</svg>
								</a>
							</li>
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