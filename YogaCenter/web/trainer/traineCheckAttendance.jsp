<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Object.AccountAttendence" %>
<!DOCTYPE html>
<html>

    <head>
        <title>Check Attendance</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="icon" type="image/x-icon" href="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png">
        <link rel="stylesheet" href="css/staff/staff.css">
        <style>
            .table {
                table-layout: fixed;
                width: 100%;
            }
            .container-fluid {
                margin-bottom: 100px;
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

            .message::backdrop {
                background: rgb(0 0 0 / 0.5);
                opacity: 0;
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
                    <c:import url="trainerDashboard.jsp"/>
                </div>
                <div class="col-lg-9" style="margin-left: 300px">
                    <h2 style="display: flex; justify-content: center; margin-bottom: 50px; font-family: monospace;font-weight: 700; margin-top: 20px; text-transform: uppercase">Check Attendance</h2>
                    <c:set var="listSession" value="${requestScope.listSession}"/>
                    <c:if test="${listSession.size() == 0}">
                        <p style="color: red; text-align: center">There are no classes to take attendance today.</p>
                    </c:if>
                        <c:if test="${listSession.size() > 0}">
                            <form action="/YogaCenter/request">
                                <div class="tabel-container">
                                    <div class="table-responsive">
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th class="col">No.</th>
                                                    <th class="col">Link Check Attendance</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="trainee" items="${listSession}" varStatus="loop">
                                                    <tr>
                                                        <td>${loop.count}</td>
                                                        <td><a href="/YogaCenter/request?action=inf&id=${trainee.id_course}&option=trainerCheckAttendence&date=${trainee.date}&acc=${trainee.time}">${trainee.course} - ${trainee.account}</a></td>
                                                    </tr>
                                                </c:forEach>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </form>
                        </c:if>
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