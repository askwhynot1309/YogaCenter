<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Yoga Center</title>
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
            }

            .form-group label {
                font-weight: bold;
                font-size: 18px;
            }

            .form-control {
                font-size: 16px;
            }

            .btn-submit {
                background-color: #008000;
                color: #ffffff;
                border: none;
                transition: background-color 0.3s ease;
                font-size: 18px;
                padding: 10px;
            }

            .btn-submit:hover {
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
            <h2>Confirm OTP - Yoga Center</h2>
            <p>We have sent your email a OTP code.</p>
            <form action="/YogaCenter/request" method="post">
                <div class="form-group">
                    <label for="otp">OTP</label>
                    <input type="text" class="form-control" name="otp" required>
                </div>
                <button type="submit" class="btn btn-submit btn-block" name="action" value="OTPRegister">Comfirm OTP</button>
                <div style="color: red" class="error-message">${requestScope.ErrorMessageOTP}</div>
            </form>
        </div>
    </body>
</html>
