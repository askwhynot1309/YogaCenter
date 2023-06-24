<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/x-icon" href="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png">
        <link rel="stylesheet" href="css/admin/admin.css">
        <link rel="stylesheet" href="css/admin/admin-user.css">
        <link rel="stylesheet" href="css/admin/admin-table.css">
        <link rel="stylesheet" href="css/admin/admin-course.css">
        <link rel="stylesheet" href="css/admin/admin-course-add.css">
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-2" style="padding: 0">
                    <c:import url="adminMenu.jsp"></c:import>
                    </div>
                    <div class="col-lg-10">
                        <h2 style="display: flex; justify-content: center; font-family: monospace;font-weight: 700; margin-top: 20px; text-transform: uppercase">
                            Manage Room
                        </h2>
                        <div id="overlay" class="overlay hidden"></div>
                        <button class="btn btn-primary" style="margin-bottom: 20px" id="roomButton">Add new room</button>
                        <div id="overlay" class="overlay hidden"></div>

                        <div id="roomForm" class="hidden">
                            <div id="closeButton" style="display: flex; float: right; cursor: pointer; width: 30px;height: 30px">&#10006;</div>
                            <div style="display: block; width: 400px">
                                <h3 style="text-align: center;margin-top: 30px">New room</h3>
                                <form action="/YogaCenter/request" method="POST">
                                    <p>Name of room : <input type="text" name="room_name" value="${param.room_name}" required="" class="input-course"></p>
                                <input name="room_status" value="0" hidden="">
                                <button name="action" value="AddRoom" class="btn-search" style="margin-left: 40%">Add</button>
                            </form>
                            <br>
                        </div>
                    </div>
                    <c:set var="listRoom" value="${requestScope.listRoom}"/>
                    <c:set var="noneRoom" value="${requestScope.noneRoom}"/>
                    <c:set var="theSame" value="${requestScope.theSame}"/>
                    <c:set var="addsuccess" value="${requestScope.addsuccess}"/>
                    <c:set var="sovlesuccess" value="${requestScope.sovlesuccess}"/>
                    <c:set var="listRoomStatus" value="${requestScope.listRoomStatus}"/>
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
                        <div class="tbl-content" style="height: 500px">
                            <table cellpadding="0" cellspacing="0" border="0">
                                <tbody>
                                    <c:forEach var="room" items="${listRoom}" varStatus="loop">
                                        <tr>
                                            <td style="width: 50px">${loop.count}</td>
                                            <td>${room.room}</td>
                                            <td style="width: 300px">
                                                <c:if test="${room.status == 0}">
                                                    <p style="color: green">Active</p>
                                                </c:if>
                                                <c:if test="${room.status == 1}">
                                                    <c:if test="${listRoomStatus != null && !listRoomStatus.isEmpty()}">
                                                        <c:forEach var="roomstatus" items="${listRoomStatus}">
                                                            <c:if test="${roomstatus.id_room == room.id_room}">
                                                                <div style="display: flex; align-items: center">
                                                                    <p style="color: red">Unactive</p>
                                                                    <button class="btn btn-primary feedbackButton" style="margin-left: 60px" data-index="${loop.index}">View feedback</button>
                                                                </div>
                                                                <div class="hidden feedbackForm" data-index="${loop.index}">
                                                                    <div class ="close" style="display: flex; float: right; cursor: pointer; width: 30px;height: 30px">&#10006;</div>
                                                                    <div style="display: block; width: 500px">
                                                                        <h3 style="text-align: center;margin-top: 30px">Feedback</h3>
                                                                        <div style="display: flex; align-items: center; justify-content: space-between">
                                                                            <p>Room: ${roomstatus.room}</p> 
                                                                            <p>Date-Time : ${roomstatus.dateFeedback}</p>
                                                                        </div>
                                                                        <p>Content of Feedback : ${roomstatus.feedback}</p><br>
                                                                        <form action="/YogaCenter/request" method="POST">
                                                                            <input name="id" value="${roomstatus.id_room}" hidden="">
                                                                            <input name="date" value="${roomstatus.dateFeedback}" hidden="">
                                                                            <button name="action" value="resolve" class="btn-search" style="margin-left: 40%">Resolve</button>
                                                                        </form>
                                                                    </div>
                                                                    <br>
                                                                </div>
                                                            </c:if>
                                                        </c:forEach>
                                                    </c:if>
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
        <c:if test="${theSame != null}">
            <div class="notification">
                <div class="content">
                    <div class="title">Error</div>
                    <span>Name of room has been existed !</span>
                </div>
                <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
            </div>
            <script>
                let notification = document.querySelector('.notification');
                notification.timeOut = setTimeout(() => notification.remove(), 5000);
            </script>
        </c:if> 
        <c:if test="${addsuccess != null}">
            <div class="notification-success">
                <div class="content">
                    <div class="title">Success</div>
                    <span>Create a new successful course.</span>
                </div>
                <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
            </div>
            <script>
                let notification = document.querySelector('.notification-success');
                notification.timeOut = setTimeout(() => notification.remove(), 5000);
            </script>
        </c:if>
        <c:if test="${sovlesuccess != null}">
            <div class="notification-success">
                <div class="content">
                    <div class="title">Success</div>
                    <span>The problem has been resolved.</span>
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
                feedbackForm.classList.add("hidden");
                overlay.classList.add("hidden");
            });
        }
    </script>
    <script>
        var roomButton = document.getElementById("roomButton");
        var roomForm = document.getElementById("roomForm");
        var closeButton = document.getElementById("closeButton");
        var overlay = document.getElementById("overlay");

        roomButton.addEventListener("click", function () {
            roomForm.classList.remove("hidden");
            overlay.classList.remove("hidden");
        });

        closeButton.addEventListener("click", function () {
            roomForm.classList.add("hidden");
            overlay.classList.add("hidden");
        });

        overlay.addEventListener("click", function () {
            roomForm.classList.add("hidden");
            overlay.classList.add("hidden");
        });
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
