<%-- 
    Document   : yourProduct
    Created on : Jul 5, 2023, 1:09:15 PM
    Author     : Tuan Anh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="sample.product.ProductDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Product Page</title>
        <style>

        </style>
    </head>
    <body>
        Welcome: <h1>${sessionScope.LOGIN_USER.fullName}</h1>
        <c:url var="logoutLink" value = "MainController">
            <c:param name="action" value="Logout"></c:param>
        </c:url>
        <a href="${logoutLink}">Logout JSTL</a>

        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
                background: linear-gradient(90deg, #C7C5F4, #776BCC); 
            }

            h1 {
                margin-top: 10px;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            th, td {
                padding: 10px;
                text-align: center;
            }

            th {
                background-color: #333;
                color: white;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            input[type="text"], input[type="number"] {
                width: 100%;
                padding: 8px;
                box-sizing: border-box;
            }

            input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                border: none;
                padding: 6px 10px;
                cursor: pointer;
            }

            input[type="submit"]:hover {
                background-color: #45a049;
            }

            a {
                text-decoration: none;
                color: #337ab7;
            }

            a:hover {
                text-decoration: underline;
            }

            hr {
                margin-top: 20px;
            }

            a.button {
                display: inline-block;
                padding: 10px 20px;
                background-color: #337ab7;
                color: white;
                text-decoration: none;
                border-radius: 5px;
            }

            a.button:hover {
                background-color: #286090;
            }
        </style>

        <table border="1">
            <thead>
                <tr>
                    <th>Product ID</th>
                    <th>Name</th>
                    <th>price</th>
                    <th>quantity</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <jsp:useBean id="db" class="sample.product.ProductDAO"/>
                <c:forEach items="${db.getAll()}" var="product">
                <form  action = "MainController" method="POST">
                    <tr>
                        <td><input type="text" name="id" value ="${product.getProductID()}" required=""</td>
                        <td>
                            <input type="text" name="Name" value ="${product.getName()}" required=""/>
                        </td>
                        <td>
                            <input type="text" name="price" value="${product.getPrice()}" required=""/>
                        </td>
                        <td>
                            <input type="number" name="quantity" value="${product.getQuantity()}" required=""/>
                        </td>
                        <td>
                            <input type="submit" value="UpdateProduct" name="action"/>
                        </td>
                        <td>
                            <a href="MainController?action=DeleteProduct&id=${product.getProductID()}">Delete Product</a>
                        </td>
                    </tr>
                </form>
            </c:forEach>
        </tbody>
    </table>
    <hr/>
    <a href="MainController?action=CreateProduct">Add Product</a> 
</body>
</html>
