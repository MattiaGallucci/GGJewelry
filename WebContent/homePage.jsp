<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="initial-scale=1, width=device-width">
<title>G&amp;G Jewelry</title>
<link rel="stylesheet" type="text/css" href="./css/structure.css">
<link rel="icon" href="images/logo.png">
</head>
<body>
	<%@ include file="../fragments/header.jsp"%>

	<div>
		<video id="video" autoplay muted loop>
			<source src="videos/diamonds.mp4" type="video/mp4">
		</video>
	</div>

	<section id="lista">
		<div id="wrapper">
			<div class="elemento">
				<a href=""><img alt="logo" src="images/logo.png" width="75"></a>
				<a href=""><span>PROVA</span></a>
			</div>
			<div class="elemento">
				<a href=""><img alt="logo" src="images/logo.png" width="75"></a>
				<a href=""><span>PROVA</span></a>
			</div>
			<div class="elemento">
				<a href=""><img alt="logo" src="images/logo.png" width="75"></a>
				<a href=""><span>PROVA</span></a>
			</div>
			<div class="elemento">
				<a href=""><img alt="logo" src="images/logo.png" width="75"></a>
				<a href=""><span>PROVA</span></a>
			</div>
		</div>
	</section>
	
	<section id="main">
		<div id="anelli">
			<div class="categoria">
				<div class="parole">
					<h1 class="nomeCategoria">ANELLI</h1>
					<a href=""><span class="linkShop">Compra anelli</span></a>
				</div>
				<div class="image">
					<img alt="anelli" src="images/categoria-anelli.webp" width="550">
				</div>
			</div>
			
			<div class="prodottiWrapper">
				<div class="prodotto">
					<span>ANELLO 1</span>
					<span>ANELLO 2</span>
					<span>ANELLO 3</span>
				</div>
			</div>
		</div>
		
		<div id="anelli">
			<div class="categoria">
				<div class="parole">
					<h1 class="nomeCategoria">ANELLI</h1>
					<a href=""><span class="linkShop">Compra anelli</span></a>
				</div>
				<div class="image">
					<img alt="anelli" src="images/categoria-anelli.webp" width="550">
				</div>
			</div>
		</div>
		
		
	</section>

</body>
</html>