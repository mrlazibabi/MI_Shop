<%-- 
    Document   : login
    Created on : Jun 2, 2023, 9:07:54 PM
    Author     : Tuan Anh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/css2?family=Ephesis&display=swap" rel="stylesheet"> 
        <!--Embed CSS here-->
        <link rel="stylesheet" href="./assets/Style_Login.css" type="text/css">
        <script src="mycode.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="screen">
                <div class="screen__content">
                    <form action="MainController" method="POST" class="login">
                        <div class="login__field">
                            <i class="login__icon fas fa-user"></i>
                            <input type="text" name="userID" required="" class="login__input" placeholder="User name / Email">
                        </div>
                        <div class="login__field">
                            <i class="login__icon fas fa-lock"></i>
                            <input type="password" name="password" required="" class="login__input" placeholder="Password">
                        </div>

                        <button class="button login__submit">
                            <input type="hidden" name="action" value="Login"/>
                            <span class="button__text">Log In Now</span>
                            <i class="button__icon fas fa-chevron-right"></i>
                        </button>

                    </form>
                    <div class="social-login">
                        <h3>Become a Member!</h3>
                        <div class="social-icons">
                            <p><a href="MainController?action=CreatePage">Sign Up</a></p>
                        </div>
                        <div class="shopping">
                            <h3>Or go to our Mall</h3>
                            <p><a href="MainController?action=Mall">Tuan Anh 's Mall</a></p>
                        </div>
                    </div>
                </div>
                <div class="screen__background">
                    <span class="screen__background__shape screen__background__shape4"></span>
                    <span class="screen__background__shape screen__background__shape3"></span>		
                    <span class="screen__background__shape screen__background__shape2"></span>
                    <span class="screen__background__shape screen__background__shape1"></span>
                </div>		
            </div>
        </div>
        ${requestScope.ERROR}
    </body>
</html>

