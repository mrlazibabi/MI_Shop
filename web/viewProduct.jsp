<%-- 
    Document   : viewProduct
    Created on : Jun 21, 2023, 3:09:28 AM
    Author     : Tuan Anh
--%>

<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.List"%>
<%@page import="sample.product.Cart"%>
<%@page import="sample.product.ProductDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your cart</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f5f5f5;
                background: linear-gradient(90deg, #C7C5F4, #776BCC);
            }

            h1 {
                text-align: center;
                margin-top: 20px;
                color: #333;
            }

            table {
                width: 70%;
                margin: 20px auto;
                border-collapse: collapse;
                background-color: #fff;
                border: 1px solid #ccc;
            }

            th, td {
                padding: 10px;
                text-align: center;
                border-bottom: 1px solid #ccc;
            }

            th {
                background-color: #f2f2f2;
                color: #333;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            tr:hover {
                background-color: #e0e0e0;
            }

            a {
                display: inline-block;
                margin: 20px auto;
                text-decoration: none;
                color: #333;
                border: 1px solid #ccc;
                padding: 5px 10px;
                border-radius: 5px;
            }

            a:hover {
                background-color: #f2f2f2;
            }

            .total {
                text-align: right;
                margin-top: 10px;
                font-size: 1.2em;
                color: #333;
            }

            form {
                text-align: center;
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <h1>This is your cart</h1>
        <table border="1" width = "30%">
            <tr>
                <th>No</th>
                <th>Product ID</th>
                <th>Name</th>
                <th>price</th>
                <th>quantity</th>
                <th>Remove</th>
            </tr>
            <c:set var="o" value="${sessionScope.cart}"/> 
            <c:set var="t" value="0"/>
            <c:set var="total" value="${0}"/>

            <c:forEach items="${o.items}" var="i">
                <c:set var="t" value="${t + 1}"/>
                <c:set var="total" value="${total + (i.quantity * i.price)}"/>
                <form action="MainController" method="POST">
                    <tr>
                        <td>${t}</td>
                        <td>
                            <input type="text" name="id" value="${i.product.getProductID()}" readonly=""/>
                        </td>
                        <td>${i.product.getName()}</td>
                        <td><fmt:formatNumber pattern="##.#" value="${i.price}"/>$</td> 
                        <td>
                            <input type="number" name="quantity" value="${i.quantity}" min="1" required=""/>
                        </td>
                        <td>
                            <input type="submit" name="action" value="Remove"
                        </td>
                    </tr>                    
                </form>
            </c:forEach>
        </table>
        <a href="MainController?action=Mall">Add more</a>
        <h1>Total: ${total} $</h1>
        <form action="MainController" method="POST">
            <input type="submit" name="action" value="Checkout"/>
        </form>
        ${requestScope.MESSAGE}
    </body>
</html>
