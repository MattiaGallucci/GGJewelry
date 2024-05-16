<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="initial-scale=1, width=device-width">
<title>Login | G&amp;G Jewelry</title>
<link rel="stylesheet" type="text/css" href="./css/structure.css">
<link rel="icon" href="images/logo.png">
</head>
<body>

	<%@ include file="../fragments/header.jsp"%>
	
	
<section>
	<form action="ServletLogin" method="post">
		<fieldset>
			<legend>Login Custom</legend>
			<label for="username">Username</label> <input id="username"
				type="text" name="username" placeholder="enter username"> <br>
			<label for="password">Password</label> <input id="password"
				type="password" name="password" placeholder="enter password">
			<br> <input type="submit" value="Login" /> <input type="reset"
				value="Reset" />
		</fieldset>
	</form>
</section>
	<%@include file="../fragments/footer.jsp"%>

</body>
</html>