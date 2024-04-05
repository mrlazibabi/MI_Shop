<%-- 
    Document   : create
    Created on : Jun 10, 2023, 4:31:34 PM
    Author     : Tuan Anh
--%>

<%@page import="sample.product.ProductError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f0f0;
                margin: 0;
                padding: 0;
                background: linear-gradient(90deg, #C7C5F4, #776BCC);
            }

            form {
                max-width: 400px;
                margin: 0 auto;
                padding: 20px;
                background-color: #fff;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            /* Style form elements */
            form input[type="text"],
            form input[type="number"] {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                font-size: 16px;
            }

            form input[type="submit"],
            form input[type="reset"] {
                padding: 10px 20px;
                background-color: #007bff;
                border: none;
                border-radius: 4px;
                color: #fff;
                cursor: pointer;
                font-size: 16px;
            }

            form input[type="submit"]:hover,
            form input[type="reset"]:hover {
                background-color: #0056b3;
            }

            /* Style error messages */
            .error {
                color: red;
                font-size: 14px;
                margin-top: 5px;
            }

            /* Center form on the page */
            form {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                height: 100vh;
            }
        </style>
    </head>
    <body>
        <form action="MainController" method="POST">
            Product ID<input type="text" name="ProductID" required=""/>
            ${requestScope.PRODUCT_ERROR.getProductIDError()}
            </br> Name<input type="text" name="Name" required=""/>
            ${requestScope.PRODUCT_ERROR.getNameError()}
            </br>price<input type="text" name="price" required=""/>
            ${requestScope.PRODUCT_ERROR.getPriceError()}
            </br>quantity<input type="number" name="quantity" required=""/>
            </br><input type="submit" name="action" value="CreateProduct"/>
            <input type="reset" value="Reset"/>
            ${requestScope.PRODUCT_ERROR.getError()}
        </form>
    </body>
</html>
