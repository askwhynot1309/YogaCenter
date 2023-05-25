<%-- 
    Document   : user
    Created on : May 25, 2023, 10:19:43 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User HomePage</title>
    </head>
    <body>
        <h1>Hello ${sessionScope.User}</h1>
        <a href="LogoutServlet">Đăng xuất</a>
    </body>
</html>
