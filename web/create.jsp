<%-- 
    Document   : create
    Created on : Jun 10, 2023, 4:31:34 PM
    Author     : Tuan Anh
--%>

<%@page import="sample.user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
                background: linear-gradient(90deg, #C7C5F4, #776BCC);
            }

            /* Style the form container */
            .create {
                width: 400px;
                margin: 50px auto;
                padding: 20px;
                background-color: #ffffff;
                border-radius: 5px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }

            /* Style the form inputs and labels */
            form input[type="text"],
            form input[type="password"] {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 3px;
            }

            form input[type="submit"],
            form input[type="reset"] {
                padding: 10px 20px;
                background-color: #007bff;
                color: #ffffff;
                border: none;
                border-radius: 3px;
                cursor: pointer;
            }

            /* Style the error messages */
            .error {
                color: red;
                font-size: 12px;
                margin-top: 5px;
            }
        </style>
    </head>
    <body>
        <div class="create">
            <form action="MainController" method="POST">
                User ID<input type="text" name="userID" required=""/>${requestScope.USER_ERROR.userIDError}
                </br>Full Name<input type="text" name="fullName" required=""/>${requestScope.USER_ERROR.fullNameError}
                </br>Roll ID<input type="text" name="roleID" readonly="" value="US"/>
                </br>Password<input type="password" name="password" required=""/>${requestScope.USER_ERROR.passwordError}
                </br>Confirm<input type="password" name="confirm" required=""/>${requestScope.USER_ERROR.confirmError}
                </br><input type="submit" name="action" value="Create"/>
                <input type="reset" value="Reset"/>
                ${requestScope.USER_ERROR.error}
            </form>  
        </div>

    </body>
</html>
