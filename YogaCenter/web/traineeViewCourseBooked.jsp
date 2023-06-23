<%-- 
    Document   : traineeViewCourseBooked
    Created on : Jun 12, 2023, 2:43:03 PM
    Author     : ngmin
--%>

<%@page import="Dao.CourseDao"%>
<%@page import="Object.Account"%>
<%@page import="Object.Course"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="css/admin/admin.css">
        <link rel="stylesheet" href="css/admin/admin-schedule.css">
        <link rel="stylesheet" href="css/admin/admin-schedule-setup.css">
        <title>My learning</title>
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
    </style>
    <body>
        <c:import url="header.jsp"></c:import>
        <%
            Account account = (Account) session.getAttribute("account");
            ArrayList<Course> courseList = (ArrayList<Course>)request.getAttribute("courseList");
        %>
        <div class="container">
            <h2 style="text-align: center">My Learning</h2>
            <div class="container mt-10">
                <div class="d-flex justify-content-center row">
                    <div class="col-lg-12">
                        <div class="rounded">
                            <div class="table-responsive table-borderless">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Course Name</th>
                                            <th>Start Date</th>
                                            <th>Slot</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody class="table-body">
                                        <%
                                            for (Course course : courseList) {
                                        %>
                                        <tr class="cell-1">
                                            <th><a href="/YogaCenter/request?action=inf&option=viewmore&id=<%=course.getIdCourse()%>"><%= course.getName_course()%></a></th>
                                            <th><%= course.getDate_start()%></th>
                                            <th><%= course.getSlot()%></th>
                                            <th><a href="/YogaCenter/request?action=EditSchedule&courseID=<%=course.getIdCourse()%>">Edit Schedule</a></th>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <h2 style="text-transform: uppercase; text-align: center;">Yoga Center Schedule</h2>
            <div class="row">
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
                                                                        <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_detail}&option=classDetail">${acc.course}(${acc.class_name})</a></p> 
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
                                                                        <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_detail}&option=classDetail">${acc.course}(${acc.class_name})</a></p> 
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
                                                                        <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_detail}&option=classDetail">${acc.course}(${acc.class_name})</a></p> 
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
                                                                        <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_detail}&option=classDetail">${acc.course}(${acc.class_name})</a></P> 
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
                                                                        <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_detail}&option=classDetail">${acc.course}(${acc.class_name})</a></p> 
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
                                                                        <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_detail}&option=classDetail">${acc.course}(${acc.class_name})</a></p> 
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
                                                                        <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_detail}&option=classDetail">${acc.course}(${acc.class_name})</a></p> 
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
                                                                        <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_detail}&option=classDetail">${acc.course}(${acc.class_name})</a></p> 
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
                                                                        <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_detail}&option=classDetail">${acc.course}(${acc.class_name})</a></p> 
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
                                                                        <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_detail}&option=classDetail">${acc.course}(${acc.class_name})</a></p> 
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
                                                                        <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_detail}&option=classDetail">${acc.course}(${acc.class_name})</a></p> 
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
                                                                        <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_detail}&option=classDetail">${acc.course}(${acc.class_name})</a></p> 
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
                                                                        <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_detail}&option=classDetail">${acc.course}(${acc.class_name})</a></p> 
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
                                                                        <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_detail}&option=classDetail">${acc.course}(${acc.class_name})</a></p> 
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
                                                                        <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_detail}&option=classDetail">${acc.course}(${acc.class_name})</a></p> 
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
                                                                        <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_detail}&option=classDetail">${acc.course}(${acc.class_name})</a></p> 
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
                                                                        <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_detail}&option=classDetail">${acc.course}(${acc.class_name})</a></p> 
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
                                                                        <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_detail}&option=classDetail">${acc.course}(${acc.class_name})</a></p> 
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
                                                                        <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_detail}&option=classDetail">${acc.course}(${acc.class_name})</a></p> 
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
                                                                        <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_detail}&option=classDetail">${acc.course}(${acc.class_name})</a></p> 
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
                                                                        <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_detail}&option=classDetail">${acc.course}(${acc.class_name})</a></p> 
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
                                                                        <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_detail}&option=classDetail">${acc.course}(${acc.class_name})</a></p> 
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
                                                                        <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_detail}&option=classDetail">${acc.course}(${acc.class_name})</a></p> 
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
                                                                        <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_detail}&option=classDetail">${acc.course}(${acc.class_name})</a></p> 
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
                                                                        <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_detail}&option=classDetail">${acc.course}(${acc.class_name})</a></p> 
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
                                                                        <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_detail}&option=classDetail">${acc.course}(${acc.class_name})</a></p> 
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
                                                                        <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_detail}&option=classDetail">${acc.course}(${acc.class_name})</a></p> 
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
                                                                        <p><a href="/YogaCenter/request?action=ClassDetail&id=${acc.id_detail}&option=ClassDetailclassDetail">${acc.course}(${acc.class_name})</a></p> 
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
