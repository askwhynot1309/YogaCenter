<%@page import="Dao.MessageDao"%>
<%@page import="Object.Message"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Object.Account"%>
<%@page import="java.util.HashMap"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="css/style.css">
    </head>

    <body>
        <c:set var="cart" value="${sessionScope.cart}"/>

        <header class="header" style = "z-index: 1; position: sticky;">
            <a href="/YogaCenter/home" id="logo"><img src="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png" width="75px" height="75px" alt="logo"/></a>

            <nav class="navbar" style="font-size: 25px; font-weight: 700;">
                <a href="/YogaCenter/home">Home</a>
                <a href="/YogaCenter/course">Course</a>
                <a href="aboutUs.jsp">About</a>
                <a href="yogaGallery.jsp">Gallery</a>
                <a href="contactUs.jsp">Contact</a>
            </nav>

            <c:set var="account" value="${sessionScope.account}"/>
            <c:if test="${account != null}">
                <c:set var="notiList" value="${MessageDao.getAllMessageByUserIDWithNotRead(account.idaccount)}"></c:set>
                    <div class="iconTrainee">
                        <div class="dropdown" style="cursor: pointer">
                            <a class="fa-solid fa-user fa-2xl" href="traineeGeneralDashboard.jsp"></a>
                            <div class="dropdown-content" style="width: 200px; z-index: -1; background: #d0efe1">
                                <p style="text-align: center; margin-top: 50px">${account.name}</p>
                            <p style="font-weight: 900">
                                <a href="/YogaCenter/information">
                                    <i class="fas fa-user icon"></i>
                                    Manage account
                                </a>
                            </p>
                            <p style="font-weight: 900">
                                <a href="/YogaCenter/yourcourse">
                                    <i class="fa-solid fa-book icon"></i>
                                    Your course
                                </a>
                            </p>
                            <p style="font-weight: 900">
                                <a href="/YogaCenter/classbooking">
                                    <i class="fas fa-calendar-alt icon"></i>
                                    Class booking
                                </a>
                            </p>
                            <p style="font-weight: 900">
                                <a href="/YogaCenter/purchase">
                                    <i class="fas fa-money-bill"></i>                
                                    Purchase history
                                </a>
                            </p>
                            <p style="font-weight: 900">
                                <a href="/YogaCenter/request?action=ChangePassword">
                                    <i class="fas fa-lock"></i>
                                    Change password
                                </a>
                            </p>
                            <p style="font-weight: 900">
                                <a href="/YogaCenter/request?action=Logout">
                                    <i class="fas fa-sign-out-alt icon"></i>
                                    Logout
                                </a>
                            </p>
                        </div>
                    </div>
                    <div class='custom-cart-wrapper'>
                        <a href="/YogaCenter/request?action=viewNotification" class="fa-solid fa-bell fa-2xl"></a>
                        <c:choose>
                            <c:when test="${notiList.size() > 0}">
                                <div id='cartQuantity' class='custom-cart'>${notiList.size()}</div>
                            </c:when>
                        </c:choose>
                    </div>

                    <div class='custom-cart-wrapper'>
                        <a href="/YogaCenter/viewcart" class="fa-solid fa-cart-shopping fa-2xl"></a>
                        <c:choose>
                            <c:when test="${cart != null}">
                                <div id='cartQuantity' class='custom-cart'>${cart.size()}</div>
                            </c:when>
                        </c:choose>

                    </div>
                </div>
            </c:if>
            <c:if test="${account == null}">
                <div class="search-form">
                    <div class="navbar" style="font-size: 25px; font-weight: 700">
                        <span><a href="login.jsp">Login </a></span>
                        <span><a href="register.jsp">Register</a></span>
                    </div>
                </div>  
            </c:if>
        </header>
    </body>

    <style>
        a{
            color: black;
        }
        .iconTrainee{
            display: flex;
        }
        .iconTrainee div{
            padding: 0 10px;
        }
        .dropdown {
            position: relative;
            display: inline-block;
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

        .custom-cart-wrapper{
            position: relative;
        }

        .custom-cart{
            position: absolute;
            background: red;
            color: white;
            border-radius: 9999em;
            padding: 2% 10% !important;
            top: -100%;
            right: 0;
        }
    </style>
</html>