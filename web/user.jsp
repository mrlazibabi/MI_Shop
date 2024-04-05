<%-- 
    Document   : user
    Created on : Jun 2, 2023, 9:10:43 PM
    Author     : ADMIN
--%>

<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>
    <body>
<!--        <c:if test="${sessionScope.LOGIN_USER==null || sessionScope.LOGIN_USER.roleID ne 'AD'}">
            <c:redirect url="login.html"></c:redirect>
        </c:if>-->
        User's information:
        UserID:${sessionScope.LOGIN_USER.userID}
        </br>Full Name:${sessionScope.LOGIN_USER.fullName}
        </br>Role ID:${sessionScope.LOGIN_USER.roleID}
        </br>Password:${sessionScope.LOGIN_USER.password}
    </body>
</html>
