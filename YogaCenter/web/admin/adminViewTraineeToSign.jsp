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
        <c:set var="exist" value="${sessionScope.Admin}"/>
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
                    <c:import url="adminMenu.jsp"></c:import>
                    </div>
                    <div class="col-lg-9">
                    <c:set var="id" value="${requestScope.id}"/>
                        <div style="height: 40px; width: 100%; margin-top: 10px; margin-bottom: 10px">
                            <a href="/YogaCenter/request?action=inf&id=${id}&option=viewCourseTosign" class="btn">
                                <svg height="16" width="16" xmlns="http://www.w3.org/2000/svg" version="1.1" viewBox="0 0 1024 1024"><path d="M874.690416 495.52477c0 11.2973-9.168824 20.466124-20.466124 20.466124l-604.773963 0 188.083679 188.083679c7.992021 7.992021 7.992021 20.947078 0 28.939099-4.001127 3.990894-9.240455 5.996574-14.46955 5.996574-5.239328 0-10.478655-1.995447-14.479783-5.996574l-223.00912-223.00912c-3.837398-3.837398-5.996574-9.046027-5.996574-14.46955 0-5.433756 2.159176-10.632151 5.996574-14.46955l223.019353-223.029586c7.992021-7.992021 20.957311-7.992021 28.949332 0 7.992021 8.002254 7.992021 20.957311 0 28.949332l-188.073446 188.073446 604.753497 0C865.521592 475.058646 874.690416 484.217237 874.690416 495.52477z"></path></svg>
                                <span>Back</span>
                            </a>
                        </div>
                        <h2 style="display: flex; justify-content: center; margin-bottom: 20px; font-family: monospace;font-weight: 700; margin-top: 20px; text-transform: uppercase">Information of Course</h2>
                    <c:set var="room" value="${requestScope.room}"/>
                    <c:set var="id" value="${requestScope.id}"/>
                    <c:set var="message" value="${requestScope.message}"/>
                    <c:set var="getAllTraineeBookingCourse" value="${requestScope.getAllTraineeBookingCourse}"/>
                    <c:set var="getTrainee1" value="${requestScope.getTrainee1}"/>
                    <h3>Number of Trainees with Bought Course</h3>
                    <c:if test="${getAllTraineeBookingCourse.size() > 0 && !getAllTraineeBookingCourse.isEmpty()}">
                        <div style="height: 450px">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th style="width: 400px">Trainee</th>
                                        <th>Email</th>
                                        <th>Phone</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="course" items="${getAllTraineeBookingCourse}" varStatus="loop">
                                        <tr>
                                            <td>${loop.count}</td>
                                            <td style="width: 400px">${course.name_course}</td>
                                            <td>${course.level}</td>
                                            <td>${course.img}</td>
                                            <td>
                                                <c:if test="${getTrainee1.size() >= 0}">
                                                    <c:set var="isTraineeAdded" value="false" />
                                                    <c:forEach var="trainee" items="${getTrainee1}">
                                                        <c:if test="${trainee.idaccount == course.id_course}">
                                                            <p style="color: red">The trainee has added in course class!</p>
                                                            <c:set var="isTraineeAdded" value="true" />
                                                        </c:if>
                                                    </c:forEach>
                                                    <c:if test="${isTraineeAdded == false}">
                                                        <form action="/YogaCenter/request" method="POST">
                                                            <input name="idcourse" value="${id}" hidden=""/>
                                                            <input name="room" value="${room}" hidden=""/>
                                                            <input name="id" value="${course.id_course}" hidden=""/>
                                                            <button name="action" class="btn btn-primary" value="JoinClass">Join Class</button>
                                                        </form>
                                                    </c:if>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <c:if test="${message != null}">
                <div class="notification-success" style="z-index: 1000">
                    <div class="content">
                        <div class="title">Success</div>
                        <span>Join class successfully!.</span>
                    </div>
                </div>
                <script>
                    let notification = document.querySelector('.notification-success');
                    notification.timeOut = setTimeout(() => notification.remove(), 2000);
                </script>
            </c:if>
            <c:if test="${error != null}">
                <div class="notification" style="z-index: 1000">
                    <div class="content">
                        <div class="title">Error</div>
                        <span>Class is full. Please choose the other class to set up Trainee!.</span>
                    </div>
                </div>
                <script>
                    let notification = document.querySelector('notification');
                    notification.timeOut = setTimeout(() => notification.remove(), 2000);
                </script>
            </c:if>
    </body>
</html>
