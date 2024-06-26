$(document).ready( function() {
	updatePrice();
});

function updateCart(input,prodotto) {
	let formData = {
		prodotto: prodotto,
		mode: "update",
		quantita: $(input).val(),
	}
	
	$.ajax({
		type: "GET",
		url: "CarrelloServlet",
		data: formData,
		dataType: "html",
		success: function(data){
			if(data == "reload"){
				location.replace("./cart.jsp");
			} else {
				updatePrice();
			}
		}
	});
}

function updatePrice(){
	let formData = {
			mode: "getTotal",
		}
		
		$.ajax({
			type: "GET",
			url: "CarrelloServlet",
			data: formData,
			dataType: "html",
			success: function(data){
				
				let prezzo = parseFloat(data.replace(",", "."));
				console.log(prezzo);
				if(prezzo < 45) {
					$("#netto").html(prezzo.toFixed(2));
					$("#spedizione").html("5.00");
					prezzo += 5;
					$("#prezzoTot").html(prezzo.toFixed(2));
				} else {
				$("#netto").html(prezzo.toFixed(2));
				$("#spedizione").html("0.00");
				$("#prezzoTot").html(prezzo.toFixed(2));
				}
			}
		});
}

/*function proseguiOrdine() {
	let formData = {
			costoTot: $("#prezzoTot").html(),
	}
	
	$.ajax({
		type: "GET",
		url: "ordine",
		data: formData,
		dataType: "html",
		success: function(data){
			console.log($("#prezzoTot").html());
			window.location.replace(data);
		}
	});
}*/