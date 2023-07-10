<%-- 
    Document   : traineeGeneralDashboard
    Created on : Jul 4, 2023, 9:01:24 PM
    Author     : ngmin
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dao.MessageDao"%>
<%@page import="Dao.AttendenceDao"%>
<%@page import="Object.Message"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Object.Account"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="css/trainee/trainee-add-message.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="icon" type="image/x-icon" href="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png">
        <title>Trainee General</title>
    </head>
    <style>
        html,
        body,
        h1,
        h2,
        h3,
        h4,
        h5 {
            font-family: "Raleway", sans-serif
        }
        body{
            font-size: 100%;
        }
        .notificate{
            /*position: absolute;*/
            background: red;
            color: white;
            border-radius: 9999em;
            padding: 0% 2% !important;
            top: -100%;
            right: 0;
        }
        .overlay1 {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 9999;
        }
        .message {
            box-shadow: var(--shadow-2), 0 0 0 100vw rgb(0 0 0 / 0.5);
            background: #fff;
            color: #222;
            border: 0;
            border-radius: 0.25rem;
            position: fixed;
            top: 50%;
            left: 50%;
            border-radius: 20px;
            transform: translate(-50%, -50%);
            padding: 20px;
            z-index: 10000;
        }
        .message::backdrop {
            background: rgb(0 0 0 / 0.5);
            opacity: 0;
        }
    </style>
    <c:import url="header.jsp"/>
    <body class="w3-light-grey">
        <c:set var="acc" value="${sessionScope.account}"/>
        <c:set var="account" value="${requestScope.accountTrainee}"/>
        <c:set var="changesuccess" value="${requestScope.changesuccess}"/>
        <c:set var="cart" value="${sessionScope.cart}"/>
        <c:set var="courseList" value="${requestScope.courseList}"></c:set>
        <c:set var="requestList" value="${sessionScope.requestList}"></c:set>
        <c:if test="${acc == null}">
            <div id="overlay1" class="overlay1"></div>
            <div class="message" id="message">
                <h3 style="text-align: center; color: red">Message</h3>
                <p>Your session is timeout. Back to login page to login again!</p>
                <div style=" text-align: center">
                    <a class="btn btn-primary" href="login.jsp">Login</a>
                </div>
            </div>
        </c:if>
        <c:if test="${acc != null}">
           
            <c:set var="notiList" value="${MessageDao.getAllMessageByUserIDWithNotRead(acc.idaccount)}"></c:set>

                <nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
                    <div style="text-align: center" class="w3-container w3-row">
                        <div class="w3-col image">
                            <img src="img/${account.image}" alt="image" class="w3-circle" width="150px" height="150px" id="avatar">
                    </div>
                    <div class="w3-col w3-bar">
                        <br>
                        <span>Welcome <strong>${account.name}</strong></span><br>
                    </div>
                </div>
                <hr>
                <div class="w3-container">
                    <h5>Dashboard</h5>
                </div>
                <div class="w3-bar-block">
                    <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black"
                       onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>  Close</a>
                    <a href="GeneralDashboard" class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa fa-users fa-fw"></i>  General</a>
                    <a href="yourcourse" class="w3-bar-item w3-button w3-padding"><i class="fa fa-users fa-fw"></i>  My courses</a>
                    <a href="information" class="w3-bar-item w3-button w3-padding"><i class="fa fa-eye fa-fw"></i>  Views</a>
                    <a href="/YogaCenter/classbooking" class="w3-bar-item w3-button w3-padding"><i class="fas fa-calendar-alt fa-fw"></i>  My learning
                        <c:if test="${requestList.size() > 0}">
                            <div class="w3-right notificate">${requestList.size()}</div>
                        </c:if>
                    </a>
                    <a href="/YogaCenter/purchase" class="w3-bar-item w3-button w3-padding"><i class="fa fa-history fa-fw"></i>  Purchase History</a>
                    <a href="/YogaCenter/request?action=ChangePassword" class="w3-bar-item w3-button w3-padding"><i class="fa fa-cog fa-fw"></i>  Settings</a><br><br>
                    <a href="/YogaCenter/request?action=Logout" class="w3-bar-item w3-button w3-padding"><i class="fas fa-sign-out-alt icon"></i>Logout</a>
                </div>
            </nav>
            <div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer"
                 title="close side menu" id="myOverlay">
            </div>

            <!-- !PAGE CONTENT! -->
            <div class="w3-main" style="margin-left:300px;margin-top:43px;">

                <!-- Header -->
                <header class="w3-container" style="padding-top:22px">
                    <h5><b><i class="fa fa-dashboard"></i>${account.name}</b></h5>
                </header>

                <div class="w3-row-padding w3-margin-bottom">
                    <a href="/YogaCenter/request?action=viewNotification" class="w3-third" style="text-decoration: none">
                        <div class="w3-container w3-red w3-padding-16">
                            <div class="w3-left"><i class="fa fa-comment w3-xxxlarge"></i></div>
                            <div class="w3-right">
                                <c:if test="${notiList.size() > 0}">
                                    <h3>${notiList.size()}</h3>
                                </c:if>
                                <c:if test="${notiList == null}">
                                    <h3>0</h3>
                                </c:if>
                            </div>
                            <div class="w3-clear"></div>
                            <h4>Messages</h4>
                        </div>
                    </a>

                    <a href="/YogaCenter/viewcart" class="w3-third" style="text-decoration: none">
                        <div class="w3-container w3-blue w3-padding-16">
                            <div class="w3-left"><i class="fa fa-shopping-cart fa-fw w3-xxxlarge"></i></div>
                            <div class="w3-right">
                                <c:if test="${cart.size() > 0}">
                                    <h3>${cart.size()}</h3>
                                </c:if>
                                <c:if test="${cart == null}">
                                    <h3>0</h3>
                                </c:if>
                            </div>
                            <div class="w3-clear"></div>
                            <h4>Cart</h4>
                        </div>
                    </a>

                    <!--                    <a href="#" class="w3-third">
                                            <div class="w3-container w3-orange w3-text-white w3-padding-16">
                                                <div class="w3-left"><i class="fa fa-users w3-xxxlarge"></i></div>
                                                <div class="w3-right">
                                                    <h3>1</h3>
                                                </div>
                                                <div class="w3-clear"></div>
                                                <h4>Users</h4>
                                            </div>
                                        </a>-->
                </div>

                <hr>
                <div class="w3-container">
                    <h5 class="w3-left">Process Tracking</h5>
                </div>
                <div class="w3-container">

                    <c:if test="${courseList != null && courseList.size() > 0}">
                        <c:forEach var="course" items="${courseList}">
                            <p>${course.name_course}</p>
                            <div class="w3-grey">
                                <c:set var="progress" value="${AttendenceDao.getProgressByAttendance(course.idCourse, acc.idaccount)}"></c:set>
                                
                                <div class="w3-container w3-center w3-green" style="width:${progress}%; padding: 8px 0;">${progress}%</div>
                            </div>
                        </c:forEach>
                    </c:if>
                            <c:if test="${courseList.size() == 0}">
                                <h5 style="color: red; text-align: center">No course</h5>
                            </c:if>
                </div>
                <hr>
                <hr>             
                <hr>

                <footer class="w3-container w3-padding-16 w3-light-grey">
                </footer>
            </div>
        </c:if>



        <script>
            // Get the Sidebar
            var mySidebar = document.getElementById("mySidebar");

            // Get the DIV with overlay effect
            var overlayBg = document.getElementById("myOverlay");

            // Toggle between showing and hiding the sidebar, and add overlay effect
            function w3_open() {
                if (mySidebar.style.display === 'block') {
                    mySidebar.style.display = 'none';
                    overlayBg.style.display = "none";
                } else {
                    mySidebar.style.display = 'block';
                    overlayBg.style.display = "block";
                }
            }

            // Close the sidebar with the close button
            function w3_close() {
                mySidebar.style.display = "none";
                overlayBg.style.display = "none";
            }
        </script>
    </body>
</html>
