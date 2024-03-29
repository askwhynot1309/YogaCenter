<%-- 
    Document   : StaffViewSchedule
    Created on : Jun 7, 2023, 4:04:04 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="icon" type="image/x-icon" href="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png">
        <link rel="stylesheet" href="css/staff/staff.css">
        <link rel="stylesheet" href="css/staff/staff-schedule.css">
        <title>Schedule</title>
        <style>
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
        </style>
    </head>
    <body>
        <c:set var="exist" value="${sessionScope.Staff}"/>
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
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2" style="padding: 0; position: fixed">
                    <c:import url="staffMenu.jsp"/>
                </div>
                <div class="col-md-10" style="margin-left: 250px">
                    <h2 style="display: flex; justify-content: center; margin-bottom: 20px; font-family: monospace;font-weight: 700; margin-top: 20px; text-transform: uppercase">Yoga Center Schedule</h2>
                    <c:set var="listDays" value="${requestScope.listDay}" />
                    <c:set var="listClass" value="${requestScope.listClass}" />
                    <c:set var="currentweek" value="${requestScope.currentweek}" />
                    <c:set var="currentDate" value="${requestScope.currentDate}" />
                    <c:if test="${listDays != null}">
                        <c:if test="${currentweek != null}">
                            <c:if test="${listClass != null}">
                                <c:if test="${currentDate != null}">
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
                                                                        <c:set var="check" value="${false}"/>
                                                                        <c:choose>
                                                                            <c:when test="${acc.datestudy == day.getDate() && acc.time == 1 && day.getDay() == 'Sunday'}">
                                                                                <c:forEach var="current" items="${currentDate}">
                                                                                    <c:if test="${current.datestudy == acc.datestudy && current.status == 1 && acc.class_name == current.class_name}">
                                                                                        <p style="color: red">Warning (${acc.class_name})</p>
                                                                                        <a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffChangeClass&date=${acc.datestudy}&acc=${acc.idaccount}">Need to change room</a>
                                                                                        <c:set var="check" value="true"/>
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                                <c:if test="${check == false}">

                                                                                    <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 

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
                                                                        <c:set var="check" value="${false}"/>
                                                                        <c:choose>
                                                                            <c:when test="${acc.datestudy == day.getDate() && acc.time == 1 && day.getDay() == 'Monday'}">
                                                                                <c:forEach var="current" items="${currentDate}">
                                                                                    <c:if test="${current.datestudy == acc.datestudy && current.status == 1 && acc.class_name == current.class_name}">
                                                                                        <p style="color: red">Warning (${acc.class_name})</p>
                                                                                        <a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffChangeClass&date=${acc.datestudy}&acc=${acc.idaccount}">Need to change room</a>
                                                                                        <c:set var="check" value="true"/>
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                                <c:if test="${check == false}">

                                                                                    <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 

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
                                                                        <c:set var="check" value="${false}"/>
                                                                        <c:choose>
                                                                            <c:when test="${acc.datestudy == day.getDate() && acc.time == 1 && day.getDay() == 'Tuesday'}">
                                                                                <c:forEach var="current" items="${currentDate}">
                                                                                    <c:if test="${current.datestudy == acc.datestudy && current.status == 1 && acc.class_name == current.class_name}">
                                                                                        <p style="color: red">Warning (${acc.class_name})</p>
                                                                                        <a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffChangeClass&date=${acc.datestudy}&acc=${acc.idaccount}">Need to change room</a>
                                                                                        <c:set var="check" value="true"/>
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                                <c:if test="${check == false}">

                                                                                    <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 

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
                                                                        <c:set var="check" value="${false}"/>
                                                                        <c:choose>
                                                                            <c:when test="${acc.datestudy == day.getDate() && acc.time == 1 && day.getDay() == 'Wednesday'}">
                                                                                <c:forEach var="current" items="${currentDate}">
                                                                                    <c:if test="${current.datestudy == acc.datestudy && current.status == 1 && acc.class_name == current.class_name}">
                                                                                        <p style="color: red">Warning (${acc.class_name})</p>
                                                                                        <a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffChangeClass&date=${acc.datestudy}&acc=${acc.idaccount}">Need to change room</a>
                                                                                        <c:set var="check" value="true"/>
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                                <c:if test="${check == false}">

                                                                                    <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 

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
                                                                        <c:set var="check" value="${false}"/>
                                                                        <c:choose>
                                                                            <c:when test="${acc.datestudy == day.getDate() && acc.time == 1 && day.getDay() == 'Thursday'}">
                                                                                <c:forEach var="current" items="${currentDate}">
                                                                                    <c:if test="${current.datestudy == acc.datestudy && current.status == 1 && acc.class_name == current.class_name}">
                                                                                        <p style="color: red">Warning (${acc.class_name})</p>
                                                                                        <a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffChangeClass&date=${acc.datestudy}&acc=${acc.idaccount}">Need to change room</a>
                                                                                        <c:set var="check" value="true"/>
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                                <c:if test="${check == false}">

                                                                                    <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 

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
                                                                        <c:set var="check" value="${false}"/>
                                                                        <c:choose>
                                                                            <c:when test="${acc.datestudy == day.getDate() && acc.time == 1 && day.getDay() == 'Friday'}">
                                                                                <c:forEach var="current" items="${currentDate}">
                                                                                    <c:if test="${current.datestudy == acc.datestudy && current.status == 1 && acc.class_name == current.class_name}">
                                                                                        <p style="color: red">Warning (${acc.class_name})</p>
                                                                                        <a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffChangeClass&date=${acc.datestudy}&acc=${acc.idaccount}">Need to change room</a>
                                                                                        <c:set var="check" value="true"/>
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                                <c:if test="${check == false}">

                                                                                    <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 

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
                                                                        <c:set var="check" value="${false}"/>
                                                                        <c:choose>
                                                                            <c:when test="${acc.datestudy == day.getDate() && acc.time == 1 && day.getDay() == 'Saturday'}">
                                                                                <c:forEach var="current" items="${currentDate}">
                                                                                    <c:if test="${current.datestudy == acc.datestudy && current.status == 1 && acc.class_name == current.class_name}">
                                                                                        <p style="color: red">Warning (${acc.class_name})</p>
                                                                                        <a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffChangeClass&date=${acc.datestudy}&acc=${acc.idaccount}">Need to change room</a>
                                                                                        <c:set var="check" value="true"/>
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                                <c:if test="${check == false}">

                                                                                    <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 

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
                                                                        <c:set var="check" value="${false}"/>
                                                                        <c:choose>
                                                                            <c:when test="${acc.datestudy == day.getDate() && acc.time == 2 && day.getDay() == 'Sunday'}">
                                                                                <c:forEach var="current" items="${currentDate}">
                                                                                    <c:if test="${current.datestudy == acc.datestudy && current.status == 1 && acc.class_name == current.class_name}">
                                                                                        <p style="color: red">Warning (${acc.class_name})</p>
                                                                                        <a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffChangeClass&date=${acc.datestudy}&acc=${acc.idaccount}">Need to change room</a>
                                                                                        <c:set var="check" value="true"/>
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                                <c:if test="${check == false}">

                                                                                    <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 

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
                                                                        <c:set var="check" value="${false}"/>
                                                                        <c:choose>
                                                                            <c:when test="${acc.datestudy == day.getDate() && acc.time == 2 && day.getDay() == 'Monday'}">
                                                                                <c:forEach var="current" items="${currentDate}">
                                                                                    <c:if test="${current.datestudy == acc.datestudy && current.status == 1 && acc.class_name == current.class_name}">
                                                                                        <p style="color: red">Warning (${acc.class_name})</p>
                                                                                        <a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffChangeClass&date=${acc.datestudy}&acc=${acc.idaccount}">Need to change room</a>
                                                                                        <c:set var="check" value="true"/>
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                                <c:if test="${check == false}">

                                                                                    <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 

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
                                                                        <c:set var="check" value="${false}"/>
                                                                        <c:choose>
                                                                            <c:when test="${acc.datestudy == day.getDate() && acc.time == 2 && day.getDay() == 'Tuesday'}">
                                                                                <c:forEach var="current" items="${currentDate}">
                                                                                    <c:if test="${current.datestudy == acc.datestudy && current.status == 1 && acc.class_name == current.class_name}">
                                                                                        <p style="color: red">Warning (${acc.class_name})</p>
                                                                                        <a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffChangeClass&date=${acc.datestudy}&acc=${acc.idaccount}">Need to change room</a>
                                                                                        <c:set var="check" value="true"/>
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                                <c:if test="${check == false}">

                                                                                    <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 

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
                                                                        <c:set var="check" value="${false}"/>
                                                                        <c:choose>
                                                                            <c:when test="${acc.datestudy == day.getDate() && acc.time == 2 && day.getDay() == 'Wednesday'}">
                                                                                <c:forEach var="current" items="${currentDate}">
                                                                                    <c:if test="${current.datestudy == acc.datestudy && current.status == 1 && acc.class_name == current.class_name}">
                                                                                        <p style="color: red">Warning (${acc.class_name})</p>
                                                                                        <a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffChangeClass&date=${acc.datestudy}&acc=${acc.idaccount}">Need to change room</a>
                                                                                        <c:set var="check" value="true"/>
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                                <c:if test="${check == false}">

                                                                                    <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 

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
                                                                        <c:set var="check" value="${false}"/>
                                                                        <c:choose>
                                                                            <c:when test="${acc.datestudy == day.getDate() && acc.time == 2 && day.getDay() == 'Thursday'}">
                                                                                <c:forEach var="current" items="${currentDate}">
                                                                                    <c:if test="${current.datestudy == acc.datestudy && current.status == 1 && acc.class_name == current.class_name}">
                                                                                        <p style="color: red">Warning (${acc.class_name})</p>
                                                                                        <a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffChangeClass&date=${acc.datestudy}&acc=${acc.idaccount}">Need to change room</a>
                                                                                        <c:set var="check" value="true"/>
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                                <c:if test="${check == false}">

                                                                                    <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 

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
                                                                        <c:set var="check" value="${false}"/>
                                                                        <c:choose>
                                                                            <c:when test="${acc.datestudy == day.getDate() && acc.time == 2 && day.getDay() == 'Friday'}">
                                                                                <c:forEach var="current" items="${currentDate}">
                                                                                    <c:if test="${current.datestudy == acc.datestudy && current.status == 1 && acc.class_name == current.class_name}">
                                                                                        <p style="color: red">Warning (${acc.class_name})</p>
                                                                                        <a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffChangeClass&date=${acc.datestudy}&acc=${acc.idaccount}">Need to change room</a>
                                                                                        <c:set var="check" value="true"/>
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                                <c:if test="${check == false}">

                                                                                    <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 

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
                                                                        <c:set var="check" value="${false}"/>
                                                                        <c:choose>
                                                                            <c:when test="${acc.datestudy == day.getDate() && acc.time == 2 && day.getDay() == 'Saturday'}">
                                                                                <c:forEach var="current" items="${currentDate}">
                                                                                    <c:if test="${current.datestudy == acc.datestudy && current.status == 1 && acc.class_name == current.class_name}">
                                                                                        <p style="color: red">Warning (${acc.class_name})</p>
                                                                                        <a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffChangeClass&date=${acc.datestudy}&acc=${acc.idaccount}">Need to change room</a>
                                                                                        <c:set var="check" value="true"/>
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                                <c:if test="${check == false}">

                                                                                    <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 

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
                                                                        <c:set var="check" value="${false}"/>
                                                                        <c:choose>
                                                                            <c:when test="${acc.datestudy == day.getDate() && acc.time == 3 && day.getDay() == 'Sunday'}">
                                                                                <c:forEach var="current" items="${currentDate}">
                                                                                    <c:if test="${current.datestudy == acc.datestudy && current.status == 1 && acc.class_name == current.class_name}">
                                                                                        <p style="color: red">Warning (${acc.class_name})</p>
                                                                                        <a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffChangeClass&date=${acc.datestudy}&acc=${acc.idaccount}">Need to change room</a>
                                                                                        <c:set var="check" value="true"/>
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                                <c:if test="${check == false}">

                                                                                    <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 

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
                                                                        <c:set var="check" value="${false}"/>
                                                                        <c:choose>
                                                                            <c:when test="${acc.datestudy == day.getDate() && acc.time == 3 && day.getDay() == 'Monday'}">
                                                                                <c:forEach var="current" items="${currentDate}">
                                                                                    <c:if test="${current.datestudy == acc.datestudy && current.status == 1 && acc.class_name == current.class_name}">
                                                                                        <p style="color: red">Warning (${acc.class_name})</p>
                                                                                        <a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffChangeClass&date=${acc.datestudy}&acc=${acc.idaccount}">Need to change room</a>
                                                                                        <c:set var="check" value="true"/>
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                                <c:if test="${check == false}">

                                                                                    <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 

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
                                                                        <c:set var="check" value="${false}"/>
                                                                        <c:choose>
                                                                            <c:when test="${acc.datestudy == day.getDate() && acc.time == 3 && day.getDay() == 'Tuesday'}">
                                                                                <c:forEach var="current" items="${currentDate}">
                                                                                    <c:if test="${current.datestudy == acc.datestudy && current.status == 1 && acc.class_name == current.class_name}">
                                                                                        <p style="color: red">Warning (${acc.class_name})</p>
                                                                                        <a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffChangeClass&date=${acc.datestudy}&acc=${acc.idaccount}">Need to change room</a>
                                                                                        <c:set var="check" value="true"/>
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                                <c:if test="${check == false}">

                                                                                    <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 

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
                                                                        <c:set var="check" value="${false}"/>
                                                                        <c:choose>
                                                                            <c:when test="${acc.datestudy == day.getDate() && acc.time == 3 && day.getDay() == 'Wednesday'}">
                                                                                <c:forEach var="current" items="${currentDate}">
                                                                                    <c:if test="${current.datestudy == acc.datestudy && current.status == 1 && acc.class_name == current.class_name}">
                                                                                        <p style="color: red">Warning (${acc.class_name})</p>
                                                                                        <a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffChangeClass&date=${acc.datestudy}&acc=${acc.idaccount}">Need to change room</a>
                                                                                        <c:set var="check" value="true"/>
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                                <c:if test="${check == false}">

                                                                                    <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 

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
                                                                        <c:set var="check" value="${false}"/>
                                                                        <c:choose>
                                                                            <c:when test="${acc.datestudy == day.getDate() && acc.time == 3 && day.getDay() == 'Thursday'}">
                                                                                <c:forEach var="current" items="${currentDate}">
                                                                                    <c:if test="${current.datestudy == acc.datestudy && current.status == 1 && acc.class_name == current.class_name}">
                                                                                        <p style="color: red">Warning (${acc.class_name})</p>
                                                                                        <a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffChangeClass&date=${acc.datestudy}&acc=${acc.idaccount}">Need to change room</a>
                                                                                        <c:set var="check" value="true"/>
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                                <c:if test="${check == false}">

                                                                                    <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 

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
                                                                        <c:set var="check" value="${false}"/>
                                                                        <c:choose>
                                                                            <c:when test="${acc.datestudy == day.getDate() && acc.time == 3 && day.getDay() == 'Friday'}">
                                                                                <c:forEach var="current" items="${currentDate}">
                                                                                    <c:if test="${current.datestudy == acc.datestudy && current.status == 1 && acc.class_name == current.class_name}">
                                                                                        <p style="color: red">Warning (${acc.class_name})</p>
                                                                                        <a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffChangeClass&date=${acc.datestudy}&acc=${acc.idaccount}">Need to change room</a>
                                                                                        <c:set var="check" value="true"/>
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                                <c:if test="${check == false}">

                                                                                    <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 

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
                                                                        <c:set var="check" value="${false}"/>
                                                                        <c:choose>
                                                                            <c:when test="${acc.datestudy == day.getDate() && acc.time == 3 && day.getDay() == 'Saturday'}">
                                                                                <c:forEach var="current" items="${currentDate}">
                                                                                    <c:if test="${current.datestudy == acc.datestudy && current.status == 1 && acc.class_name == current.class_name}">
                                                                                        <p style="color: red">Warning (${acc.class_name})</p>
                                                                                        <a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffChangeClass&date=${acc.datestudy}&acc=${acc.idaccount}">Need to change room</a>
                                                                                        <c:set var="check" value="true"/>
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                                <c:if test="${check == false}">

                                                                                    <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 

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
                                                                        <c:set var="check" value="${false}"/>
                                                                        <c:choose>
                                                                            <c:when test="${acc.datestudy == day.getDate() && acc.time == 4 && day.getDay() == 'Sunday'}">
                                                                                <c:forEach var="current" items="${currentDate}">
                                                                                    <c:if test="${current.datestudy == acc.datestudy && current.status == 1 && acc.class_name == current.class_name}">
                                                                                        <p style="color: red">Warning (${acc.class_name})</p>
                                                                                        <a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffChangeClass&date=${acc.datestudy}&acc=${acc.idaccount}">Need to change room</a>
                                                                                        <c:set var="check" value="true"/>
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                                <c:if test="${check == false}">

                                                                                    <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 

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
                                                                        <c:set var="check" value="${false}"/>
                                                                        <c:choose>
                                                                            <c:when test="${acc.datestudy == day.getDate() && acc.time == 4 && day.getDay() == 'Monday'}">
                                                                                <c:forEach var="current" items="${currentDate}">
                                                                                    <c:if test="${current.datestudy == acc.datestudy && current.status == 1 && acc.class_name == current.class_name}">
                                                                                        <p style="color: red">Warning (${acc.class_name})</p>
                                                                                        <a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffChangeClass&date=${acc.datestudy}&acc=${acc.idaccount}">Need to change room</a>
                                                                                        <c:set var="check" value="true"/>
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                                <c:if test="${check == false}">

                                                                                    <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 

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
                                                                        <c:set var="check" value="${false}"/>
                                                                        <c:choose>
                                                                            <c:when test="${acc.datestudy == day.getDate() && acc.time == 4 && day.getDay() == 'Tuesday'}">
                                                                                <c:forEach var="current" items="${currentDate}">
                                                                                    <c:if test="${current.datestudy == acc.datestudy && current.status == 1 && acc.class_name == current.class_name}">
                                                                                        <p style="color: red">Warning (${acc.class_name})</p>
                                                                                        <a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffChangeClass&date=${acc.datestudy}&acc=${acc.idaccount}">Need to change room</a>
                                                                                        <c:set var="check" value="true"/>
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                                <c:if test="${check == false}">

                                                                                    <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 

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
                                                                        <c:set var="check" value="${false}"/>
                                                                        <c:choose>
                                                                            <c:when test="${acc.datestudy == day.getDate() && acc.time == 4 && day.getDay() == 'Wednesday'}">
                                                                                <c:forEach var="current" items="${currentDate}">
                                                                                    <c:if test="${current.datestudy == acc.datestudy && current.status == 1 && acc.class_name == current.class_name}">
                                                                                        <p style="color: red">Warning (${acc.class_name})</p>
                                                                                        <a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffChangeClass&date=${acc.datestudy}&acc=${acc.idaccount}">Need to change room</a>
                                                                                        <c:set var="check" value="true"/>
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                                <c:if test="${check == false}">

                                                                                    <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 

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
                                                                        <c:set var="check" value="${false}"/>
                                                                        <c:choose>
                                                                            <c:when test="${acc.datestudy == day.getDate() && acc.time == 4 && day.getDay() == 'Thursday'}">
                                                                                <c:forEach var="current" items="${currentDate}">
                                                                                    <c:if test="${current.datestudy == acc.datestudy && current.status == 1 && acc.class_name == current.class_name}">
                                                                                        <p style="color: red">Warning (${acc.class_name})</p>
                                                                                        <a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffChangeClass&date=${acc.datestudy}&acc=${acc.idaccount}">Need to change room</a>
                                                                                        <c:set var="check" value="true"/>
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                                <c:if test="${check == false}">

                                                                                    <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 

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
                                                                        <c:set var="check" value="${false}"/>
                                                                        <c:choose>
                                                                            <c:when test="${acc.datestudy == day.getDate() && acc.time == 4 && day.getDay() == 'Friday'}">
                                                                                <c:forEach var="current" items="${currentDate}">
                                                                                    <c:if test="${current.datestudy == acc.datestudy && current.status == 1 && acc.class_name == current.class_name}">
                                                                                        <p style="color: red">Warning (${acc.class_name})</p>
                                                                                        <a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffChangeClass&date=${acc.datestudy}&acc=${acc.idaccount}">Need to change room</a>
                                                                                        <c:set var="check" value="true"/>
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                                <c:if test="${check == false}">

                                                                                    <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 

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
                                                                        <c:set var="check" value="${false}"/>
                                                                        <c:choose>
                                                                            <c:when test="${acc.datestudy == day.getDate() && acc.time == 4 && day.getDay() == 'Saturday'}">
                                                                                <c:forEach var="current" items="${currentDate}">
                                                                                    <c:if test="${current.datestudy == acc.datestudy && current.status == 1 && acc.class_name == current.class_name}">
                                                                                        <p style="color: red">Warning (${acc.class_name})</p>
                                                                                        <a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffChangeClass&date=${acc.datestudy}&acc=${acc.idaccount}">Need to change room</a>
                                                                                        <c:set var="check" value="true"/>
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                                <c:if test="${check == false}">

                                                                                    <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 

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
                                <c:if test="${currentDate == null}">
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
                                                                                <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 
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
                                                                                <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 
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
                                                                                <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 
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
                                                                                <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></P> 
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
                                                                                <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 
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
                                                                                <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 
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
                                                                                <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 
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
                                                                                <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 
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
                                                                                <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 
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
                                                                                <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 
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
                                                                                <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 
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
                                                                                <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 
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
                                                                                <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 
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
                                                                                <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 
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
                                                                                <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 
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
                                                                                <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 
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
                                                                                <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 
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
                                                                                <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 
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
                                                                                <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 
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
                                                                                <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 
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
                                                                                <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 
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
                                                                                <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 
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
                                                                                <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 
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
                                                                                <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 
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
                                                                                <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 
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
                                                                                <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 
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
                                                                                <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 
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
                                                                                <p><a href="/YogaCenter/request?action=inf&id=${acc.id_class}&option=staffClassDetail&date=${acc.datestudy}&acc=${acc.idaccount}">${acc.account}(${acc.class_name})</a></p> 
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
    </body>
</html>
