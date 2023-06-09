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
                    <svg xmlns="http://www.w3.org/2000/svg" height="2em" viewBox="0 0 576 512"><!--! Font Awesome Free 6.4.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M0 24C0 10.7 10.7 0 24 0H69.5c22 0 41.5 12.8 50.6 32h411c26.3 0 45.5 25 38.6 50.4l-41 152.3c-8.5 31.4-37 53.3-69.5 53.3H170.7l5.4 28.5c2.2 11.3 12.1 19.5 23.6 19.5H488c13.3 0 24 10.7 24 24s-10.7 24-24 24H199.7c-34.6 0-64.3-24.6-70.7-58.5L77.4 54.5c-.7-3.8-4-6.5-7.9-6.5H24C10.7 48 0 37.3 0 24zM128 464a48 48 0 1 1 96 0 48 48 0 1 1 -96 0zm336-48a48 48 0 1 1 0 96 48 48 0 1 1 0-96z"/></svg>
                </div>

                <div>
                    <svg xmlns="http://www.w3.org/2000/svg" height="2em" viewBox="0 0 448 512"><path d="M224 0c-17.7 0-32 14.3-32 32V51.2C119 66 64 130.6 64 208v18.8c0 47-17.3 92.4-48.5 127.6l-7.4 8.3c-8.4 9.4-10.4 22.9-5.3 34.4S19.4 416 32 416H416c12.6 0 24-7.4 29.2-18.9s3.1-25-5.3-34.4l-7.4-8.3C401.3 319.2 384 273.9 384 226.8V208c0-77.4-55-142-128-156.8V32c0-17.7-14.3-32-32-32zm45.3 493.3c12-12 18.7-28.3 18.7-45.3H224 160c0 17 6.7 33.3 18.7 45.3s28.3 18.7 45.3 18.7s33.3-6.7 45.3-18.7z"/></svg>
                </div>

                <div class="dropdown">
                    <svg xmlns="http://www.w3.org/2000/svg" height="2em" viewBox="0 0 448 512"><path d="M224 256A128 128 0 1 0 224 0a128 128 0 1 0 0 256zm-45.7 48C79.8 304 0 383.8 0 482.3C0 498.7 13.3 512 29.7 512H418.3c16.4 0 29.7-13.3 29.7-29.7C448 383.8 368.2 304 269.7 304H178.3z"/></svg>
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