<%-- 
    Document   : Register
    Created on : Jun 3, 2023, 1:47:43 PM
    Author     : CCLaptop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html>

    <head>
        <c:import url="header.html"></c:import>
            <title>Register - Yoga Center</title>
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
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
            <div class="container">
                <h2>Register - Yoga Center</h2>
                <div style="color: red" class="error-message">${requestScope.ErrorMessage}</div>
            <form action="RegisterServlet" method="post">
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div style="color: red" class="error-message">${requestScope.ErrorMessageEmail}</div>
                <div class="form-group">
                    <label for="account">Username</label>
                    <input type="text" class="form-control" id="account" name="account" required>
                </div>
                <div style="color: red" class="error-message">${requestScope.ErrorMessageAccount}</div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <div style="color: red" class="error-message">${requestScope.ErrorMessagePassword}</div>
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>
                <div class="form-group">
                    <label for="cccd">CCCD</label>
                    <input type="text" class="form-control" id="cccd" name="cccd" required>
                </div>
                <div style="color: red" class="error-message">${requestScope.ErrorMessageCccd}</div>
                <div class="form-group">
                    <label for="phone">Phone</label>
                    <input type="text" class="form-control" id="phone" name="phone" required>
                </div>
                <div style="color: red" class="error-message">${requestScope.ErrorMessagePhone}</div>
                <div class="form-group">
                    <label for="address">Address</label>
                    <input type="text" class="form-control" id="address" name="address" required>
                </div>
                <button type="submit" class="btn btn-register btn-block" name="action" value="Register">Register</button>
            </form>      
            <p class="text-center mt-3">Already have an account? <a href="login.jsp">Login here</a></p>
        </div>
    </body>

</html>
