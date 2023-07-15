<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/x-icon" href="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png">
        <link rel="stylesheet" href="css/admin/admin-schedule.css">
        <link rel="stylesheet" href="css/staff/staff-changeroom.css">
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
            .btn {
                display: flex;
                height: 3em;
                width: 100px;
                align-items: center;
                justify-content: center;
                background-color: #eeeeee4b;
                border-radius: 3px;
                letter-spacing: 1px;
                transition: all 0.2s linear;
                cursor: pointer;
                border: none;
                background: #fff;
            }

            .btn > svg {
                margin-right: 5px;
                margin-left: 5px;
                font-size: 20px;
                transition: all 0.4s ease-in;
            }

            .btn a{
                text-decoration: none;
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
                <div class="col-lg-3" style="padding: 0">
                    <c:import url="staffMenu.jsp"/>
                </div>
                <div class="col-lg-8">
                    <div style="height: 40px; width: 100%; margin-top: 10px; margin-bottom: 10px">
                        <a href="/YogaCenter/viewschedule" class="btn">
                            <svg height="16" width="16" xmlns="http://www.w3.org/2000/svg" version="1.1" viewBox="0 0 1024 1024"><path d="M874.690416 495.52477c0 11.2973-9.168824 20.466124-20.466124 20.466124l-604.773963 0 188.083679 188.083679c7.992021 7.992021 7.992021 20.947078 0 28.939099-4.001127 3.990894-9.240455 5.996574-14.46955 5.996574-5.239328 0-10.478655-1.995447-14.479783-5.996574l-223.00912-223.00912c-3.837398-3.837398-5.996574-9.046027-5.996574-14.46955 0-5.433756 2.159176-10.632151 5.996574-14.46955l223.019353-223.029586c7.992021-7.992021 20.957311-7.992021 28.949332 0 7.992021 8.002254 7.992021 20.957311 0 28.949332l-188.073446 188.073446 604.753497 0C865.521592 475.058646 874.690416 484.217237 874.690416 495.52477z"></path></svg>
                            <span>Back</span>
                        </a>
                    </div>
                    <h2 style="display: flex; justify-content: center; margin-bottom: 50px; font-family: monospace;font-weight: 700; margin-top: 20px; text-transform: uppercase">Class Information</h2>
                    <c:set var="InforClass" value="${requestScope.InforClass}"/>
                    <c:set var="roomlist" value="${requestScope.roomlist}"/>
                    <c:set var="timelist" value="${requestScope.timelist}"/>
                    <c:set var="wrongDate" value="${requestScope.wrongDate}"/>
                    <c:set var="success" value="${requestScope.success}"/>
                    <c:set var="theSame" value="${requestScope.theSame}"/>
                    <h3 style="display: flex; margin-bottom: 20px; font-family: monospace;font-weight: 700; margin-top: 30px; text-transform: uppercase; background-color: #3b83f65f; color: #0071e2; padding: 10px">Change class</h3>
                    <c:if test="${InforClass != null}">
                        <form action="/YogaCenter/request" method="POST">
                            <div style="display: flex; align-items: center; justify-content: space-between">
                                <div>
                                    <p>Current room : ${InforClass.class_name}</p>
                                    <p>Room change : <select name="id_room">
                                            <c:if test="${roomlist != null}">
                                                <c:forEach var="room" items="${roomlist}">
                                                    <option value="${room.id_room}">${room.room}</option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </p>
                                </div>
                                <div>
                                    <p>Current-Date : ${InforClass.date}</p>
                                    <p>Date change : <input type="date" name="newdate"></p>
                                    <p><input name="olddate" value="${InforClass.date}" hidden=""></p>
                                </div>
                                <div>
                                    <p>Current-Time : 
                                        <c:if test="${InforClass.time == 1}">
                                            9h - 11h
                                        </c:if>
                                        <c:if test="${InforClass.time == 2}">
                                            13h - 15h
                                        </c:if>
                                        <c:if test="${InforClass.time == 3}">
                                            16h - 18h
                                        </c:if>
                                        <c:if test="${InforClass.time == 4}">
                                            19h - 21h
                                        </c:if>
                                    </p>
                                    <p>Time change : <select name="id_time">
                                            <c:if test="${timelist != null}">
                                                <c:forEach var="time" items="${timelist}">
                                                    <option value="${time.id_time}">${time.time}</option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </p>
                                </div>
                            </div>
                            <input name="id" value="${InforClass.id_class}" hidden="">
                            <input name="id_course" value="${InforClass.id_course}" hidden="">
                            <input name="choice" value="${InforClass.choice}" hidden="">
                            <input name="idaccount" value="${InforClass.idaccount}" hidden="">
                            <button value="ButtonChangeroom" name="action" class="btn-update">Change class</button>
                        </form>
                    </c:if>
                    <c:if test="${InforClass == null}">
                        <h3 style="text-align: center; color: #00CC00">You had changed this class in new class. Return back to view schedule.</h3>
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
                    <span>In that date has had class !</span>
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
