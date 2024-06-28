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
    
    let slideEmail = 0;
    let slideUsername = 0; // Slide variable for username validation
    
    $("#email").keyup(function() {
        validateEmail();
    });
    
    $("#username").keyup(function (){
        validateUsername();
    });
    
    $("#password").keyup(function (){
        validatePassword();
    });
    
    $("#passwordCheck").keyup(function () {
        validatePasswordMatch();
    });
    
    $("#nome").keyup(function () {
        validateName();
    });
    
    $("#cognome").keyup(function () {
        validateSurname();
    });
    
    $("#registrazione").submit(function(event) {
        validateAllFields(event);
    });

    function validateEmail() {
        let email = $("#email").val();
        
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
    }
    
    function validateUsername() {
        let username = $("#username").val();

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
    }
    
    function validatePassword() {
        let pwd = $("#password").val();
        let slidePwd = 0;
        
        if(pwd.length < 5){
            validPwd = false;
            if(slidePwd === 0){
                $("#error-pwd").text("Password troppo corta!");
                $("#error-pwd").slideDown();
                slidePwd = 1;
            } else {
                $("#error-pwd").text("Password troppo corta!");
            }
        } else {
            validPwd = true;
            
            if(slidePwd === 1){
                $("#error-pwd").slideUp();
                slidePwd = 0;
            }
            
            $("#error-pwd").text("");
        }
    }
    
    function validatePasswordMatch() {
        let pwd = $("#password").val();
        let pwdCheck = $("#passwordCheck").val();
        let slidePwd = 0;
        
        if(pwdCheck === pwd){
            validPwdCheck = true;
            $("#error-pwdchk").slideUp();
            $("#error-pwdchk").text("");
        } else {
            validPwdCheck = false;
            $("#error-pwdchk").slideDown();
            $("#error-pwdchk").text("Le password non corrispondono");
        }
    }
    
    function validateName() {
        let nome = $("#nome").val();
        let slideNome = 0;
        
        if(nome.match(nameValidator)){
            validName = true;
            
            if(slideNome === 1){
                slideNome = 0;
                $("#error-name").slideUp();
            }
            $("#error-name").html("");
        } else {
            validName = false;

            if(slideNome === 0){
                $("#error-name").slideDown();
                slideNome = 1;
            }
            
            $("#error-name").html("Nome non valido");
        }
        
        if(nome === ""){
            validName = false;
            
            if(slideNome === 1){
                slideNome = 0;
                $("#error-name").slideUp();
            }
            
            $("#error-name").html("");
        }
    }
    
    function validateSurname() {
        let cognome = $("#cognome").val();
        let slideSurname = 0;
        
        if(cognome.match(nameValidator)){
            validSurname = true;
            
            if(slideSurname === 1){
                slideSurname = 0;
                $("#error-surname").slideUp();
            }
            $("#error-surname").html("");
        } else {
            validSurname = false;

            if(slideSurname === 0){
                $("#error-surname").slideDown();
                slideSurname = 1;
            }
            
            $("#error-surname").html("Cognome non valido");
        }
        
        if(cognome === ""){
            validSurname = false;
            
            if(slideSurname === 1){
                slideSurname = 0;
                $("#error-surname").slideUp();
            }
            
            $("#error-surname").html("");
        }
    }
    
    function validateAllFields(event) {
        validateEmail();
        validateUsername();
        validatePassword();
        validatePasswordMatch();
        validateName();
        validateSurname();
        
        if(!(validEmail && validPwdCheck && validUsername && validName && validSurname && validPwd)){
            event.preventDefault();
        }
    }
    
});
