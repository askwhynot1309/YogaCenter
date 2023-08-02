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
                        <div style="height: 40px; width: 100%; margin-top: 10px; margin-bottom: 10px">
                            <a href="/YogaCenter/setting" class="btn">
                                <svg height="16" width="16" xmlns="http://www.w3.org/2000/svg" version="1.1" viewBox="0 0 1024 1024"><path d="M874.690416 495.52477c0 11.2973-9.168824 20.466124-20.466124 20.466124l-604.773963 0 188.083679 188.083679c7.992021 7.992021 7.992021 20.947078 0 28.939099-4.001127 3.990894-9.240455 5.996574-14.46955 5.996574-5.239328 0-10.478655-1.995447-14.479783-5.996574l-223.00912-223.00912c-3.837398-3.837398-5.996574-9.046027-5.996574-14.46955 0-5.433756 2.159176-10.632151 5.996574-14.46955l223.019353-223.029586c7.992021-7.992021 20.957311-7.992021 28.949332 0 7.992021 8.002254 7.992021 20.957311 0 28.949332l-188.073446 188.073446 604.753497 0C865.521592 475.058646 874.690416 484.217237 874.690416 495.52477z"></path></svg>
                                <span>Back</span>
                            </a>
                        </div>
                        <h2 style="display: flex; justify-content: center; margin-bottom: 20px; font-family: monospace;font-weight: 700; margin-top: 20px; text-transform: uppercase">Information of Course</h2>
                    <c:set var="count" value="${requestScope.count}"/>
                    <c:set var="listSession" value="${requestScope.listSession}"/>
                    <h5><strong>Number of Trainees that join this course: </strong>${count}</h5><br><br>
                    <h3>Number of Classes with Course</h3>
                    <c:if test="${listSession.size() == 0}">
                        <p style="color: red; text-align: center">No classes are open. Please set up the class.</p>
                    </c:if>
                    <c:if test="${listSession.size() > 0 && !listSession.isEmpty()}">
                        <div>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th style="width: 395px">Name of course</th>
                                        <th>Trainer</th>
                                        <th>Time</th>
                                        <th>Time Slot</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="course" items="${listSession}" varStatus="loop">
                                        <tr>
                                            <td>${loop.count}</td>
                                            <td style="width: 395px">${course.course}</td>
                                            <td>${course.account}</td>
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
                                                <a href="/YogaCenter/request?action=inf&id=${course.id_course}&room=${course.status}&option=setup" class="btn btn-primary">Set up</a>
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
