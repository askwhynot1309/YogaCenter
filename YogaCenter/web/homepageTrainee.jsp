<%-- 
    Document   : homepageTrainee
    Created on : Jun 5, 2023, 1:30:35 PM
    Author     : ngmin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
-->
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            .dropdown {
                position: relative;
                display: inline-block;
                padding-right: 50px;
            }

            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f9f9f9;
                min-width: 160px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                padding: 12px 16px;
                z-index: 1;
            }

            .dropdown:hover .dropdown-content {
                display: block;
            }

            .dropdown-content p{
                margin-bottom: 20px;
                font-size: 150%;
            }
        </style>
        <title>Homepage</title>
    </head>
    <body>
        <header class="header">
            <a href="#" id="logo">Your logo</a>

            <nav class="navbar">
                <a href="homepage.jsp">home</a>
                <a href="#">class</a>
                <a href="#">about</a>
                <a href="#">gallery</a>
                <a href="ContactUs.jsp">contact</a>
            </nav>

            <div class="dropdown">
                <span class="fa-solid fa-user fa-2xl"></span>
                <div class="dropdown-content">
                    <p>
                        <a href="/YogaCenter/request?action=ManageAccount">
                            <i class="fas fa-user icon"></i>
                            Manage Account
                        </a>
                    </p>
                    <p>
                        <a href="/YogaCenter/request?action=Booking">
                            <i class="fas fa-calendar-alt icon"></i>
                            Class booking
                        </a>
                    </p>
                    <p>
                        <a href="/YogaCenter/request?action=ManageSub">
                            <i class="fas fa-money-bill"></i>                
                            Manage subscription
                        </a>
                    </p>
                    <p>
                        <a href="/YogaCenter/request?action=ChangePassword">
                            <i class="fas fa-lock"></i>
                            Change password
                        </a>
                    </p>
                    <p>
                        <a href="/YogaCenter/request?action=Logout">
                            <i class="fas fa-sign-out-alt icon"></i>
                            Logout
                        </a>
                    </p>
                </div>
            </div>
        </header>
    </body>
</html>
