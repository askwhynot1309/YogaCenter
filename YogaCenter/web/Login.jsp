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
        <link rel="stylesheet" href="css/loginStyle.css">
        <link rel="stylesheet" href="fontawesome-free-5.15.3-web/css/all.min.css">
        <title>Login</title>
    </head>


    <body>
        <header class="header">
            <a href="homepage.jsp" id="logo">Your logo</a>

            <nav class="navbar">
                <a href="homepage.jsp">Home</a>
                <a href="#">Class</a>
                <a href="#">About</a>
                <a href="#">Gallery</a>
                <a href="#">Contact</a>
            </nav>


            <div class="search-form">
                <div class="navbar">
                    <span><a href="Login.jsp">Login </a></span>
                    <span><a href="Register.jsp">Register</a></span>
                </div>

            </div>

        </header>
        <div class="login">
            <div class="login-form">
                <h1 class="signin-heading">Sign In</h1>
                <div class="inner-form">
                    <form action="/YogaCenter/request" method="POST">
                        <div class="form-control">
                            <input type="text" name="account" required="">
                            <label>
                                <span style="transition-delay:0ms">A</span><span style="transition-delay:50ms">c</span><span style="transition-delay:100ms">c</span><span style="transition-delay:150ms">o</span><span style="transition-delay:200ms">u</span><span style="transition-delay:250ms">n</span><span style="transition-delay:300ms">t</span>
                            </label>
                        </div>
                        <div class="form-control">
                            <input type="password" name="password" required="">
                            <label>
                                <span style="transition-delay:0ms">P</span><span style="transition-delay:50ms">a</span><span style="transition-delay:100ms">s</span><span style="transition-delay:150ms">s</span><span style="transition-delay:200ms">w</span><span style="transition-delay:250ms">o</span><span style="transition-delay:300ms">r</span><span style="transition-delay:350ms">d</span>
                            </label>
                        </div>
                        <button name="action" value="Login">
                            Sign up
                            <div class="arrow-wrapper">
                                <div class="arrow"></div>
                            </div>
                        </button>
                    </form>
                </div>
                <c:set var="Loginfail" value="${requestScope.Loginfail}"/>
                    <c:if test="${Loginfail != null}">
                        <div style="text-align: center; margin-top: 50px; transition: none"><h2 style="color: red"><c:out value="${Loginfail}"/></h2></div>
                    </c:if>
                        <c:set var="LoginLimited" value="${requestScope.LoginLimited}"/>
                    <c:if test="${LoginLimited != null}">
                        <div style="text-align: center; margin-top: 50px; transition: none"><h2 style="color: red"><c:out value="${LoginLimited}"/></h2></div>
                    </c:if>

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
        <style>
            button {
                margin-left: 18%;
                --primary-color: #645bff;
                --secondary-color: #fff;
                --hover-color: #111;
                --arrow-width: 10px;
                --arrow-stroke: 2px;
                box-sizing: border-box;
                border: 0;
                border-radius: 20px;
                color: var(--secondary-color);
                padding: 1em 5em;
                background: var(--primary-color);
                display: flex;
                transition: 0.2s background;
                align-items: center;
                gap: 0.6em;
                font-weight: bold;
                width: 200px;
            }

            button .arrow-wrapper {
                display: flex;
                justify-content: center;
                align-items: center;
            }

            button .arrow {
                margin-top: 1px;
                width: var(--arrow-width);
                background: var(--primary-color);
                height: var(--arrow-stroke);
                position: relative;
                transition: 0.2s;
            }

            button .arrow::before {
                content: "";
                box-sizing: border-box;
                position: absolute;
                border: solid var(--secondary-color);
                border-width: 0 var(--arrow-stroke) var(--arrow-stroke) 0;
                display: inline-block;
                top: -3px;
                right: 3px;
                transition: 0.2s;
                padding: 3px;
                transform: rotate(-45deg);
            }

            button:hover {
                background-color: var(--hover-color);
            }

            button:hover .arrow {
                background: var(--secondary-color);
            }

            button:hover .arrow:before {
                right: 0;
            }
            .form-control {
                position: relative;
                margin: 20px 0 40px;
                width: 300px;
            }

            .form-control input {
                background-color: transparent;
                border: 0;
                border-bottom: 2px #111 solid;
                display: block;
                width: 100%;
                padding: 15px 5px;
                font-size: 18px;
                color: #111;
            }

            .form-control input:focus,
            .form-control input:valid {
                outline: 0;
                border-bottom-color: #1669F2;
            }

            .form-control label {
                position: absolute;
                top: 15px;
                left: 0;
                pointer-events: none;
            }

            .form-control label span {
                display: inline-block;
                font-size: 18px;
                min-width: 5px;
                color: #111;
                transition: 0.3s cubic-bezier(0.68, -0.55, 0.265, 1.55);
            }

            .form-control input:focus+label span,
            .form-control input:valid+label span {
                color: #1669F2;
                transform: translateY(-30px);
            }
        </style>
    </body>
</html>
