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
								<li><a href="catalogo?mode=home">Home</a></li>
								<li><a href="catalogo">Catalogo</a></li>
								<li><a href="contact.jsp">Contattaci</a></li>
								<!-- <%/*
								Boolean isAdmin = (Boolean) request.getSession().getAttribute("admin");
								if (isAdmin != null && isAdmin.equals(Boolean.TRUE)) {
								*/%>
								<li><a href="adminArea.jsp">Prodotti</a></li>
								<%/*
								} 
								*/%> -->

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
						    <% if(request.getSession().getAttribute("logged") == null) {%>
							    <a href="loginPage.jsp">
							    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
							    	
	  								<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
								</svg>
								</a>
							<%} else if(request.getSession().getAttribute("admin") == Boolean.TRUE){ %>
								<a href="adminArea.jsp">
								<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
								    	
		  							<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
								</svg>
								</a>
								<%} else{%>
								<a href="memberArea.jsp">
								<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
								    	
		  							<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
								</svg>
								</a>
								<%} %>
							</li>
							
							<% if(request.getSession().getAttribute("logged") != null) 
						    {%>
                            <li class="shop-cart">
                            		<a href="cart.jsp"><i
                                    class="fa fa-shopping-bag"></i></a>
                            <%} 
                            %>

						</ul>
					</div>
				</div>
				<!-- Header Right Meta End -->

			</div>
		</div>
	</header>
</html>