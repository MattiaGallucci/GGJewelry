$(document).ready(function() {
    updatePrice();
});

function updateCart(input, prodotto) {
    let quantita = $(input).val();
    let maxQuantita = parseInt($(input).attr('max')); // Recupera il massimo consentito dalla proprietà 'max' dell'input

    // Controllo se la quantità supera il massimo consentito
    if (quantita > maxQuantita) {
        $(input).val(maxQuantita); // Imposta la quantità al massimo consentito
        quantita = maxQuantita; // Aggiorna la variabile quantita
    }

    let formData = {
        prodotto: prodotto,
        mode: "update",
        quantita: quantita,
    }

    $.ajax({
        type: "GET",
        url: "CarrelloServlet",
        data: formData,
        dataType: "html",
        success: function(data) {
            if (data == "reload") {
                location.replace("./cart.jsp");
            } else {
                updatePrice();
            }
        }
    });
}

function updatePrice() {
    let formData = {
        mode: "getTotal",
    }

    $.ajax({
        type: "GET",
        url: "CarrelloServlet",
        data: formData,
        dataType: "html",
        success: function(data) {
            let prezzo = parseFloat(data.replace(",", "."));
            console.log(prezzo);

            $("#netto").html(prezzo.toFixed(2));
            $("#spedizione").html("10.00");
            prezzo += 10;
            $("#prezzoTot").html(prezzo.toFixed(2));
        }
    });
}

function proseguiOrdine() 
{
	let formData = {
			costoTot: $("#prezzoTot").html(),
	}
	
	$.ajax({
		type: "GET",
		url: "OrdineServlet",
		data: formData,
		dataType: "html",
		success: function(data){
			console.log($("#prezzoTot").html());
			window.location.replace(data);
		}
	});
}
