<%-- 
    Document   : Login
    Created on : May 26, 2023, 9:13:36 AM
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
        <link rel="stylesheet" href="css/Login.css">
        <link rel="stylesheet" href="fontawesome-free-5.15.3-web/css/all.min.css">
        <title>Login</title>
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


            <div class="search-form">
                <div class="navbar">
                    <span><a href="login.jsp">Login </a></span>
                    <span><a href="Register.jsp">Register</a></span>
                </div>

            </div>

        </header>
        <div class="login">
            <div class="login-form">
                <h1 class="signin-heading">Sign In</h1>
                <div class="inner-form">
                    <form action="/YogaCenter/request" method="POST">
                        <input type="text" name="account" placeholder="your account">
                        <input type="password" name="password" placeholder="your password">
                        <button name="action" value="Login">Login</button>
                    </form>
                </div>

                <div class="forgot-password">
                    <a href="ForgetPassword.jsp">Forget Password?</a>
                </div>

                <div class="signin-or"><span>or</span></div>

                <div class="google-btn">
                    <div class="google-icon-wrapper">
                        <img class="google-icon" src="https://upload.wikimedia.org/wikipedia/commons/5/53/Google_%22G%22_Logo.svg"/>
                    </div>
                    <div class="btn-text"><b><a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/YogaCenter/LoginGoogle&response_type=code
                                                &client_id=770844928975-77pd0lq2vg2adjg6s2hb0r6kn5fevu58.apps.googleusercontent.com&approval_prompt=force">Sign in with google</a></b></div>
                </div>

            </div>

        </div>
        <%
            String login = (String) request.getAttribute("Loginfail");
            if (login != null) {
        %>
        <script>
            window.alert("<%=login%>");
        </script>
        <%
            }
        %>
    </body>
</html>
