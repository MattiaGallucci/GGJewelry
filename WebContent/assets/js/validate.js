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

    function validateEmail(email) {
        if (email.match(emailValidator)) {
            console.log("email valida");
            $.ajax({
                type: "POST",
                url: "login",
                data: {
                    mode: "checkEmail",
                    email: email,
                },
                dataType: "html",
                success: function(data) {
                    console.log(data);
                    if(data.match("non disponibile")) {
                        validEmail = false;
                        $("#error-email").text("Email già in uso").slideDown();
                    } else if (data.match("disponibile")){
                        validEmail = true;
                        $("#error-email").text("").slideUp();
                    }
                }
            });
        } else {
            console.log("email non valida");
            validEmail = false;
            $("#error-email").text("Inserisci un'email valida").slideDown();
        }

        if(email == "") {
            validEmail = false;
            $("#error-email").text("").slideUp();
        }
    }

    function validateUsername(username) {
        if(username.match(usernameValidator)){
            console.log("username formattato bene");
            $.ajax({
                type: "POST",
                url: "login",
                data: {
                    mode: "checkUsername",
                    username: username,
                },
                dataType: "html",
                success: function(data) {
                    console.log(data);
                    if(data.match("non disponibile")) {
                        validUsername = false;
                        $("#error-username").text("Username non disponibile e/o già in uso").slideDown();
                    } else if (data.match("disponibile")){
                        validUsername = true;
                        $("#error-username").text("").slideUp();
                    }
                }
            });
        } else {
            console.log("username non disponibile");
            validUsername = false;
            $("#error-username").text("Username non valido").slideDown();
        }

        if(username == ""){
            validUsername = false;
            $("#error-username").text("").slideUp();
        }
    }

    function validatePassword(pwd) {
        if(pwd.length < 5){
            validPwd = false;
            $("#error-pwd").text("Password troppo corta!").slideDown();
        } else {
            validPwd = true;
            $("#error-pwd").text("").slideUp();
        }
    }

    function validatePasswordCheck(pwd, pwdCheck) {
        if(pwdCheck === pwd){
            console.log("Le password corrispondono!");
            validPwdCheck = true;
            $("#error-pwdchk").text("").slideUp();
        } else {
            console.log("Le password non corrispondono");
            validPwdCheck = false;
            $("#error-pwdchk").text("Le password non corrispondono").slideDown();
        }
    }

    function validateName(nome) {
        if(nome.match(nameValidator)){
            console.log("Nome valido");
            validName = true;
            $("#error-name").html("").slideUp();
        } else {
            console.log("Nome non valido");
            validName = false;
            $("#error-name").html("Nome non valido").slideDown();
        }

        if(nome == ""){
            validName = false;
            $("#error-name").html("").slideUp();
        }
    }

    function validateSurname(cognome) {
        if(cognome.match(nameValidator)){
            console.log("Cognome valido");
            validSurname = true;
            $("#error-surname").html("").slideUp();
        } else {
            console.log("Cognome non valido");
            validSurname = false;
            $("#error-surname").html("Cognome non valido").slideDown();
        }

        if(cognome == ""){
            validSurname = false;
            $("#error-surname").html("").slideUp();
        }
    }

    $("#email").blur(function() {
        let email = $("#email").val();
        validateEmail(email);
    });

    $("#username").blur(function (){
        let username = $("#username").val();
        validateUsername(username);
    });

    $("#password").blur(function (){
        let pwd = $("#password").val();
        validatePassword(pwd);
    });

    $("#passwordCheck").blur(function () {
        let pwd = $("#password").val();
        let pwdCheck = $("#passwordCheck").val();
        validatePasswordCheck(pwd, pwdCheck);
    });

    $("#nome").blur(function () {
        let nome = $("#nome").val();
        validateName(nome);
    });

    $("#cognome").blur(function () {
        let cognome = $("#cognome").val();
        validateSurname(cognome);
    });

    $("#registrati").click(function(event){
        let email = $("#email").val();
        let username = $("#username").val();
        let pwd = $("#password").val();
        let pwdCheck = $("#passwordCheck").val();
        let nome = $("#nome").val();
        let cognome = $("#cognome").val();

        validateEmail(email);
        validateUsername(username);
        validatePassword(pwd);
        validatePasswordCheck(pwd, pwdCheck);
        validateName(nome);
        validateSurname(cognome);

        if(validEmail && validPwdCheck && validUsername && validName && validSurname && validPwd){
            $("#registrazione").submit();
        } else {
            event.preventDefault();
        }
    });
});
