
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Admin Dashboard</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="admin.css">
    </head>

    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2">
                    <div class="sidebar">
                        <h3>Admin Dashboard</h3>
                        <ul>
                            <li>
                                <a href="/YogaCenter/request?action=AdminDashBoard">
                                    <i class="fas fa-user icon"></i>
                                    Admin DashBoard
                                </a>
                            </li>
                            <li>
                                <a href="/YogaCenter/request?action=ManageEmployee">
                                    <i class="fas fa-user icon"></i>
                                    Manage Trainer
                                </a>
                            </li>
                            <li>
                                <a href="/YogaCenter/request?action=ManageSchedule">
                                    <i class="fas fa-calendar-alt icon"></i>
                                    Manage Schedule
                                </a>
                            </li>
                            <li>
                                <a href="/YogaCenter/request?action=ManageUser">
                                    <i class="fas fa-users icon"></i>
                                    Manage User
                                </a>
                            </li>
                            <li>
                                <a href="/YogaCenter/request?action=adminCourseList">
                                    <i class="fas fa-book icon"></i>
                                    Course List
                                </a>
                            </li>
                        </ul>
                        <div class="divider"></div>
                        <h4>Settings</h4>
                        <ul>
                            <li>
                                <a href="/YogaCenter/request?action=Logout">
                                    <i class="fas fa-sign-out-alt icon"></i>
                                    Logout
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
<<<<<<< Updated upstream
                <div class="col-lg-9">
                    <h2 style="display: flex; justify-content: center; margin-bottom: 20px;">Yoga Center Schedule</h2>
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead class="thead-dark">
                                <tr>
                                    <th>Time</th>
                                    <th>Monday</th>
                                    <th>Tuesday</th>
                                    <th>Wednesday</th>
                                    <th>Thursday</th>
                                    <th>Friday</th>
                                    <th>Saturday</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Morning 1</td>
                                    <td>
                                        <p>Yoga Class 1</p>
                                        <p>Instructor: John Doe</p>
                                        <button class="btn btn-primary">Details</button>
                                    </td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>
                                        <p>Yoga Class 3</p>
                                        <p>Instructor: Michael Johnson</p>
                                        <button class="btn btn-primary">Details</button>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Morning 2</td>
                                    <td></td>
                                    <td>
                                        <p>Yoga Class 5</p>
                                        <p>Instructor: David Wilson</p>
                                        <button class="btn btn-primary">Details</button>
                                    </td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>
                                        <p>Yoga Class 7</p>
                                        <p>Instructor: Jessica Brown</p>
                                        <button class="btn btn-primary">Details</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Afternoon 1</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Afternoon 2</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>                             
                                </tr>
                            </tbody>
                        </table>
=======
                <div class="col-md-10">
                    <h2 style="display: flex; justify-content: center; margin-bottom: 20px; font-family: monospace;font-weight: 700; margin-top: 20px; text-transform: uppercase">Yoga Center Schedule</h2>
                    <c:set var="listDays" value="${requestScope.listDay}" />
                    <c:set var="listClass" value="${requestScope.listClass}" />
                    <c:set var="currentweek" value="${requestScope.currentweek}" />
                    <c:if test="${listDays != null}">
                        <c:if test="${currentweek != null}">
                            <c:if test="${listClass != null}">
                                <div class="table-responsive">
                                    <button onclick="previousWeek()" style="float: left; margin-bottom: 10px">Tuần trước</button>
                                    <button onclick="nextWeek()" style="float: right; margin-bottom: 10px">Tuần sau</button>
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
                                                        <td>
                                                            <c:forEach var="day" items="${listDay}">
                                                                <c:forEach var="acc" items="${listClass}">
                                                                    <c:choose>
                                                                        <c:when test="${acc.datestudy == day.getDate() && acc.time == 1 && day.getDay() == 'Sunday'}">
                                                                            <a href="">${acc.account}(${acc.class_name})</a> 
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
                                                                            <a href="">${acc.account}(${acc.class_name})</a> 
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
                                                                        <c:when test="${acc.datestudy == day.getDate() && acc.time == 1 && day.getDay() == 'TuesDay'}">
                                                                            <a href="">${acc.account}(${acc.class_name})</a> 
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
                                                                            <a href="">${acc.account}(${acc.class_name})</a> 
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
                                                                            <a href="">${acc.account}(${acc.class_name})</a> 
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
                                                                            <a href="">${acc.account}(${acc.class_name})</a> 
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
                                                                            <a href="">${acc.account}(${acc.class_name})</a> 
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
                                                                            <a href="">${acc.account}(${acc.class_name})</a> 
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
                                                                            <a href="">${acc.account}(${acc.class_name})</a> 
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
                                                                            <a href="">${acc.account}(${acc.class_name})</a> 
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
                                                                            <a href="">${acc.account}(${acc.class_name})</a> 
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
                                                                            <a href="">${acc.account}(${acc.class_name})</a> 
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
                                                                            <a href="">${acc.account}(${acc.class_name})</a> 
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
                                                                            <a href="">${acc.account}(${acc.class_name})</a> 
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
                                                                            <a href="">${acc.account}(${acc.class_name})</a> 
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
                                                                            <a href="">${acc.account}(${acc.class_name})</a> 
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
                                                                            <a href="">${acc.account}(${acc.class_name})</a> 
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
                                                                            <a href="">${acc.account}(${acc.class_name})</a> 
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
                                                                            <a href="">${acc.account}(${acc.class_name})</a> 
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
                                                                            <a href="">${acc.account}(${acc.class_name})</a> 
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
                                                                            <a href="">${acc.account}(${acc.class_name})</a> 
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
                                                                            <a href="">${acc.account}(${acc.class_name})</a> 
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
                                                                            <a href="">${acc.account}(${acc.class_name})</a> 
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
                                                                            <a href="">${acc.account}(${acc.class_name})</a> 
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
                                                                            <a href="">${acc.account}(${acc.class_name})</a> 
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
                                                                            <a href="">${acc.account}(${acc.class_name})</a> 
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
                                                                            <a href="">${acc.account}(${acc.class_name})</a> 
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
                                                                            <a href="">${acc.account}(${acc.class_name})</a> 
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
                            <c:if test="listClass == null && listClass.isEmpty()">
                                <div class="table-responsive">
                                    <button onclick="previousWeek()" style="float: left; margin-bottom: 10px">Tuần trước</button>
                                    <button onclick="nextWeek()" style="float: right; margin-bottom: 10px">Tuần sau</button>
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

                    <h3 style="margin-top: 20px">Set up Schedule Table for Trainers</h3>
                    <div>
                        <c:set var="listTrainer" value="${requestScope.listTrainer}" />
                        <c:set var="listRoom" value="${requestScope.listRoom}" />
                        <c:set var="listTime" value="${requestScope.listTime}" />
                        <c:set var="listCourse" value="${requestScope.listCourse}" />
                        <form action="/request" method="POST">
                            <div style="display: flex; justify-content: space-between; align-items: center; margin-top: 20px">
                                <p>Trainer :
                                    <c:if test="${listTrainer != null}">
                                        <select name="course" id="select-box">
                                            <option></option>
                                            <c:forEach var="trainer" items="${listTrainer}">
                                                <option value="${trainer.idaccount}">${trainer.name}</option>
                                            </c:forEach>
                                        </select>
                                    </c:if>
                                    <c:if test="${listTrainer == null}">
                                        No trainers
                                    </c:if>
                                </p>
                                <p>Course : 
                                    <c:if test="${listCourse != null}">
                                        <select name="course" id="select-box">
                                            <option></option>
                                            <c:forEach var="course" items="${listCourse}">
                                                <option value="${course.idCourse}">${course.name_course}(${date_start})</option>
                                            </c:forEach>
                                        </select>
                                    </c:if>
                                    <c:if test="${listTrainer == null}">
                                        No Courses
                                    </c:if>
                                </p>
                                <p>Room : 
                                    <c:if test="${listRoom != null}">
                                        <select name="course" id="select-box">
                                            <option></option>
                                            <c:forEach var="room" items="${listRoom}">
                                                <option value="${room.id_room}">${room.getRoom()}</option>
                                            </c:forEach>
                                        </select>
                                    </c:if>
                                    <c:if test="${listRoom == null}">
                                        No Rooms
                                    </c:if>
                                </p>
                                <p>Time : 
                                    <c:if test="${listTime != null}">
                                        <select name="course" id="select-box">
                                            <option></option>
                                            <c:forEach var="period" items="${listTime}">
                                                <option value="${period.id_time}">${period.time}</option>
                                            </c:forEach>
                                        </select>
                                    </c:if>
                                    <c:if test="${listTime == null}">
                                        No Times
                                    </c:if>
                                </p>
                            </div>
                            <button value="ButtonSchedule" name="action" class="button-schedule">Arrange</button>
                        </form>
>>>>>>> Stashed changes
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
    </body>
    <style>
        html{
            height: 100%;
        }
        .sidebar{
            height: 100%;
        }
        button {
            font-family: monospace;
            background-color: #f3f7fe;
            color: #3b82f6;
            border: none;
            border-radius: 8px;
            width: 100px;
            height: 45px;
            transition: .3s;
        }

        button:hover {
            background-color: #3b82f6;
            box-shadow: 0 0 0 5px #3b83f65f;
            color: #fff;
        }
        option{
            overflow-y: scroll;
        }
        #select-box{
            height: 30px;
            overflow-y: auto;
            width: 150px;
            border-radius: 10px;
        }
        .button-schedule {
            padding: 12.5px 30px;
            width: 120px;
            margin-bottom: 20px;
            margin-top: 50px;
            margin-left: 40%;
            border: 0;
            border-radius: 100px;
            background-color: #2ba8fb;
            color: #ffffff;
            font-weight: Bold;
            transition: all 0.5s;
            -webkit-transition: all 0.5s;
        }

        .button-schedule:hover {
            background-color: #6fc5ff;
            box-shadow: 0 0 20px #6fc5ff50;
            transform: scale(1.1);
        }

        .button-schedule:active {
            background-color: #3d94cf;
            transition: all 0.25s;
            -webkit-transition: all 0.25s;
            box-shadow: none;
            transform: scale(0.98);
        }
    </style>
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
</html>