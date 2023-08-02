<%-- 
    Document   : adminViewCourse
    Created on : Jul 31, 2023, 5:57:15 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Class Management</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="icon" type="image/x-icon" href="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png">
        <link rel="stylesheet" href="css/admin/admin.css">
        <link rel="stylesheet" href="css/admin/admin-course.css">
        <link rel="stylesheet" href="css/admin/admin-course-add.css">
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
                <div class="col-lg-3" style="padding: 0">
                    <c:import url="staffMenu.jsp"></c:import>
                    </div>
                    <div class="col-lg-9">
                        <h2 style="display: flex; justify-content: center; margin-bottom: 20px; font-family: monospace;font-weight: 700; margin-top: 20px; text-transform: uppercase">Information of Course</h2>
                    <c:set var="listClass" value="${requestScope.listClass}"/>
                    <h3>The Course Has Class</h3>
                    <c:if test="${listClass.size() == 0}">
                        <p style="color: red; text-align: center">There are no classes available for this course.</p>
                    </c:if>
                    <c:if test="${listClass.size() > 0 && !listClass.isEmpty()}">
                        <div>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>Name of course</th>
                                        <th>Class</th>
                                        <th>Time</th>
                                        <th>Time Slot</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="course" items="${listClass}" varStatus="loop">
                                        <tr>
                                            <td>${loop.count}</td>
                                            <td style="width: 395px">${course.course}</td>
                                            <td>YG${course.id_room}</td>
                                            <td>
                                                <c:if test="${course.time == 1}">
                                                    9h - 11h
                                                </c:if>
                                                <c:if test="${course.time == 2}">
                                                    13h - 15h
                                                </c:if>
                                                <c:if test="${course.time == 3}">
                                                    16h - 18h
                                                </c:if>
                                                <c:if test="${course.time == 4}">
                                                    19h - 21h
                                                </c:if>
                                            </td>
                                            <td>
                                                <c:if test="${course.idaccount == 1}">
                                                    Monday - Wednesday - Friday 
                                                </c:if>
                                                <c:if test="${course.idaccount == 2}">
                                                    Tuesday - Thursday - Saturday 
                                                </c:if>
                                                <c:if test="${course.idaccount == 3}">
                                                    Sunday
                                                </c:if>
                                            </td>
                                            <td>
                                                <a href="/YogaCenter/request?action=inf&id=${course.id_room}&course=${course.id_course}&option=staffviewDetailSession" class="btn btn-primary">View detail</a>
                                                <a href="/YogaCenter/request?action=inf&id=${course.id_room}&course=${course.id_course}&option=staffViewTraineeInClass" class="btn btn-primary">View Trainee</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:if>
                </div>
            </div>
    </body>
</html>
