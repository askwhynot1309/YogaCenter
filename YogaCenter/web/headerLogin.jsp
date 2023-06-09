<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
    <header class="header" style = "z-index: 1; position: sticky;">
        <a href="home" id="logo"><img src="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png" width="75px" height="75px" alt="logo"/></a>
        <nav class="navbar" style="font-size: 25px; font-weight: 700;">
            <a href="home">Home</a>
            <a href="/YogaCenter/course">Course</a>
            <a href="homepage/aboutUs.jsp">About</a>
            <a href="homepage/yogaGallery.jsp">Gallery</a>
            <a href="contactUs.jsp">Contact</a>
        </nav>
        <c:set var="account" value="${sessionScope.account}"/>
        <c:if test="${account != null}">
            <div class="iconTrainee">
                <div>
                    <span class="fas fa-solid fa-cart-shopping fa-2xl"></span>
                </div>

                <div>
                    <span class="fas fa-solid fa-bell fa-2xl"></span>
                </div>

                <div class="dropdown">
                    <span class="fas fa-solid fa-user fa-2xl"></span>
                    <div class="dropdown-content">
                        <p>${account.name}</p>
                        <p>
                            <a href="/YogaCenter/request?action=TraineeManageInformation">
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
            .iconTrainee{
                display: flex;
                height: 30px;
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
        </style>
</html>