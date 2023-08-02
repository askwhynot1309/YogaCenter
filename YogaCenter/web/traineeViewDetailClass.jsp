<%-- 
    Document   : traineeViewYourCourse
    Created on : Jun 21, 2023, 10:09:32 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
        <link rel="icon" type="image/x-icon" href="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png">
        <link rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="css/trainee/trainee-viewyourcourse.css"/>
        <link rel="stylesheet" href="css/trainee/trainee-add-message.css">
        <title>View Your Course</title>
        <style>
            .pagination a.active {
                background-color: #ccc;
                color: #fff;
            }
            .pagination ul li {
                display: inline-block;
                margin: 0 4px;
            }
            .pagination ul li a{
                display: inline-block;
                padding: 4px 8px;
                border: 1px solid #ccc;
                text-decoration: none;
            }
            .pagination a.active{
                background-color: #ccc;
                color: #fff;
            }
            .menu ul li:hover{
                background-color: wheat;
            }
            .menu{
                margin-bottom: 50px;
            }
            .overlay {
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
                top: 40%;
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
            a:hover{
                text-decoration: none;
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
        </style>
    </head>
    <c:import url="header.jsp"/>
    <body class="w3-light-grey">
        <c:set var="exist" value="${sessionScope.account}"/>
        <c:set var="requestList" value="${sessionScope.requestList}"></c:set>
        <c:if test="${exist == null}">
            <div id="overlay" class="overlay"></div>
            <div class="message" id="message">
                <h3 style="text-align: center; color: red">Message</h3>
                <p>Your session is timeout. Back to login page to login again!</p>
                <div style=" text-align: center">
                    <a class="btn btn-primary" href="login.jsp">Login</a>
                </div>
            </div>
        </c:if>
        <c:set var="listCourseTrainee" value="${requestScope.listCourseTrainee}"/>
        <c:set var="current_date" value="${requestScope.current_date}"/>
        <c:set var="refund" value="${requestScope.refund}"/>
        <c:set var="cancel" value="${requestScope.cancel}"/>
        <c:set var="acc" value="${requestScope.accountTrainee}"/>

        <nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
            <div style="text-align: center" class="w3-container w3-row">
                <div class="w3-col image">
                    <img src="img/${acc.image}" alt="image" class="w3-circle " style="width:150px; height: 150px; margin-right: 0px;">
                </div>
                <div class="w3-col w3-bar">
                    <br>
                    <span>Welcome <strong>${acc.name}</strong></span><br>
                </div>
            </div>
            <hr>
            <div class="w3-container">
                <h5>Dashboard</h5>
            </div>
            <div class="w3-bar-block">
                <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black"
                   onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>  Close</a>
                <a href="GeneralDashboard" class="w3-bar-item w3-button w3-padding"><i class="fa fa-users fa-fw"></i>  General</a>
                <a href="yourcourse" class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa fa-users fa-fw"></i>  My courses</a>
                <a href="information" class="w3-bar-item w3-button w3-padding"><i class="fa fa-eye fa-fw"></i>  Views</a>
                <a href="/YogaCenter/classbooking" class="w3-bar-item w3-button w3-padding"><i class="fas fa-calendar-alt icon"></i>  My learning
                    <c:if test="${requestList.size() > 0}">
                        <div class="w3-right notificate">${requestList.size()}</div>
                    </c:if>
                </a>
                <a href="/YogaCenter/purchase" class="w3-bar-item w3-button w3-padding"><i class="fa fa-history fa-fw"></i> Purchase History</a>
                <a href="/YogaCenter/request?action=ChangePassword" class="w3-bar-item w3-button w3-padding"><i class="fa fa-cog fa-fw"></i>  Settings</a><br><br>
                <a href="/YogaCenter/request?action=Logout" class="w3-bar-item w3-button w3-padding"><i class="fas fa-sign-out-alt icon"></i>Logout</a>
            </div>
        </nav>

        <div class="w3-main" style="margin-left:350px;margin-top:43px;">
            <div style="height: 40px; width: 100%; margin-top: 10px; margin-bottom: 10px">
                <a href="/YogaCenter/yourcourse" class="btn">
                    <svg height="16" width="16" xmlns="http://www.w3.org/2000/svg" version="1.1" viewBox="0 0 1024 1024"><path d="M874.690416 495.52477c0 11.2973-9.168824 20.466124-20.466124 20.466124l-604.773963 0 188.083679 188.083679c7.992021 7.992021 7.992021 20.947078 0 28.939099-4.001127 3.990894-9.240455 5.996574-14.46955 5.996574-5.239328 0-10.478655-1.995447-14.479783-5.996574l-223.00912-223.00912c-3.837398-3.837398-5.996574-9.046027-5.996574-14.46955 0-5.433756 2.159176-10.632151 5.996574-14.46955l223.019353-223.029586c7.992021-7.992021 20.957311-7.992021 28.949332 0 7.992021 8.002254 7.992021 20.957311 0 28.949332l-188.073446 188.073446 604.753497 0C865.521592 475.058646 874.690416 484.217237 874.690416 495.52477z"></path></svg>
                    <span>Back</span>
                </a>
            </div>
            <div style="padding: 10px; color: black; background: #d0efe1; margin-bottom: 20px">
                <h2 style="text-transform: uppercase; font-size: 900">Your Detail Class</h2>
            </div>
            <c:if test="${traineeListClass.size() == 0}">
                <h3 style="text-align: center; margin-bottom: 400px; color: red">The temporary course has no classes.</h3>
            </c:if>
            <c:if test="${traineeListClass.size() > 0}">
                <div>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>Room</th>
                                <th>Date-study</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="course" items="${traineeListClass}" varStatus="loop">
                                <tr>
                                    <td>${loop.count}</td>
                                    <td>${course.class_name}</td>
                                    <td>${course.datestudy}</td>
                                    <td>
                                        <c:if test="${course.status == 0}">
                                            <p style="color: black">Not yet</p>
                                        </c:if>
                                        <c:if test="${course.status == 1}">
                                            <p style="color: green">Present</p>
                                        </c:if>
                                        <c:if test="${course.status == 2}">
                                            <p style="color: red">Absent</p>
                                        </c:if>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>
        </div>
    </body>

</html>
