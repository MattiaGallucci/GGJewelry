function addToCart(prodotto) {
	let formData = {
			mode: "add",
			prodotto: prodotto,
			quantita: "1",
			catalogo: "catalogo",
	};
	$.ajax({
			type: "GET",
			url: "CarrelloServlet",
			data: formData,
			dataType: "html",
		})
}
function addToCartN(prodotto) {
	let formData = {
			mode: "add",
			prodotto: prodotto,
			quantita: $("#quantita").val(),
			catalogo: "catalogo",
	};
	$.ajax({
		type: "GET",
		url: "CarrelloServlet",
		data: formData,
		dataType: "html",
	})
}