$(document).ready(function(){
	
    let emailValidator = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
    let usernameValidator = /^[a-zA-Z0-9_.]{4,15}$/;
    let nameValidator = /^[a-zA-Z]{3,}$/;
    let validEmail = false;
    let validUsername = false;
    let validPwd = false;
    let validPwdCheck = false;
    let validName = false;
    let validSurname = false;
    
    $("#email").keyup(function() {

        let email = $("#email").val();
        let slideEmail = 0;
        
        if (email.match(emailValidator)) {

            console.log("email valida");
            $.ajax({
                type: "POST",
                url: "registrazione",
                data: {
                	mode: "checkEmail",
                    email: email,
                },
                dataType: "html",
                success: function(data) {
                	console.log(data);

                    if(data.match("non disponibile")) {
                    	
                    	validEmail = false;
                        if(slideEmail == 0){
                            $("#error-email").slideDown();
                            slideEmail = 1;
                        }

                    	$("#error-email").text("Email gia in uso");

                    } else if (data.match("disponibile")){
                        slideEmail = 0;
                        validEmail = true;
                        $("#error-email").slideUp();
                    	$("#error-email").text("");
                    }
                }
            });

        } else {

            console.log("email non valida");
            validEmail = false;
            if(slideEmail == 0){

                $("#error-email").slideDown();
                slideEmail = 1;

            }

            $("#error-email").text("Inserisci un email valida");

        }

        if(email == "") {
        	validEmail = false;
            if(slideEmail == 1) {
            	
                slideEmail = 0;
                $("#error-email").slideUp();

            }

            $("#error-email").text("");

        }
    });
    
    $("#username").keyup(function (){

    	let username = $("#username").val();
        let slideUsername = 0;

        if(username.match(usernameValidator)){

    		console.log("username formattato bene");
    		
    		$.ajax({
                type: "POST",
                url: "registrazione",
                data: {
                	mode: "checkUsername",
                    username: username,
                },
                dataType: "html",
                success: function(data) {
                	console.log(data);
                    if(data.match("non disponibile")) {
                    	validUsername = false;
                        if(slideUsername == 0) {

                            $("#error-username").slideDown();
                            slideUsername = 1;

                        }

                    	$("#error-username").text("Username non disponibile e/o gia in uso");

                    } else if (data.match("disponibile")){
                    	validUsername = true;
                        slideUsername = 0;
                        $("#error-username").text("Username disponibile");
                        $("#error-username").slideUp();

                    }
                }
            });

    	} else {

            console.log("username non disponibile");
            validUsername = false;
            if(slideUsername == 0) {

                $("#error-username").slideDown();
                slideUsername = 1;

            }

    		$("#error-username").text("Username non valido");

    	}

        if(username == ""){
        	validUsername = false;
            if(slideUsername == 1) {
                
                slideUsername = 0;
                $("#error-username").slideUp();
        
            }

            $("#error-username").text("");

        }
    });
    
    $("#password").keyup(function (){
    	let pwd = $("#password").val();
    	slidePwd = 0;
    	if(pwd.length < 5){
    		validPwd = false;
    		if(slidePwd == 0){
    			$("#error-pwd").text("Password troppo corta!");
    			$("#error-pwd").slideDown();
    			slidePwd = 1;
    		} else {
    			$("#error-pwd").text("Password troppo corta!");
    		}
    	} else {
    		validPwd = true;
    		
    		if(slidePwd == 1){
    			$("#error-pwd").slideUp();
    			slidePwd = 0;
    		}
    		
    		$("#error-pwd").text("");
    	}
    	
    	
    });
    
    $("#passwordCheck").keyup(function () {

        let slidePwd = 0;
        let pwd = $("#password").val();
        let pwdCheck = $("#passwordCheck").val();
        
        if(pwdCheck.valueOf() === pwd.valueOf()){
        	
            console.log("Le password corrispondono!");
            slidePwd = 0;
            validPwdCheck = true;
            $("#error-pwdchk").slideUp();
            $("#error-pwdchk").text("");

        } else {

            console.log("Le password non corrispondono");
            validPwdCheck = false;
            if(slidePwd == 0) {

                $("#error-pwdchk").slideDown();
                slidePwd = 1;

            }

            $("#error-pwdchk").text("Le password non corrispondono");

        }
    });
    
    $("#nome").keyup(function () {
    	let slideNome = 0;
    	let nome = $("#nome").val();
    	
    	if(nome.match(nameValidator)){
    		console.log("Nome valido");
    		validName = true;
    		
    		if(slideNome == 1){
    			slideNome = 0;
    			$("#error-name").slideUp();
    		}
    		$("#error-name").html("");
    	} else {
    		console.log("Nome non valido");
    		validName = false;

    		if(slideNome == 0){
    			$("#error-name").slideDown();
    			slideNome = 1;
    		}
    		
    		$("#error-name").html("Nome non valido");
    	}
    	
    	if(nome == ""){
    		validName = false;
    		
    		if(slideNome == 1){
    			slideNome = 0;
    			$("#error-name").slideUp();
    		}
    		
    		$("#error-name").html("");
    	}
    });
    
    $("#cognome").keyup(function () {
    	let slideSurname = 0;
    	let cognome = $("#cognome").val();
    	
    	if(cognome.match(nameValidator)){
    		console.log("Cognome valido");
    		validSurname = true;
    		
    		if(slideSurname == 1){
    			slideSurname = 0;
    			$("#error-surname").slideUp();
    		}
    		$("#error-surname").html("");
    	} else {
    		console.log("Cognome non valido");
    		validSurname = false;

    		if(slideSurname == 0){
    			$("#error-surname").slideDown();
    			slideSurname = 1;
    		}
    		
    		$("#error-surname").html("Cognome non valido");
    	}
    	
    	if(cognome == ""){
    		validSurname = false;
    		
    		if(slideSurname == 1){
    			slideSurname = 0;
    			$("#error-surname").slideUp();
    		}
    		
    		$("#error-surname").html("");
    	}
    });
    
    $("#registrati").click(function(){
    	if(validEmail && validPwdCheck && validUsername && validName && validSurname && validPwd){
    		$("#registrazione").submit();
    	} else {
    		event.preventDefault();
    	}
    })
});