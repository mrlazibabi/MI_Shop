<%-- 
    Document   : Mall
    Created on : Jul 6, 2023, 1:40:12 AM
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
        <title>Welcome to our Mall</title>
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
                padding: 20px;
                background-color: #333;
                color: #fff;
            }

            a {
                display: block;
                text-align: center;
                margin-top: 10px;
                text-decoration: none;
                color: #333;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin: 20px auto;
                background-color: #fff;
            }

            th, td {
                padding: 10px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            th {
                background-color: #f2f2f2;
            }

            input[type="text"],
            input[type="number"],
            input[type="submit"] {
                padding: 5px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            input[type="submit"] {
                background-color: #333;
                color: #fff;
                cursor: pointer;
            }

            .hinhanh {
                display: flex;
                justify-content: center;
                margin-top: 20px;
            }

            .hinhanh img {
                max-width: 100px;
                margin: 10px;
            }

            .hinhanh h4 {
                font-size: 14px;
                text-align: center;
                margin: 0;
            }

            hr {
                margin: 20px auto;
                border: none;
                border-top: 1px solid #ddd;
            }
        </style>
    </head>
    <body>
        <h1>Welcome to our Mall</h1>
        <c:url var="logoutLink" value = "MainController">
            <c:param name="action" value="Logout"></c:param>
        </c:url>
        <a href="${logoutLink}">Logout JSTL</a>



        <table border="1">
            <thead>
                <tr>
                    <th>Product ID</th>
                    <th>Name</th>
                    <th>price</th>
                    <th>quantity</th>
                    <th>Number of Products to put in Cart</th>
                    <th>Add</th>
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
                            <input type="number" name ="num" value="1"/>
                        </td>
                        <td>
                            <input type="submit" value="Add" name="action"/>
                        </td>
                    </tr>
                </form>

            </c:forEach>
            <div class="hinhanh">
                <img src="https://cf.shopee.vn/file/1d789a792f7044a48010a16f1ca1d381" alt="">
                <h4>Mini_ver</h4>

                <img src="https://thumbs.static-thomann.de/thumb/padthumb600x600/pics/bdb/_42/428814/13009184_800.jpg" alt="">
                <h4>Deluxe_ver</h4>

                <img src="https://s.pacn.ws/1/p/12x/otamatone-deluxe-x-kirbys-dream-land-kirby-ver-700815.1.jpg?v=r1iwdt" alt="">
                <h4>Kirby_ver</h4>

                <img src="https://down-vn.img.susercontent.com/file/8fbaec7aeec00b5d2c9b33137d629495" alt="">
                <h4>Chibi_bundle</h4>

                <img src="https://i5.walmartimages.com/asr/66bd883d-744f-49ce-a87c-80dee1d0b57b.a101b8074c557190b1be842f8e553be6.jpeg" alt="">
                <h4>Miku_ver</h4>

                <img src="https://www.alexcious.com/upload/save_image/01161752_5a5dbd4de6209.jpg" alt="">
                <h4>Japan_bundle</h4>
            </div>
        </tbody>
    </table>
    <hr/>
</body>
</html>

