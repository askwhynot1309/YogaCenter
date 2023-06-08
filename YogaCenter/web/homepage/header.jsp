<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="css/style.css">
    </head>

    <body>
        <header class="header" style = "z-index: 1; position: sticky;">
            <a href="homepage.jsp" id="logo"><img src="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png" width="75px" height="75px" alt="logo"/></a>
                <c:set var="account" value="${sessionScope.account}"/>
            <nav class="navbar" style="font-size: 25px; font-weight: 700;">
                <a href="home">Home</a>
                <a href="ShowCourseListServlet">Course</a>
                <a href="homepage/aboutUs.jsp">About</a>
                <a href="homepage/yogaGallery.jsp">Gallery</a>
                <a href="homepage/contactUs.jsp">Contact</a>
            </nav>
            <c:if test="${account != null}">
                <div class="iconTrainee">
                    <div style="cursor: pointer">
                        <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512"><path d="M0 24C0 10.7 10.7 0 24 0H69.5c22 0 41.5 12.8 50.6 32h411c26.3 0 45.5 25 38.6 50.4l-41 152.3c-8.5 31.4-37 53.3-69.5 53.3H170.7l5.4 28.5c2.2 11.3 12.1 19.5 23.6 19.5H488c13.3 0 24 10.7 24 24s-10.7 24-24 24H199.7c-34.6 0-64.3-24.6-70.7-58.5L77.4 54.5c-.7-3.8-4-6.5-7.9-6.5H24C10.7 48 0 37.3 0 24zM128 464a48 48 0 1 1 96 0 48 48 0 1 1 -96 0zm336-48a48 48 0 1 1 0 96 48 48 0 1 1 0-96z"/></svg>
                    </div>

                    <div style="cursor: pointer">
                        <span class="fas fa-solid fa-bell icon"></span>
                    </div>
                    <div class="dropdown" style="cursor: pointer">
                        <span class="fas fa-solid fa-user icon"></span>
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