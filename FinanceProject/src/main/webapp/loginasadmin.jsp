<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="cssfiles\logiin.css">
    <title>Document</title>
</head>
<body>
    <div class="wrapper fadeInDown">
        <div id="formContent">
          <!-- Tabs Titles -->
          <h2 class="active"> Log In as Admin </h2>
          <!-- Icon  <h2 class="inactive underlineHover"><a href="signup.html">Register</a></h2> -->
          <br><br>
          <!-- Login Form -->
          <form action="adminverify.lti" method="post">
            <input type="text" id="login" class="fadeIn second" name="userName" placeholder="username"><br>
            <input type="password" id="password" class="fadeIn third" name="password" placeholder="password"><br>
            <input type="submit" class="fadeIn fourth" value="Log In"><br>
            <h1>${invalidUser}</h1>
          </form>
      
      
          <!-- Remind Passowrd -->
          <div id="formFooter">
            <a class="underlineHover" href="forgot.html">Forgot Password?</a>
          </div>
          
      
        </div>
      </div>
</body>
</html>