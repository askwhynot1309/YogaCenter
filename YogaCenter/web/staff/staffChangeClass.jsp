<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/x-icon" href="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png">
        <link rel="stylesheet" href="css/admin/admin-schedule.css">
        <link rel="stylesheet" href="css/staff/staff-changeroom.css">
        <title>Staff Dashboard</title>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3" style="padding: 0">
                    <c:import url="staffMenu.jsp"/>
                </div>
                <div class="col-lg-8">
                    <h2 style="display: flex; justify-content: center; margin-bottom: 50px; font-family: monospace;font-weight: 700; margin-top: 20px; text-transform: uppercase">Class Information</h2>
                    <c:set var="inforClass" value="${requestScope.InforClass}"/>
                    <c:set var="roomlist" value="${requestScope.roomlist}"/>
                    <c:set var="timelist" value="${requestScope.timelist}"/>
                    <c:set var="wrongDate" value="${requestScope.wrongDate}"/>
                    <c:set var="success" value="${requestScope.success}"/>
                    <c:set var="theSame" value="${requestScope.theSame}"/>
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
                        <h3 style="display: flex; margin-bottom: 20px; font-family: monospace;font-weight: 700; margin-top: 30px; text-transform: uppercase; background-color: #3b83f65f; color: #0071e2; padding: 10px">Change class</h3>
                        <form action="/YogaCenter/request" method="POST">
                            <div style="display: flex; align-items: center; justify-content: space-between">
                                <div>
                                    <p>Current room : ${inforClass.class_name}</p>
                                    <p>Room change : <select name="id-room">
                                            <c:if test="${roomlist != null}">
                                                <c:forEach var="room" items="${roomlist}">
                                                    <option value="${room.id_room}">${room.room}</option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </p>
                                </div>
                                <div>
                                    <p>Current-Date : ${inforClass.date}</p>
                                    <p>Date change : <input type="date" name="newdate"></p>
                                    <p><input name="olddate" value="${inforClass.date}" hidden=""></p>
                                </div>
                                <div>
                                    <p>Current-Time : 
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
                                    </p>
                                    <p>Time change : <select name="id-time">
                                            <c:if test="${roomlist != null}">
                                                <c:forEach var="time" items="${timelist}">
                                                    <option value="${time.id_time}">${time.time}</option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </p>
                                </div>
                            </div>
                                    <input name="id" value="${inforClass.id_detail}" hidden="">
                                    <button value="ButtonChangeroom" name="action" class="button-schedule">Change class</button>
                        </form>
                    </c:if>
                </div>
            </div>
        </div>
                    <c:if test="${wrongDate != null}">
        <div class="notification-date">
            <div class="content">
                <div class="title">Error</div>
                <span>Set up date wrong. Date was over !</span>
            </div>
            <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
        </div>
        <script>
            let notification = document.querySelector('.notification-date');
            notification.timeOut = setTimeout(() => notification.remove(), 5000);
        </script>
    </c:if>
        <c:if test="${success != null}">
        <div class="notification-success">
            <div class="content">
                <div class="title">Error</div>
                <span>Change room successfully !</span>
            </div>
            <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
        </div>
        <script>
            let notification = document.querySelector('.notification-success');
            notification.timeOut = setTimeout(() => notification.remove(), 5000);
        </script>
    </c:if>
        <c:if test="${theSame != null}">
        <div class="notification">
            <div class="content">
                <div class="title">Error</div>
                <span>Some fields has the same time or room !</span>
            </div>
            <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
        </div>
        <script>
            let notification = document.querySelector('.notification');
            notification.timeOut = setTimeout(() => notification.remove(), 5000);
        </script>
    </c:if>
    </body>
</html>
