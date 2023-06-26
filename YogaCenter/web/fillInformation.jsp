<%-- 
    Document   : fillInformation
    Created on : Jun 26, 2023, 7:47:51 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="icon" type="image/x-icon" href="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png">
        <style>
            body {
                background-color: #f4f4f4;
            }

            .container {
                max-width: 500px;
                margin: 0 auto;
                margin-top: 100px;
                background-color: #ffffff;
                padding: 40px;
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            h2 {
                text-align: center;
                color: #008000;
                margin-bottom: 30px;
                font-size: 28px;
                font-weight: 700;
            }

            .form-group label {
                font-weight: bold;
                font-size: 18px;
            }

            .form-control {
                font-size: 16px;
            }

            .btn-register {
                background-color: #008000;
                color: #ffffff;
                border: none;
                transition: background-color 0.3s ease;
                font-size: 18px;
                padding: 10px;
            }

            .btn-register:hover {
                background-color: #006600;
            }

            .text-center {
                font-size: 16px;
            }

            .text-center a {
                font-weight: bold;
            }
        </style>
    </head>
    <body>
            <c:set var="email" value="${requestScope.email}"/>
            <div class="container">
            <h2>Your profile </h2>
            <div style="color: red" class="error-message">${requestScope.ErrorMessage}</div>
            <form action="/YogaCenter/request" method="POST">
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" name="email" readonly="" value="${email}">
                </div>
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" class="form-control" name="name" required value="${param.name}">
                </div>
                <div class="form-group">
                    <label for="cccd">CCCD</label>
                    <input type="text" class="form-control" id="cccd" name="cccd" required value="${param.cccd}">
                </div>
                <div style="color: red" class="error-message">${requestScope.ErrorMessageCccd}</div>
                <div class="form-group">
                    <label for="phone">Phone</label>
                    <input type="text" class="form-control" id="phone" name="phone" required value="${param.phone}">
                </div>
                <div style="color: red" class="error-message">${requestScope.ErrorMessagePhone}</div>
                <div class="form-group">
                    <label for="address">Address</label>
                    <input type="text" class="form-control" id="address" name="address" required value="${param.address}">
                </div>
                <button class="btn btn-register btn-block" name="action" value="Information">Confirm</button>
            </form>      
    </body>
</html>
