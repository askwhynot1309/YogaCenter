<%-- 
    Document   : adminViewSessions
    Created on : Jul 31, 2023, 9:43:58 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Course Management</title>
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
            .mess {
                box-shadow: var(--shadow-2), 0 0 0 100vw rgb(0 0 0 / 0.5);
                background: #fff;
                color: #222;
                border: 0;
                border-radius: 0.25rem;
                position: fixed;
                top: 70%;
                left: 50%;
                border-radius: 20px;
                transform: translate(-50%, -50%);
                padding: 20px;
                z-index: 10000;
            }
            .notification-success{
                position: fixed;
                top: 20px;
                right: 0px;
                padding: 5px;
                padding-left: 10px;
                color: white;
                margin-bottom: 10px;
                width: 300px;
                height: 80px;
                border-radius: 5px;
                background-color: #008000;
                animation: show 0.3s ease 1 forwards
            }

            .notification-success .title{
                font-size: 18px;
                font-weight: bold;
            }
            .notification-success span, .notification-success i:nth-child(3){
                color: white;
                opacity: 0.9;
            }
            .notification-success .content {
                padding: 5px 0;
            }
            @keyframes show{
                0%{
                    transform: translateX(100%);
                }
                40%{
                    transform: translateX(-5%);
                }
                80%{
                    transform: translateX(0%);
                }
                100%{
                    transform: translateX(-10%);
                }
            }
            .notification-success::before{
                position: absolute;
                bottom: 0;
                left: 0;
                background-color: var(--color);
                width: 100%;
                height: 3px;
                content: '';
                box-shadow: 0 0 10px var(--color);
                animation: timeOut 5s linear 1 forwards
            }
            @keyframes timeOut{
                to{
                    width: 0;
                }
            }
            .notification-success{
                --color: #FFFFFF;
                background-image:
                    linear-gradient(
                    to right, #00FF00, #00CC00 30%
                    );
            }
            .hidden {
                display: none;
            }

            .mess::backdrop {
                background: rgb(0 0 0 / 0.5);
                opacity: 0;
            }
            .mess[opening] {
                animation: slide-up 1000ms forwards, show 500ms forwards;
            }
            .mess[closing] {
                animation: fade-out 500ms forwards;
            }

            @keyframes show {
                0% {
                    opacity: 0;
                }
                100% {
                    opacity: 1;
                }
            }

            @keyframes fade-out {
                0% {
                    opacity: 1;
                }
                100% {
                    opacity: 0;
                }
            }

            @keyframes slide-up {
                0% {
                    transform: translateY(100%);
                }
                100% {
                    transform: translateY(0%);
                }
            }

            /* extra styling */

            .mess {
                width: 400px;

                & > * {
                    margin: 0 0 0.5rem 0;
                }
            }
        </style>
    </head>
    <body>
        <c:set var="exist" value="${sessionScope.Trainer}"/>
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
                <div class="col-lg-3" style="padding: 0; position: fixed">
                    <c:import url="trainerDashboard.jsp"></c:import>
                    </div>
                    <div class="col-lg-9" style="margin-left: 300px">
                    <c:set var="id" value="${requestScope.id}"/>
                    <c:set var="room" value="${requestScope.room}"/>
                    <div style="height: 40px; width: 100%; margin-top: 10px; margin-bottom: 10px">
                        <a href="/YogaCenter/TrainerShowCourseList" class="btn">
                            <svg height="16" width="16" xmlns="http://www.w3.org/2000/svg" version="1.1" viewBox="0 0 1024 1024"><path d="M874.690416 495.52477c0 11.2973-9.168824 20.466124-20.466124 20.466124l-604.773963 0 188.083679 188.083679c7.992021 7.992021 7.992021 20.947078 0 28.939099-4.001127 3.990894-9.240455 5.996574-14.46955 5.996574-5.239328 0-10.478655-1.995447-14.479783-5.996574l-223.00912-223.00912c-3.837398-3.837398-5.996574-9.046027-5.996574-14.46955 0-5.433756 2.159176-10.632151 5.996574-14.46955l223.019353-223.029586c7.992021-7.992021 20.957311-7.992021 28.949332 0 7.992021 8.002254 7.992021 20.957311 0 28.949332l-188.073446 188.073446 604.753497 0C865.521592 475.058646 874.690416 484.217237 874.690416 495.52477z"></path></svg>
                            <span>Back</span>
                        </a>
                    </div>
                    <h2 style="display: flex; justify-content: center; margin-bottom: 20px; font-family: monospace;font-weight: 700; margin-top: 20px; text-transform: uppercase">Information of Class</h2>
                    <c:set var="listSession" value="${requestScope.listSessions}"/>
                    <c:set var="date2" value="${requestScope.date2}"/>
                    <c:set var="room" value="${requestScope.room}"/>
                    <c:set var="id" value="${requestScope.id}"/>
                    <c:set var="message" value="${requestScope.message}"/>
                    <c:set var="message1" value="${requestScope.message1}"/>
                    <c:set var="accid" value="${requestScope.accid}"/>
                    <h3>Number of Sessions with Class</h3>
                    <c:if test="${listSession.size() > 0 && !listSession.isEmpty()}">
                        <div style="height: 450px">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>Trainer</th>
                                        <th>Room</th>
                                        <th>Time</th>
                                        <th>Date-Study</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="course" items="${listSession}" varStatus="loop">
                                        <tr>
                                            <td>${loop.count}</td>
                                            <td style="width: 395px">${course.account}</td>
                                            <td>${course.class_name}</td>
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
                                            <td>${course.date}</td>
                                            <td>
                                                <a href="/YogaCenter/request?action=inf&id=${course.id_class}&room=${room}&id1=${course.id_course}&acc=${accid}&option=trainerViewtrainee" class="btn btn-primary">View detail</a>
                                                <c:if test="${course.date.before(date2)}">
                                                    <button class="btn btn-primary openButton" style="margin-bottom: 20px; float: right">Check Attendence Again</button>
                                                    <div id="overlay" class="overlay hidden"></div>
                                                    <dialog class="mess" id="message" style="width: 500px">
                                                        <form action="/YogaCenter/request" method="POST">
                                                            <h3 style="text-align: center; color: blue">Message</h3>
                                                            <div style="margin-left: 10px"><p>Reason : </p><textarea name="reason" value="" class="input-description"></textarea></div>
                                                            <input name="id" value="${course.id_class}" hidden="">
                                                            <input name="acc" value="${accid}" hidden="">
                                                            <input name="course" value="${course.id_course}" hidden="">
                                                            <input name="room" value="${room}" hidden="">
                                                            <input name="date" value="${course.date}" hidden="">
                                                            <div style="display: flex; align-items: center; justify-content: space-between; margin-top: 20px">
                                                                <button class="btn btn-primary" name="action" value="AttendenceAgain" style="width: 100px">Comfirm</button>
                                                                <a class="btn btn-primary btn-close" style="width: 75px; color: white; text-decoration: none">Close</a>
                                                            </div>
                                                        </form>
                                                    </dialog>  
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
            <script>
                const modal = document.querySelector("#message");
                const closeModal = document.querySelector(".btn-close");
                const openModal = document.querySelector(".openButton");
                var overlay = document.getElementById("overlay");

                openModal.addEventListener("click", () => {
                    modal.showModal();
                    overlay.classList.remove("hidden");
                });

                closeModal.addEventListener("click", () => {
                    modal.setAttribute("closing", "");

                    modal.addEventListener(
                            "animationend",
                            () => {
                        modal.removeAttribute("closing");
                        modal.close();
                    },
                            {once: true}
                    );
                    overlay.classList.add("hidden");
                });

            </script>
            <c:if test="${message != null}">
                <div class="notification-success">
                    <div class="content">
                        <div class="title">Success</div>
                        <span>${message}</span>
                    </div>
                </div>
                <script>
                    let notification = document.querySelector('.notification-success');
                    notification.timeOut = setTimeout(() => notification.remove(), 5000);
                </script>
            </c:if>
            <c:if test="${message1 != null}">
                <div class="notification-success" style="height: 120px">
                    <div class="content">
                        <div class="title">Success</div>
                        <span>${message1}</span>
                    </div>
                </div>
                <script>
                    let notification = document.querySelector('.notification-success');
                    notification.timeOut = setTimeout(() => notification.remove(), 5000);
                </script>
            </c:if>
            <script src="https://cdn.ckeditor.com/4.21.0/standard/ckeditor.js"></script>
            <script>
                    CKEDITOR.replace('reason');
            </script>
    </body>
</html>
