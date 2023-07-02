<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/x-icon" href="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png">
        <link rel="stylesheet" href="css/admin/admin-table.css">
        <link rel="stylesheet" href="css/admin/admin-course.css">
        <link rel="stylesheet" href="css/admin/admin-course-add.css">
        <title>Class Management</title>
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
                <div class="col-lg-2" style="padding: 0">
                    <c:import url="staffMenu.jsp"></c:import>
                    </div>
                    <div class="col-lg-10">
                        <h2 style="display: flex; justify-content: center; font-family: monospace;font-weight: 700; margin-top: 20px; text-transform: uppercase; margin-bottom: 20px">
                            Manage Class
                        </h2>
                        <div id="overlay" class="overlay hidden"></div>
                    <c:set var="listRoom" value="${requestScope.listRoom}"/>
                    <c:set var="noneRoom" value="${requestScope.noneRoom}"/>
                    <c:set var="sentsuccess" value="${requestScope.sentsuccess}"/>
                    <c:if test="${listRoom == null}">
                        <p style="text-align: center"><c:out value="${noneRoom}"/></p>
                    </c:if>
                    <c:if test="${listRoom != null && !listRoom.isEmpty()}">
                        <div class="tbl-header">
                            <table cellpadding="0" cellspacing="0" border="0">
                                <thead>
                                    <tr>
                                        <th style="width: 50px">No.</th>
                                        <th>Room</th>
                                        <th style="width: 300px">Status</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="tbl-content" style="height: 600px">
                            <table cellpadding="0" cellspacing="0" border="0">
                                <tbody>
                                    <c:forEach var="room" items="${listRoom}" varStatus="loop">
                                        <tr>
                                            <td style="width: 50px">${loop.count}</td>
                                            <td>${room.room}</td>
                                            <td style="width: 300px">
                                                <c:if test="${room.status == 0}">
                                                    <form action="/YogaCenter/request" method="POST">
                                                        <span>Active</span>&ensp; <input type="radio" name="status" value="0" checked="" class ="noevent" data-index="${loop.index}">
                                                        <span>Unactive</span>&ensp; <input type="radio" name="status" value="1" class="feedbackButton" data-index="${loop.index}">
                                                        <div class="hidden feedbackForm" data-index="${loop.index}">
                                                            <div class ="close" style="display: flex; float: right; cursor: pointer; width: 30px;height: 30px">&#10006;</div>
                                                            <div style="display: block; width: 500px">
                                                                <h3 style="text-align: center;margin-top: 30px; text-transform: uppercase; font-weight: 700; color: #00aced">Feedback</h3>
                                                                <p><span style="font-weight: 700; font-size: 16px">Room: </span>${room.room}</p> 
                                                                <p style="font-weight: 700; font-size: 16px">Content of Feedback : </p><textarea class="feedback" name="txt_feedback" required=""></textarea><br>
                                                                <input name="id" value="${room.id_room}" hidden="">
                                                                <br>
                                                                <button name="action" value="feedback" class="btn-search" style="margin-left: 40%">Feedback</button>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </c:if>
                                                <c:if test="${room.status == 1}">
                                                    <form method="POST">
                                                        <span>Active</span>&ensp; <input type="radio" name="status" value="0" disabled="">
                                                        <span>Unactive</span>&ensp; <input type="radio" name="status" value="1" checked="">
                                                    </form>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
        <script type="text/javascript" <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
        <script src="https://cdn.ckeditor.com/4.21.0/basic/ckeditor.js"></script>
        <script>
            $(document).ready(function () {
                var feedbackElements = document.getElementsByClassName("feedback");
                for (var i = 0; i < feedbackElements.length; i++) {
                    CKEDITOR.replace(feedbackElements[i]);
                }
            });
        </script>
        <c:if test="${sentsuccess != null}">
            <div class="notification-success">
                <div class="content">
                    <div class="title">Success</div>
                    <span>The problem has been sent.</span>
                </div>
                <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
            </div>
            <script>
                let notification = document.querySelector('.notification-success');
                notification.timeOut = setTimeout(() => notification.remove(), 5000);
            </script>
        </c:if>
    </body>
    <script>
        $(window).on("load resize ", function () {
            var scrollWidth = $('.tbl-content').width() - $('.tbl-content table').width();
            $('.tbl-header').css({'padding-right': scrollWidth});
        }).resize();
    </script>
    <script>
        var feedbackButtons = document.getElementsByClassName("feedbackButton");
        var feedbackForms = document.getElementsByClassName("feedbackForm");
        var overlay = document.getElementById("overlay");
        var noevents = document.getElementsByClassName("noevent");

        for (var i = 0; i < feedbackButtons.length; i++) {
            feedbackButtons[i].addEventListener("click", function () {
                var index = this.getAttribute("data-index");
                var feedbackForm = document.querySelector('.feedbackForm[data-index="' + index + '"]');
                feedbackForm.classList.remove("hidden");
                overlay.classList.remove("hidden");
            });
        }

        var closeButtons = document.getElementsByClassName("close");
        for (var i = 0; i < closeButtons.length; i++) {
            closeButtons[i].addEventListener("click", function () {
                var index = this.parentNode.getAttribute("data-index");
                var feedbackForm = document.querySelector('.feedbackForm[data-index="' + index + '"]');
                var noevent = document.querySelector('.noevent[data-index="' + index + '"]');
                feedbackForm.classList.add("hidden");
                overlay.classList.add("hidden");
                noevent.checked = "true";
            });
        }
    </script>
    <style>
        .feedbackForm {
            position: fixed;
            top: 50%;
            left: 50%;
            border-radius: 20px;
            transform: translate(-50%, -50%);
            background-color: white;
            padding: 20px;
            z-index: 10000;
        }
        #roomForm {
            position: fixed;
            top: 50%;
            left: 50%;
            border-radius: 20px;
            transform: translate(-50%, -50%);
            background-color: white;
            padding: 20px;
            z-index: 10000;
        }
    </style>
</html>
