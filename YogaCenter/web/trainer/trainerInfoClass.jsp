<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Object.AccountAttendence" %>
<!DOCTYPE html>
<html>

    <head>
        <title>Trainer Dashboard</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="css/staff/staff.css">
        <style>
            .table {
                table-layout: fixed;
                width: 100%;
            }
            .container-fluid {
                margin-bottom: 100px;
            }
        </style>
    </head>

    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3">
                    <c:import url="trainerDashboard.jsp"/>
                </div>
                <div class="col-lg-9">
                    <h2 style="display: flex; justify-content: center; margin-bottom: 50px; font-family: monospace;font-weight: 700; margin-top: 20px; text-transform: uppercase">Class Information</h2>
                    <c:set var="ListTrainee" value="${sessionScope.ListTrainee}"/>
                    <c:set var="inforClass" value="${sessionScope.InforClass}"/>
                    <c:set var="listAttend" value="${sessionScope.listAttend}"/>
                    <c:set var="currentDate" value="${sessionScope.currentDate}"/>
                    <c:set var="status" value="${sessionScope.status}"/>
                    <c:if test="${InforClass != null}">
                        <table class="table">
                            <tbody>
                                <tr>
                                    <td style="padding: 20px; font-weight: 700">Course Name : </td>
                                    <td style="padding: 20px">${inforClass.course}</td>
                                </tr>
                                <tr>
                                    <td style="padding: 20px; font-weight: 700">Room : </td>
                                    <td style="padding: 20px">${inforClass.class_name}</td>
                                </tr>
                                <tr>
                                    <td style="padding: 20px; font-weight: 700">Time : </td>
                                    <td style="padding: 20px">
                                        <c:if test="${inforClass.time == 1}">
                                            9h - 11h
                                        </c:if>
                                        <c:if test="${inforClass.time == 2}">
                                            13h - 15h
                                        </c:if>
                                        <c:if test="${inforClass.time == 3}">
                                            16h - 18h
                                        </c:if>
                                        <c:if test="${inforClass.time == 4}">
                                            19h - 21h
                                        </c:if>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 20px; font-weight: 700">Trainer : </td>
                                    <td style="padding: 20px">${inforClass.account}</td>
                                </tr>
                                <tr>
                                    <td style="padding: 20px; font-weight: 700">Date : </td>
                                    <td style="padding: 20px">${inforClass.date}</td>
                                </tr>
                            </tbody>
                        </table>
                    </c:if>
                    <c:if test="${sessionScope.trainerId == inforClass.idaccount}">
                        <h3 style="display: flex; margin-bottom: 20px; font-family: monospace;font-weight: 700; margin-top: 30px; text-transform: uppercase; background-color: #3b83f65f; color: #0071e2; padding: 10px">Trainees of the course</h3>
                        <c:if test="${ListTrainee == null}">
                            <p style="text-align: center; font-weight: 700">Do not have any trainees that learn this course !</p>
                        </c:if>
                        <c:if test="${ListTrainee != null}">
                            <form action="/YogaCenter/request">
                                <div class="tabel-container">
                                    <div class="table-responsive">
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th class="col">No.</th>
                                                    <th class="col">Name</th>
                                                    <th class="col">Details</th>
                                                    <th class="col">Check Attendance</th>
                                                    <th class="col">Attendance status</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="trainee" items="${ListTrainee}" varStatus="loop">
                                                    <tr>
                                                        <td>${loop.count}</td>
                                                        <td>${trainee.name}</td>
                                                        <td>
                                                            <a href="/YogaCenter/request?action=inf&id=${trainee.idaccount}&option=trainerUserDetail" class="btn btn-primary">Details</a>
                                                        </td>
                                                        <td>
                                                            <input type="radio" name="attendanceStatus${loop.index}" value="1" id="yes${loop.index}">
                                                            <label for="yes${loop.index}">Yes</label>
                                                            <input type="radio" name="attendanceStatus${loop.index}" value="0" id="no${loop.index}">
                                                            <label for="no${loop.index}">No</label>
                                                            <input type="hidden" name="traineeId" value="${trainee.idaccount}">
                                                            <input type="hidden" name="id_class" value="${inforClass.id_class}">
                                                            <input type="hidden" name="classDate" value="${inforClass.date}">
                                                            <input type="hidden" name="reuseId" value="${sessionScope.reuseId}">
                                                        </td>
                                                        <td>
                                                            <c:forEach var="attend" items="${listAttend}">
                                                                <c:if test="${attend.id_trainee == trainee.idaccount}">
                                                                    <c:choose>
                                                                        <c:when test="${attend.status == 0}">
                                                                            <p style="color: red">Absent</p>
                                                                        </c:when>
                                                                        <c:when test="${attend.status == 1}">
                                                                            <p style="color: green">Present</p>
                                                                        </c:when>
                                                                    </c:choose>
                                                                </c:if>
                                                            </c:forEach>
                                                        </td>
                                                    </tr>
                                                </c:forEach>

                                            </tbody>
                                        </table>
                                    </div>

                                    <div class="text-center mt-3">
                                        <button type="submit" name="action" value="SubmitAttendance" class="btn btn-primary">Submit</button>
                                    </div>
                                </div>
                            </form>
                        </c:if>
                    </c:if>
                </div>
            </div>
        </div>
    </body>
</html>