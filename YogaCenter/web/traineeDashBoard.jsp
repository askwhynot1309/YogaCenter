<%-- 
    Document   : traineeDashBoard
    Created on : Jun 26, 2023, 1:25:48 PM
    Author     : ngmin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="Dao.AttendenceDao"%>
<!DOCTYPE html>
<html style="overflow-y: scroll">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="icon" type="image/x-icon" href="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png">
        <link rel="stylesheet" href="css/admin/admin.css">
        <link rel="stylesheet" href="css/admin/admin-schedule.css">
        <link rel="stylesheet" href="css/admin/admin-schedule-setup.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="css/admin/admin-employee-add.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
        <title>Trainee Page</title>
    </head>
    <style>
        thead {
            background: #dddcdc;
        }
        .toggle-btn {
            width: 40px;
            height: 21px;
            background: grey;
            border-radius: 50px;
            padding: 3px;
            cursor: pointer;
            -webkit-transition: all 0.3s 0.1s ease-in-out;
            -moz-transition: all 0.3s 0.1s ease-in-out;
            -o-transition: all 0.3s 0.1s ease-in-out;
            transition: all 0.3s 0.1s ease-in-out;
        }

        .toggle-btn > .inner-circle {
            width: 15px;
            height: 15px;
            background: #fff;
            border-radius: 50%;
            -webkit-transition: all 0.3s 0.1s ease-in-out;
            -moz-transition: all 0.3s 0.1s ease-in-out;
            -o-transition: all 0.3s 0.1s ease-in-out;
            transition: all 0.3s 0.1s ease-in-out;
        }

        .toggle-btn.active {
            background: blue !important;
        }

        .toggle-btn.active > .inner-circle {
            margin-left: 19px;
        }
        .cell-1 th{
            vertical-align: middle;
        }
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
        .w3-bar-block a:hover{
            text-decoration: none;
        }
        .head a:hover{
            text-decoration: none;
            color: orange!important;
            background-color: #f1f1f1!important;
            transition: .1s;
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
        .notificate{
            /*position: absolute;*/
            background: red;
            color: white;
            border-radius: 9999em;
            padding: 0% 2% !important;
            /*top: -100%;*/
            /*right: 0;*/
        }
    </style>
    <body class="w3-light-grey">
        <c:import url="header.jsp"></c:import>
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
                <a href="GeneralDashboard" class="w3-bar-item w3-button w3-padding"><i class="fa fa-users fa-fw"></i>  General</a>
                <a href="yourcourse" class="w3-bar-item w3-button w3-padding"><i class="fa fa-users fa-fw"></i>  My courses</a>
                <a href="information" class="w3-bar-item w3-button w3-padding"><i class="fa fa-eye fa-fw"></i>  Views</a>
                <a href="/YogaCenter/classbooking" class="w3-bar-item w3-button w3-padding  w3-blue"><i class="fas fa-calendar-alt icon"></i>  My Learning
                    <c:if test="${requestList.size() > 0}">
                        <div class="w3-right notificate">${requestList.size()}</div>
                    </c:if>
                </a>
                <a href="/YogaCenter/purchase" class="w3-bar-item w3-button w3-padding"><i class="fa fa-history fa-fw"></i> Purchase History</a>
                <a href="/YogaCenter/request?action=ChangePassword" class="w3-bar-item w3-button w3-padding"><i class="fa fa-cog fa-fw"></i>  Settings</a><br><br>
                <a href="/YogaCenter/request?action=Logout" class="w3-bar-item w3-button w3-padding"><i class="fas fa-sign-out-alt icon"></i>Logout</a>
            </div>
        </nav>
        <div class="w3-main" style="margin-left:300px;">
            <header class="w3-container w3-row-padding w3-margin-bottom head" style="padding-top:22px">
                <a href="/YogaCenter/classbooking" class="w3-third w3-bar-item w3-button w3-padding" style="padding: 0"><br><br>
                    <div class="w3-container  w3-padding">
                        <div class="w3-middle"><i class="fas fa-calendar-alt icon w3-xxlarge"><h6>Schedule</h6></i></div>
                    </div>
                </a>

                <a href="/YogaCenter/myCourses" class="w3-third w3-bar-item w3-button w3-padding" style="padding: 0"><br><br>
                    <div class="w3-container  w3-padding">
                        <div class="w3-middle"><i class="fas fa-users w3-xxlarge"><h6>My courses</h6></i></div>
                    </div>
                </a>

                <a href="/YogaCenter/viewRequest" class="w3-third w3-bar-item w3-button w3-padding" style="padding: 0">
                    <c:if test="${requestList.size() > 0}">
                        <div style="display: flex; flex-direction: column; align-items: center;" class="w3-container  w3-padding">
                            <div style="width: 24.525px;" class="w3-middle notificate">
                                ${requestList.size()}
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${requestList == null or requestList.size() == 0}">
                        <br><br>
                    </c:if>
                    <div class="w3-container  w3-padding">
                        <div class="w3-middle"><i class="fas fa-exchange w3-xxlarge"><h6>Request to change classes</h6></i></div>
                    </div>
                </a>
            </header>

            <div class="container">
                <div style="padding: 0">
                    <div class="content">
                        <!--<h2 style="text-transform: uppercase; text-align: center;">Yoga Center Schedule</h2>-->
                        <div class="row">
                            <c:set var="listDays" value="${requestScope.listDay}" />
                            <c:set var="listClass" value="${requestScope.listClass}" />
                            <c:set var="currentweek" value="${requestScope.currentweek}"/>
                            <c:set var="message" value="${message}"/>
                            <c:if test="${listDays != null}">
                                <c:if test="${currentweek != null}">
                                    <c:if test="${listClass != null}">
                                        <div class="table-responsive">
                                            <button onclick="previousWeek()" style="float: left; margin-bottom: 10px">Previous week</button>
                                            <button onclick="nextWeek()" style="float: right; margin-bottom: 10px">Next week</button>
                                            <c:forEach var="listDay" items="${listDays}">
                                                <div class="table-con" style="display: ${listDay.equals(currentweek) ? 'block' : 'none'}">
                                                    <table class="table table-bordered" style="width: 100%">
                                                        <thead class="thead-dark">
                                                            <tr>
                                                                <th style="text-align: center; width: 100px">
                                                                    <div style="margin-bottom: 20%">Time</div>
                                                                </th>
                                                                <th style="text-align: center; width: 160px">
                                                                    <p>Sunday</p>
                                                                    <c:forEach var="day" items="${listDay}">
                                                                        <c:if test="${day.getDay() == 'Sunday'}">
                                                                            <p>${day.getDate()}</p>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </th>
                                                                <th style="text-align: center; width: 160px">
                                                                    <p>Monday</p>
                                                                    <c:forEach var="day" items="${listDay}">
                                                                        <c:if test="${day.getDay() == 'Monday'}">
                                                                            <p>${day.getDate()}</p>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </th>
                                                                <th style="text-align: center; width: 160px">
                                                                    <p>Tuesday</p>
                                                                    <c:forEach var="day" items="${listDay}">
                                                                        <c:if test="${day.getDay() == 'Tuesday'}">
                                                                            <p>${day.getDate()}</p>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </th>
                                                                <th style="text-align: center; width: 160px">
                                                                    <p>Wednesday</p>
                                                                    <c:forEach var="day" items="${listDay}">
                                                                        <c:if test="${day.getDay() == 'Wednesday'}">
                                                                            <p>${day.getDate()}</p>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </th>
                                                                <th style="text-align: center; width: 160px">
                                                                    <p>Thursday</p>
                                                                    <c:forEach var="day" items="${listDay}">
                                                                        <c:if test="${day.getDay() == 'Thursday'}">
                                                                            <p>${day.getDate()}</p>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </th>
                                                                <th style="text-align: center; width: 160px">
                                                                    <p>Friday</p>
                                                                    <c:forEach var="day" items="${listDay}">
                                                                        <c:if test="${day.getDay() == 'Friday'}">
                                                                            <p>${day.getDate()}</p>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </th>
                                                                <th style="text-align: center; width: 160px">
                                                                    <p>Saturday</p>
                                                                    <c:forEach var="day" items="${listDay}">
                                                                        <c:if test="${day.getDay() == 'Saturday'}">
                                                                            <p>${day.getDate()}</p>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                        <tbody style="font-size: 14px">
                                                            <tr style="height: 170px; text-align: center">
                                                                <td>
                                                                    <div style="margin-top: 40%">9h - 11h</div>
                                                                </td>
                                                                <td>
                                                                    <c:forEach var="day" items="${listDay}">
                                                                        <c:forEach var="acc" items="${listClass}">
                                                                            <c:choose>
                                                                                <c:when test="${acc.datestudy == day.getDate() && acc.time == 1 && day.getDay() == 'Sunday'}">
                                                                                    <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_class}&option=classDetail&datestudy=${acc.datestudy}">${acc.course}(${acc.class_name})</a></p><p>${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy)}</p> 
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:forEach>
                                                                </td>
                                                                <td>
                                                                    <c:forEach var="day" items="${listDay}">
                                                                        <c:forEach var="acc" items="${listClass}">
                                                                            <c:choose>
                                                                                <c:when test="${acc.datestudy == day.getDate() && acc.time == 1 && day.getDay() == 'Monday'}">
                                                                                    <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_class}&option=classDetail&datestudy=${acc.datestudy}">${acc.course}(${acc.class_name})</a></p>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'not yet'}">
                                                                                        <p style="color: black">Not yet</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'present'}">
                                                                                        <p style="color: green">Present</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'absent'}">
                                                                                        <p style="color: red">Absent</p>
                                                                                    </c:if>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:forEach>
                                                                </td>
                                                                <td>
                                                                    <c:forEach var="day" items="${listDay}">
                                                                        <c:forEach var="acc" items="${listClass}">
                                                                            <c:choose>
                                                                                <c:when test="${acc.datestudy == day.getDate() && acc.time == 1 && day.getDay() == 'Tuesday'}">
                                                                                    <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_class}&option=classDetail&datestudy=${acc.datestudy}">${acc.course}(${acc.class_name})</a></p>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'not yet'}">
                                                                                        <p style="color: black">Not yet</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'present'}">
                                                                                        <p style="color: green">Present</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'absent'}">
                                                                                        <p style="color: red">Absent</p>
                                                                                    </c:if>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:forEach>
                                                                </td>
                                                                <td>
                                                                    <c:forEach var="day" items="${listDay}">
                                                                        <c:forEach var="acc" items="${listClass}">
                                                                            <c:choose>
                                                                                <c:when test="${acc.datestudy == day.getDate() && acc.time == 1 && day.getDay() == 'Wednesday'}">
                                                                                    <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_class}&option=classDetail&datestudy=${acc.datestudy}">${acc.course}(${acc.class_name})</a></p>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'not yet'}">
                                                                                        <p style="color: black">Not yet</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'present'}">
                                                                                        <p style="color: green">Present</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'absent'}">
                                                                                        <p style="color: red">Absent</p>
                                                                                    </c:if>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:forEach>
                                                                </td>
                                                                <td>
                                                                    <c:forEach var="day" items="${listDay}">
                                                                        <c:forEach var="acc" items="${listClass}">
                                                                            <c:choose>
                                                                                <c:when test="${acc.datestudy == day.getDate() && acc.time == 1 && day.getDay() == 'Thursday'}">
                                                                                    <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_class}&option=classDetail&datestudy=${acc.datestudy}">${acc.course}(${acc.class_name})</a></p>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'not yet'}">
                                                                                        <p style="color: black">Not yet</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'present'}">
                                                                                        <p style="color: green">Present</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'absent'}">
                                                                                        <p style="color: red">Absent</p>
                                                                                    </c:if> 
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:forEach>
                                                                </td>
                                                                <td>
                                                                    <c:forEach var="day" items="${listDay}">
                                                                        <c:forEach var="acc" items="${listClass}">
                                                                            <c:choose>
                                                                                <c:when test="${acc.datestudy == day.getDate() && acc.time == 1 && day.getDay() == 'Friday'}">
                                                                                    <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_class}&option=classDetail&datestudy=${acc.datestudy}">${acc.course}(${acc.class_name})</a></p>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'not yet'}">
                                                                                        <p style="color: black">Not yet</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'present'}">
                                                                                        <p style="color: green">Present</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'absent'}">
                                                                                        <p style="color: red">Absent</p>
                                                                                    </c:if>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:forEach>
                                                                </td>
                                                                <td>
                                                                    <c:forEach var="day" items="${listDay}">
                                                                        <c:forEach var="acc" items="${listClass}">
                                                                            <c:choose>
                                                                                <c:when test="${acc.datestudy == day.getDate() && acc.time == 1 && day.getDay() == 'Saturday'}">
                                                                                    <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_class}&option=classDetail&datestudy=${acc.datestudy}">${acc.course}(${acc.class_name})</a></p>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'not yet'}">
                                                                                        <p style="color: black">Not yet</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'present'}">
                                                                                        <p style="color: green">Present</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'absent'}">
                                                                                        <p style="color: red">Absent</p>
                                                                                    </c:if>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:forEach>
                                                                </td>
                                                            </tr>
                                                            <tr style="height: 170px; text-align: center">
                                                                <td>
                                                                    <div style="margin-top: 40%">13h - 15h</div>
                                                                </td>
                                                                <td>
                                                                    <c:forEach var="day" items="${listDay}">
                                                                        <c:forEach var="acc" items="${listClass}">
                                                                            <c:choose>
                                                                                <c:when test="${acc.datestudy == day.getDate() && acc.time == 2 && day.getDay() == 'Sunday'}">
                                                                                    <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_class}&option=classDetail&datestudy=${acc.datestudy}">${acc.course}(${acc.class_name})</a></p>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'not yet'}">
                                                                                        <p style="color: black">Not yet</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'present'}">
                                                                                        <p style="color: green">Present</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'absent'}">
                                                                                        <p style="color: red">Absent</p>
                                                                                    </c:if>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:forEach>
                                                                </td>
                                                                <td>
                                                                    <c:forEach var="day" items="${listDay}">
                                                                        <c:forEach var="acc" items="${listClass}">
                                                                            <c:choose>
                                                                                <c:when test="${acc.datestudy == day.getDate() && acc.time == 2 && day.getDay() == 'Monday'}">
                                                                                    <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_class}&option=classDetail&datestudy=${acc.datestudy}">${acc.course}(${acc.class_name})</a></p>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'not yet'}">
                                                                                        <p style="color: black">Not yet</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'present'}">
                                                                                        <p style="color: green">Present</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'absent'}">
                                                                                        <p style="color: red">Absent</p>
                                                                                    </c:if> 
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:forEach>
                                                                </td>
                                                                <td>
                                                                    <c:forEach var="day" items="${listDay}">
                                                                        <c:forEach var="acc" items="${listClass}">
                                                                            <c:choose>
                                                                                <c:when test="${acc.datestudy == day.getDate() && acc.time == 2 && day.getDay() == 'Tuesday'}">
                                                                                    <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_class}&option=classDetail&datestudy=${acc.datestudy}">${acc.course}(${acc.class_name})</a></p>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'not yet'}">
                                                                                        <p style="color: black">Not yet</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'present'}">
                                                                                        <p style="color: green">Present</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'absent'}">
                                                                                        <p style="color: red">Absent</p>
                                                                                    </c:if>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:forEach>
                                                                </td>
                                                                <td>
                                                                    <c:forEach var="day" items="${listDay}">
                                                                        <c:forEach var="acc" items="${listClass}">
                                                                            <c:choose>
                                                                                <c:when test="${acc.datestudy == day.getDate() && acc.time == 2 && day.getDay() == 'Wednesday'}">
                                                                                    <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_class}&option=classDetail&datestudy=${acc.datestudy}">${acc.course}(${acc.class_name})</a></p>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'not yet'}">
                                                                                        <p style="color: black">Not yet</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'present'}">
                                                                                        <p style="color: green">Present</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'absent'}">
                                                                                        <p style="color: red">Absent</p>
                                                                                    </c:if>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:forEach>
                                                                </td>
                                                                <td>
                                                                    <c:forEach var="day" items="${listDay}">
                                                                        <c:forEach var="acc" items="${listClass}">
                                                                            <c:choose>
                                                                                <c:when test="${acc.datestudy == day.getDate() && acc.time == 2 && day.getDay() == 'Thursday'}">
                                                                                    <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_class}&option=classDetail&datestudy=${acc.datestudy}">${acc.course}(${acc.class_name})</a></p>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'not yet'}">
                                                                                        <p style="color: black">Not yet</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'present'}">
                                                                                        <p style="color: green">Present</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'absent'}">
                                                                                        <p style="color: red">Absent</p>
                                                                                    </c:if>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:forEach>
                                                                </td>
                                                                <td>
                                                                    <c:forEach var="day" items="${listDay}">
                                                                        <c:forEach var="acc" items="${listClass}">
                                                                            <c:choose>
                                                                                <c:when test="${acc.datestudy == day.getDate() && acc.time == 2 && day.getDay() == 'Friday'}">
                                                                                    <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_class}&option=classDetail&datestudy=${acc.datestudy}">${acc.course}(${acc.class_name})</a></p>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'not yet'}">
                                                                                        <p style="color: black">Not yet</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'present'}">
                                                                                        <p style="color: green">Present</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'absent'}">
                                                                                        <p style="color: red">Absent</p>
                                                                                    </c:if>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:forEach>
                                                                </td>
                                                                <td>
                                                                    <c:forEach var="day" items="${listDay}">
                                                                        <c:forEach var="acc" items="${listClass}">
                                                                            <c:choose>
                                                                                <c:when test="${acc.datestudy == day.getDate() && acc.time == 2 && day.getDay() == 'Saturday'}">
                                                                                    <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_class}&option=classDetail&datestudy=${acc.datestudy}">${acc.course}(${acc.class_name})</a></p>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'not yet'}">
                                                                                        <p style="color: black">Not yet</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'present'}">
                                                                                        <p style="color: green">Present</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'absent'}">
                                                                                        <p style="color: red">Absent</p>
                                                                                    </c:if>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:forEach>
                                                                </td>
                                                            </tr>

                                                            <tr style="height: 170px; text-align: center">
                                                                <td>
                                                                    <div style="margin-top: 40%">16h - 18h</div>
                                                                </td>
                                                                <td>
                                                                    <c:forEach var="day" items="${listDay}">
                                                                        <c:forEach var="acc" items="${listClass}">
                                                                            <c:choose>
                                                                                <c:when test="${acc.datestudy == day.getDate() && acc.time == 3 && day.getDay() == 'Sunday'}">
                                                                                    <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_class}&option=classDetail&datestudy=${acc.datestudy}">${acc.course}(${acc.class_name})</a></p>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'not yet'}">
                                                                                        <p style="color: black">Not yet</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'present'}">
                                                                                        <p style="color: green">Present</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'absent'}">
                                                                                        <p style="color: red">Absent</p>
                                                                                    </c:if>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:forEach>
                                                                </td>
                                                                <td>
                                                                    <c:forEach var="day" items="${listDay}">
                                                                        <c:forEach var="acc" items="${listClass}">
                                                                            <c:choose>
                                                                                <c:when test="${acc.datestudy == day.getDate() && acc.time == 3 && day.getDay() == 'Monday'}">
                                                                                    <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_class}&option=classDetail&datestudy=${acc.datestudy}">${acc.course}(${acc.class_name})</a></p>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'not yet'}">
                                                                                        <p style="color: black">Not yet</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'present'}">
                                                                                        <p style="color: green">Present</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'absent'}">
                                                                                        <p style="color: red">Absent</p>
                                                                                    </c:if>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:forEach>
                                                                </td>
                                                                <td>
                                                                    <c:forEach var="day" items="${listDay}">
                                                                        <c:forEach var="acc" items="${listClass}">
                                                                            <c:choose>
                                                                                <c:when test="${acc.datestudy == day.getDate() && acc.time == 3 && day.getDay() == 'Tuesday'}">
                                                                                    <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_class}&option=classDetail&datestudy=${acc.datestudy}">${acc.course}(${acc.class_name})</a></p>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'not yet'}">
                                                                                        <p style="color: black">Not yet</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'present'}">
                                                                                        <p style="color: green">Present</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'absent'}">
                                                                                        <p style="color: red">Absent</p>
                                                                                    </c:if>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:forEach>
                                                                </td>
                                                                <td>
                                                                    <c:forEach var="day" items="${listDay}">
                                                                        <c:forEach var="acc" items="${listClass}">
                                                                            <c:choose>
                                                                                <c:when test="${acc.datestudy == day.getDate() && acc.time == 3 && day.getDay() == 'Wednesday'}">
                                                                                    <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_class}&option=classDetail&datestudy=${acc.datestudy}">${acc.course}(${acc.class_name})</a></p>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'not yet'}">
                                                                                        <p style="color: black">Not yet</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'present'}">
                                                                                        <p style="color: green">Present</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'absent'}">
                                                                                        <p style="color: red">Absent</p>
                                                                                    </c:if> 
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:forEach>
                                                                </td>
                                                                <td>
                                                                    <c:forEach var="day" items="${listDay}">
                                                                        <c:forEach var="acc" items="${listClass}">
                                                                            <c:choose>
                                                                                <c:when test="${acc.datestudy == day.getDate() && acc.time == 3 && day.getDay() == 'Thursday'}">
                                                                                    <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_class}&option=classDetail&datestudy=${acc.datestudy}">${acc.course}(${acc.class_name})</a></p>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'not yet'}">
                                                                                        <p style="color: black">Not yet</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'present'}">
                                                                                        <p style="color: green">Present</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'absent'}">
                                                                                        <p style="color: red">Absent</p>
                                                                                    </c:if>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:forEach>
                                                                </td>
                                                                <td>
                                                                    <c:forEach var="day" items="${listDay}">
                                                                        <c:forEach var="acc" items="${listClass}">
                                                                            <c:choose>
                                                                                <c:when test="${acc.datestudy == day.getDate() && acc.time == 3 && day.getDay() == 'Friday'}">
                                                                                    <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_class}&option=classDetail&datestudy=${acc.datestudy}">${acc.course}(${acc.class_name})</a></p>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'not yet'}">
                                                                                        <p style="color: black">Not yet</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'present'}">
                                                                                        <p style="color: green">Present</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'absent'}">
                                                                                        <p style="color: red">Absent</p>
                                                                                    </c:if>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:forEach>
                                                                </td>
                                                                <td>
                                                                    <c:forEach var="day" items="${listDay}">
                                                                        <c:forEach var="acc" items="${listClass}">
                                                                            <c:choose>
                                                                                <c:when test="${acc.datestudy == day.getDate() && acc.time == 3 && day.getDay() == 'Saturday'}">
                                                                                    <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_class}&option=classDetail&datestudy=${acc.datestudy}">${acc.course}(${acc.class_name})</a></p>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'not yet'}">
                                                                                        <p style="color: black">Not yet</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'present'}">
                                                                                        <p style="color: green">Present</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'absent'}">
                                                                                        <p style="color: red">Absent</p>
                                                                                    </c:if>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:forEach>
                                                                </td>
                                                            </tr>
                                                            <tr style="height: 170px; text-align: center">
                                                                <td>
                                                                    <div style="margin-top: 40%">19h - 21h</div>
                                                                </td>
                                                                <td>
                                                                    <c:forEach var="day" items="${listDay}">
                                                                        <c:forEach var="acc" items="${listClass}">
                                                                            <c:choose>
                                                                                <c:when test="${acc.datestudy == day.getDate() && acc.time == 4 && day.getDay() == 'Sunday'}">
                                                                                    <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_class}&option=classDetail&datestudy=${acc.datestudy}">${acc.course}(${acc.class_name})</a></p>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'not yet'}">
                                                                                        <p style="color: black">Not yet</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'present'}">
                                                                                        <p style="color: green">Present</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'absent'}">
                                                                                        <p style="color: red">Absent</p>
                                                                                    </c:if>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:forEach>
                                                                </td>
                                                                <td>
                                                                    <c:forEach var="day" items="${listDay}">
                                                                        <c:forEach var="acc" items="${listClass}">
                                                                            <c:choose>
                                                                                <c:when test="${acc.datestudy == day.getDate() && acc.time == 4 && day.getDay() == 'Monday'}">
                                                                                    <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_class}&option=classDetail&datestudy=${acc.datestudy}">${acc.course}(${acc.class_name})</a></p>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'not yet'}">
                                                                                        <p style="color: black">Not yet</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'present'}">
                                                                                        <p style="color: green">Present</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'absent'}">
                                                                                        <p style="color: red">Absent</p>
                                                                                    </c:if>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:forEach>
                                                                </td>
                                                                <td>
                                                                    <c:forEach var="day" items="${listDay}">
                                                                        <c:forEach var="acc" items="${listClass}">
                                                                            <c:choose>
                                                                                <c:when test="${acc.datestudy == day.getDate() && acc.time == 4 && day.getDay() == 'Tuesday'}">
                                                                                    <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_class}&option=classDetail&datestudy=${acc.datestudy}">${acc.course}(${acc.class_name})</a></p>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'not yet'}">
                                                                                        <p style="color: black">Not yet</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'present'}">
                                                                                        <p style="color: green">Present</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'absent'}">
                                                                                        <p style="color: red">Absent</p>
                                                                                    </c:if>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:forEach>
                                                                </td>
                                                                <td>
                                                                    <c:forEach var="day" items="${listDay}">
                                                                        <c:forEach var="acc" items="${listClass}">
                                                                            <c:choose>
                                                                                <c:when test="${acc.datestudy == day.getDate() && acc.time == 4 && day.getDay() == 'Wednesday'}">
                                                                                    <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_class}&option=classDetail&datestudy=${acc.datestudy}">${acc.course}(${acc.class_name})</a></p>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'not yet'}">
                                                                                        <p style="color: black">Not yet</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'present'}">
                                                                                        <p style="color: green">Present</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'absent'}">
                                                                                        <p style="color: red">Absent</p>
                                                                                    </c:if>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:forEach>
                                                                </td>
                                                                <td>
                                                                    <c:forEach var="day" items="${listDay}">
                                                                        <c:forEach var="acc" items="${listClass}">
                                                                            <c:choose>
                                                                                <c:when test="${acc.datestudy == day.getDate() && acc.time == 4 && day.getDay() == 'Thursday'}">
                                                                                    <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_class}&option=classDetail&datestudy=${acc.datestudy}">${acc.course}(${acc.class_name})</a></p>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'not yet'}">
                                                                                        <p style="color: black">Not yet</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'present'}">
                                                                                        <p style="color: green">Present</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'absent'}">
                                                                                        <p style="color: red">Absent</p>
                                                                                    </c:if>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:forEach>
                                                                </td>
                                                                <td>
                                                                    <c:forEach var="day" items="${listDay}">
                                                                        <c:forEach var="acc" items="${listClass}">
                                                                            <c:choose>
                                                                                <c:when test="${acc.datestudy == day.getDate() && acc.time == 4 && day.getDay() == 'Friday'}">
                                                                                    <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_class}&option=classDetail&datestudy=${acc.datestudy}">${acc.course}(${acc.class_name})</a></p>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'not yet'}">
                                                                                        <p style="color: black">Not yet</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'present'}">
                                                                                        <p style="color: green">Present</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'absent'}">
                                                                                        <p style="color: red">Absent</p>
                                                                                    </c:if>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:forEach>
                                                                </td>
                                                                <td>
                                                                    <c:forEach var="day" items="${listDay}">
                                                                        <c:forEach var="acc" items="${listClass}">
                                                                            <c:choose>
                                                                                <c:when test="${acc.datestudy == day.getDate() && acc.time == 4 && day.getDay() == 'Saturday'}">
                                                                                    <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_class}&option=ClassDetailclassDetail">${acc.course}(${acc.class_name})</a></p>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'not yet'}">
                                                                                        <p style="color: black">Not yet</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'present'}">
                                                                                        <p style="color: green">Present</p>
                                                                                    </c:if>
                                                                                    <c:if test="${AttendenceDao.attendanceStatus(acc.idaccount, acc.id_class, acc.datestudy) == 'absent'}">
                                                                                        <p style="color: red">Absent</p>
                                                                                    </c:if>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:forEach>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </c:if>
                                    <c:if test="${listClass == null}">
                                        <div class="table-responsive">
                                            <button onclick="previousWeek()" style="float: left; margin-bottom: 10px">Previous week</button>
                                            <button onclick="nextWeek()" style="float: right; margin-bottom: 10px">Next week</button>
                                            <c:forEach var="listDay" items="${listDays}">
                                                <div class="table-con" style="display: ${listDay.equals(currentweek) ? 'block' : 'none'}">
                                                    <table class="table table-bordered" style="width: 100%">
                                                        <thead class="thead-dark">
                                                            <tr>
                                                                <th style="text-align: center; width: 185px">
                                                                    <div style="margin-bottom: 20%">Time</div>
                                                                </th>
                                                                <th style="text-align: center; width: 150px">
                                                                    <p>Sunday</p>
                                                                    <c:forEach var="day" items="${listDay}">
                                                                        <c:if test="${day.getDay() == 'Sunday'}">
                                                                            <p>${day.getDate()}</p>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </th>
                                                                <th style="text-align: center; width: 150px">
                                                                    <p>Monday</p>
                                                                    <c:forEach var="day" items="${listDay}">
                                                                        <c:if test="${day.getDay() == 'Monday'}">
                                                                            <p>${day.getDate()}</p>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </th>
                                                                <th style="text-align: center; width: 150px">
                                                                    <p>Tuesday</p>
                                                                    <c:forEach var="day" items="${listDay}">
                                                                        <c:if test="${day.getDay() == 'Tuesday'}">
                                                                            <p>${day.getDate()}</p>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </th>
                                                                <th style="text-align: center; width: 150px">
                                                                    <p>Wednesday</p>
                                                                    <c:forEach var="day" items="${listDay}">
                                                                        <c:if test="${day.getDay() == 'Wednesday'}">
                                                                            <p>${day.getDate()}</p>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </th>
                                                                <th style="text-align: center; width: 150px">
                                                                    <p>Thursday</p>
                                                                    <c:forEach var="day" items="${listDay}">
                                                                        <c:if test="${day.getDay() == 'Thursday'}">
                                                                            <p>${day.getDate()}</p>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </th>
                                                                <th style="text-align: center; width: 150px">
                                                                    <p>Friday</p>
                                                                    <c:forEach var="day" items="${listDay}">
                                                                        <c:if test="${day.getDay() == 'Friday'}">
                                                                            <p>${day.getDate()}</p>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </th>
                                                                <th style="text-align: center; width: 150px">
                                                                    <p>Saturday</p>
                                                                    <c:forEach var="day" items="${listDay}">
                                                                        <c:if test="${day.getDay() == 'Saturday'}">
                                                                            <p>${day.getDate()}</p>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr style="height: 170px; text-align: center">
                                                                <td>
                                                                    <div style="margin-top: 40%">9h - 11h</div>
                                                                </td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr style="height: 170px; text-align: center">
                                                                <td>
                                                                    <div style="margin-top: 40%">13h - 15h</div>
                                                                </td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr style="height: 170px; text-align: center">
                                                                <td>
                                                                    <div style="margin-top: 40%">16h - 18h</div>
                                                                </td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr style="height: 170px; text-align: center">
                                                                <td>
                                                                    <div style="margin-top: 40%">19h - 21h</div>
                                                                </td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </c:if>
                                </c:if>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <c:if test="${message != null}">
            <div class="notification-success" style="height: 100px; margin-top: 100px">
                <div class="content">
                    <div class="title">Notification</div>
                    <span>Join class successfully.</span>
                </div>
            </div>
            <script>
                let notification = document.querySelector('.notification-success');
                notification.timeOut = setTimeout(() => notification.remove(), 5000);
            </script>
        </c:if>
        <script>
            var scheduleTable = document.getElementsByClassName("table-con");
            var currentWeek = findCurrentWeek();

            function findCurrentWeek() {
                for (var i = 0; i < scheduleTable.length; i++) {
                    if (scheduleTable[i].style.display === "block") {
                        return i;
                    }
                }
                return 0;
            }
            function previousWeek() {
                if (currentWeek > 0) {
                    currentWeek--;
                    updateScheduleTable();
                }
            }

            function nextWeek() {
                if (currentWeek < scheduleTable.length - 1) {
                    currentWeek++;
                    updateScheduleTable();
                }
            }

            function updateScheduleTable() {
                for (var i = 0; i < scheduleTable.length; i++) {
                    scheduleTable[i].style.display = "none";
                }
                scheduleTable[currentWeek].style.display = "block";
            }

        </script>

        <c:set var="ChangeFail" value="${requestScope.ChangeFail}"/>
        <c:if test="${ChangeFail != null}">
            <script>
                window.alert("${ChangeFail}");
            </script>
        </c:if>
    </body>
</html>
