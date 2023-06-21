
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Admin Dashboard</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="css/admin/admin.css">
        <link rel="stylesheet" href="css/admin/admin-schedule.css">
        <link rel="stylesheet" href="css/admin/admin-schedule-setup.css">
    </head>

    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2" style="padding: 0; position: fixed">
                    <c:import url="adminMenu.jsp"/>
                </div>
                <div class="col-md-10" style="margin-left: 250px">
                    <h2 style="display: flex; justify-content: center; margin-bottom: 20px; font-family: monospace;font-weight: 700; margin-top: 20px; text-transform: uppercase">Yoga Center Schedule</h2>
                    <c:set var="listDays" value="${requestScope.listDay}" />
                    <c:set var="listClass" value="${requestScope.listClass}" />
                    <c:set var="currentweek" value="${requestScope.currentweek}" />
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
                                                                            <p><a href="/YogaCenter/request?action=inf&id=${acc.id_detail}&option=classDetail">${acc.account}(${acc.class_name})</a></p> 
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
                                                                            <p><a href="/YogaCenter/request?action=inf&id=${acc.id_detail}&option=classDetail">${acc.account}(${acc.class_name})</a></p> 
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
                                                                            <p><a href="/YogaCenter/request?action=inf&id=${acc.id_detail}&option=classDetail">${acc.account}(${acc.class_name})</a></p> 
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
                                                                            <p><a href="/YogaCenter/request?action=inf&id=${acc.id_detail}&option=classDetail">${acc.account}(${acc.class_name})</a></P> 
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
                                                                            <p><a href="/YogaCenter/request?action=inf&id=${acc.id_detail}&option=classDetail">${acc.account}(${acc.class_name})</a></p> 
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
                                                                            <p><a href="/YogaCenter/request?action=inf&id=${acc.id_detail}&option=classDetail">${acc.account}(${acc.class_name})</a></p> 
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
                                                                            <p><a href="/YogaCenter/request?action=inf&id=${acc.id_detail}&option=classDetail">${acc.account}(${acc.class_name})</a></p> 
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
                                                                            <p><a href="/YogaCenter/request?action=inf&id=${acc.id_detail}&option=classDetail">${acc.account}(${acc.class_name})</a></p> 
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
                                                                            <p><a href="/YogaCenter/request?action=inf&id=${acc.id_detail}&option=classDetail">${acc.account}(${acc.class_name})</a></p> 
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
                                                                            <p><a href="/YogaCenter/request?action=inf&id=${acc.id_detail}&option=classDetail">${acc.account}(${acc.class_name})</a></p> 
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
                                                                            <p><a href="/YogaCenter/request?action=inf&id=${acc.id_detail}&option=classDetail">${acc.account}(${acc.class_name})</a></p> 
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
                                                                            <p><a href="/YogaCenter/request?action=inf&id=${acc.id_detail}&option=classDetail">${acc.account}(${acc.class_name})</a></p> 
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
                                                                            <p><a href="/YogaCenter/request?action=inf&id=${acc.id_detail}&option=classDetail">${acc.account}(${acc.class_name})</a></p> 
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
                                                                            <p><a href="/YogaCenter/request?action=inf&id=${acc.id_detail}&option=classDetail">${acc.account}(${acc.class_name})</a></p> 
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
                                                                            <p><a href="/YogaCenter/request?action=inf&id=${acc.id_detail}&option=classDetail">${acc.account}(${acc.class_name})</a></p> 
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
                                                                            <p><a href="/YogaCenter/request?action=inf&id=${acc.id_detail}&option=classDetail">${acc.account}(${acc.class_name})</a></p> 
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
                                                                            <p><a href="/YogaCenter/request?action=inf&id=${acc.id_detail}&option=classDetail">${acc.account}(${acc.class_name})</a></p> 
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
                                                                            <p><a href="/YogaCenter/request?action=inf&id=${acc.id_detail}&option=classDetail">${acc.account}(${acc.class_name})</a></p> 
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
                                                                            <p><a href="/YogaCenter/request?action=inf&id=${acc.id_detail}&option=classDetail">${acc.account}(${acc.class_name})</a></p> 
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
                                                                            <p><a href="/YogaCenter/request?action=inf&id=${acc.id_detail}&option=classDetail">${acc.account}(${acc.class_name})</a></p> 
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
                                                                            <p><a href="/YogaCenter/request?action=inf&id=${acc.id_detail}&option=classDetail">${acc.account}(${acc.class_name})</a></p> 
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
                                                                            <p><a href="/YogaCenter/request?action=inf&id=${acc.id_detail}&option=classDetail">${acc.account}(${acc.class_name})</a></p> 
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
                                                                            <p><a href="/YogaCenter/request?action=inf&id=${acc.id_detail}&option=classDetail">${acc.account}(${acc.class_name})</a></p> 
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
                                                                            <p><a href="/YogaCenter/request?action=inf&id=${acc.id_detail}&option=classDetail">${acc.account}(${acc.class_name})</a></p> 
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
                                                                            <p><a href="/YogaCenter/request?action=inf&id=${acc.id_detail}&option=classDetail">${acc.account}(${acc.class_name})</a></p> 
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
                                                                            <p><a href="/YogaCenter/request?action=inf&id=${acc.id_detail}&option=classDetail">${acc.account}(${acc.class_name})</a></p> 
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
                                                                            <p><a href="/YogaCenter/request?action=inf&id=${acc.id_detail}&option=classDetail">${acc.account}(${acc.class_name})</a></p> 
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
                                                                            <p><a href="/YogaCenter/request?action=inf&id=${acc.id_detail}&option=infclassDetail">${acc.account}(${acc.class_name})</a></p> 
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

                    <h3 style="margin-top: 20px; color: #2ba8fb; background-color: #6fc5ff50; padding: 5px">Set up Schedule Table for Trainers</h3>
                    <div>
                        <c:set var="listTrainer" value="${requestScope.listTrainer}" />
                        <c:set var="listRoom" value="${requestScope.listRoom}" />
                        <c:set var="listTime" value="${requestScope.listTime}" />
                        <c:set var="listCourse" value="${requestScope.listCourse}" />
                        <c:set var="arrangeFail" value="${requestScope.arrangeFail}" />
                        <c:set var="arrangeSameTime" value="${requestScope.arrangeSameTime}" />
                        <c:set var="arrangesuccess" value="${requestScope.arrangesuccess}" />
                        <c:set var="arrangeSameTrainerInTime" value="${requestScope.arrangeSameTrainerInTime}" />
                        <form action="/YogaCenter/request" method="POST">
                            <div style="display: flex; justify-content: space-between; align-items: center; margin-top: 20px">
                                <p>Trainer :
                                    <c:if test="${listTrainer != null}">
                                        <select name="trainer" id="select-box">
                                            <option value="0"></option>
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
                                        <select name="course" id="select-box-course">
                                            <option value="0"></option>
                                            <c:forEach var="course" items="${listCourse}">
                                                <option value="${course.idCourse}">${course.name_course}(${course.date_start})</option>
                                            </c:forEach>
                                        </select>
                                    </c:if>
                                    <c:if test="${listTrainer == null}">
                                        No Courses
                                    </c:if>
                                </p>
                                <p>Room : 
                                    <c:if test="${listRoom != null}">
                                        <select name="room" id="select-box">
                                            <option value="0"></option>
                                            <c:forEach var="room" items="${listRoom}">
                                                <option value="${room.id_room}">${room.getRoom()}</option>
                                            </c:forEach>
                                        </select>
                                    </c:if>
                                    <c:if test="${listRoom == null}">
                                        No Rooms
                                    </c:if>
                                </p>
                                <p>Date:
                                    <select name="option" id = "select-box-option">
                                        <option value="1">Monday - Wednesday - Friday</option>
                                        <option value="2">Tuesday - Thursday - Saturday</option>
                                        <option value="3">Sunday</option>
                                    </select>
                                </p>
                                <p>Time : 
                                    <c:if test="${listTime != null}">
                                        <select name="time" id="select-box">
                                            <option value="0"></option>
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
                            <c:if test="${arrangeFail != null}">
                                <p style="text-align: center; color: red"><c:out value="${arrangeFail}"/></p>
                            </c:if>
                            <c:if test="${arrangeSameTime != null}">
                                <p style="text-align: center; color: red"><c:out value="${arrangeSameTime}"/></p>
                            </c:if>
                            <c:if test="${arrangeSameTrainerInTime != null}">
                                <p style="text-align: center; color: red"><c:out value="${arrangeSameTrainerInTime}"/></p>
                            </c:if>
                            <button value="ButtonSchedule" name="action" class="button-schedule">Set up</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
    </body>
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
    <c:if test="${arrangesuccess != null}">
        <div class="notification-success">
            <div class="content">
                <div class="title">Success</div>
                <span>Set up for trainer successfully !</span>
            </div>
            <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
        </div>
        <script>
            let notification = document.querySelector('.notification-success');
            notification.timeOut = setTimeout(() => notification.remove(), 5000);
        </script>
    </c:if>
</html>