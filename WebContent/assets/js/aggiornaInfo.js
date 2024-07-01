$(document).ready(function(){

    let emailValidator = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
    let usernameValidator = /^[a-zA-Z0-9_.]{4,15}$/;
    let nameValidator = /^[a-zA-Z]{3,}$/;
    let validEmail = true;
    let validUsername = true;
    let validPwdCheck = true;
    let validName = true;
    let validSurname = true;
    let slideEmail = 0;
    let slideUsername = 0;

    $("#emailNuovo").keyup(function() {
        let email = $("#emailNuovo").val();

        if (email.match(emailValidator)) {
            $.ajax({
                type: "POST",
                url: "registrazione",
                data: {
                    mode: "checkEmail",
                    email: email,
                },
                dataType: "html",
                success: function(data) {
                    if (data.match("non disponibile")) {
                        validEmail = false;
                        if (slideEmail === 0) {
                            $("#error-email").slideDown();
                            slideEmail = 1;
                        }
                        $("#error-email").text("Email già in uso");
                    } else if (data.match("disponibile")) {
                        validEmail = true;
                        slideEmail = 0;
                        $("#error-email").slideUp();
                        $("#error-email").text("");
                    }
                }
            });
        } else {
            validEmail = false;
            if (slideEmail === 0) {
                $("#error-email").slideDown();
                slideEmail = 1;
            }
            $("#error-email").text("Inserisci un'email valida");
        }

        if (email === "") {
            validEmail = false;
            if (slideEmail === 1) {
                slideEmail = 0;
                $("#error-email").slideUp();
            }
            $("#error-email").text("");
        }
    });

    $("#usernameNuovo").keyup(function (){
        let username = $("#usernameNuovo").val();

        if(username.match(usernameValidator)){
            $.ajax({
                type: "POST",
                url: "registrazione",
                data: {
                    mode: "checkUsername",
                    username: username,
                },
                dataType: "html",
                success: function(data) {
                    if(data.match("non disponibile")) {
                        validUsername = false;
                        if(slideUsername === 0) {
                            $("#error-username").slideDown();
                            slideUsername = 1;
                        }
                        $("#error-username").text("Username non disponibile e/o già in uso");
                    } else if (data.match("disponibile")){
                        validUsername = true;
                        slideUsername = 0;
                        $("#error-username").slideUp();
                        $("#error-username").text("");
                    }
                }
            });
        } else {
            validUsername = false;
            if(slideUsername === 0) {
                $("#error-username").slideDown();
                slideUsername = 1;
            }
            $("#error-username").text("Username non valido");
        }

        if(username === ""){
            validUsername = false;
            if(slideUsername === 1) {
                slideUsername = 0;
                $("#error-username").slideUp();
            }
            $("#error-username").text("");
        }
    });

    $("#passwordCheck").keyup(function () {
        let slidePwd = 0;
        let pwd = $("#password").val();
        let pwdCheck = $("#passwordCheck").val();

        if(pwdCheck.match(pwd)){
            console.log("");
            validPwdCheck = true;
            slidePwd = 0;
            $("#error-pwd").slideUp();
            $("#error-pwd").text("");
        } else {
            console.log("Le password non corrispondono");
            validPwdCheck = false;
            if(slidePwd == 0) {
                $("#error-pwd").slideDown();
                slidePwd = 1;
            }

            $("#error-pwd").text("Le password non corrispondono");
        }
    });

    $("#nomeNuovo").keyup(function () {
        let slideNome = 0;
        let nome = $("#nomeNuovo").val();

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

    $("#cognomeNuovo").keyup(function () {
        let slideSurname = 0;
        let cognome = $("#cognomeNuovo").val();

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

    $("#modificaInfoBtn").click(function(){
        if(validEmail && validPwdCheck && validUsername && validName && validSurname){
            $("#modificaInfo").submit();
        } else {
            event.preventDefault();
        }
    })
});
