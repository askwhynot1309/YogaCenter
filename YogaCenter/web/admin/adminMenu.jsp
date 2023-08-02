<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Admin Dashboard</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="css/admin/admin.css">
    </head>

    <body>
        <c:set var="notification" value="${sessionScope.Message}"/>
        <div class="sidebar">
            <h3>Admin Dashboard</h3>
            <ul>
                <li>
                    <a href="/YogaCenter/dashboard">
                        <i class="fas fa-user icon" style="margin-right: 17px"></i>
                        Admin DashBoard
                    </a>
                </li>
                <li>
                    <a href="/YogaCenter/message">
                        <svg xmlns="http://www.w3.org/2000/svg" height="0.825em" viewBox="0 0 512 512" style="fill:#010813; margin-right: 17px"><path d="M64 0C28.7 0 0 28.7 0 64V352c0 35.3 28.7 64 64 64h96v80c0 6.1 3.4 11.6 8.8 14.3s11.9 2.1 16.8-1.5L309.3 416H448c35.3 0 64-28.7 64-64V64c0-35.3-28.7-64-64-64H64z"/></svg>
                        Notification
                        <c:if test="${notification.size() > 0}">
                            <svg xmlns="http://www.w3.org/2000/svg" height="0.75em" viewBox="0 0 512 512" style="margin-left: 10px; fill:#f40606; height: 20px;width: 20px"><!--! Font Awesome Free 6.4.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zm0-384c13.3 0 24 10.7 24 24V264c0 13.3-10.7 24-24 24s-24-10.7-24-24V152c0-13.3 10.7-24 24-24zM224 352a32 32 0 1 1 64 0 32 32 0 1 1 -64 0z"/></svg>
                        </c:if>
                    </a>
                     
                </li>
                <li>
                    <a href="/YogaCenter/employee">
                        <i class="fas fa-user icon" style="margin-right: 17px"></i>
                        Manage Employee
                    </a>
                </li>
                <li>
                    <a href="/YogaCenter/schedule">
                        <i class="fas fa-calendar-alt icon" style="margin-right: 17px"></i>
                        Manage Schedule
                    </a>
                </li>
                <li>
                    <a href="/YogaCenter/user">
                        <i class="fas fa-users icon"></i>
                        Manage User
                    </a>
                </li>
                <li>
                    <a href="/YogaCenter/managecourse">
                        <i class="fas fa-book icon" style="margin-right: 17px"></i>
                        Course List
                    </a>
                </li>
                <li>
                    <a href="/YogaCenter/manageroom">
                        <i class="fas fa-door-open icon"></i>
                        Manage Room
                    </a>
                </li>
                 <li>
                    <a href="/YogaCenter/booking">
                        <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 640 512" style="margin-right: 10px"><path d="M36.8 192H603.2c20.3 0 36.8-16.5 36.8-36.8c0-7.3-2.2-14.4-6.2-20.4L558.2 21.4C549.3 8 534.4 0 518.3 0H121.7c-16 0-31 8-39.9 21.4L6.2 134.7c-4 6.1-6.2 13.2-6.2 20.4C0 175.5 16.5 192 36.8 192zM64 224V384v80c0 26.5 21.5 48 48 48H336c26.5 0 48-21.5 48-48V384 224H320V384H128V224H64zm448 0V480c0 17.7 14.3 32 32 32s32-14.3 32-32V224H512z"/></svg>
                        Manage Booking
                    </a>
                </li>
                <li>
                    <a href="/YogaCenter/setting">
                        <i class="fas fa-tools icon" style="margin-right: 14px"></i>
                        Setting Class
                    </a>
                </li>
                <li>
                    <a href="/YogaCenter/manageclass">
                        <i class="fas fa-door-open icon"></i>
                        Manage Class
                    </a>
                </li>
            </ul>
            <div class="divider"></div>
            <h4>Settings</h4>
            <ul>
                <li>
                    <a href="/YogaCenter/request?action=Logout">
                        <i class="fas fa-sign-out-alt icon"></i>
                        Logout
                    </a>
                </li>
            </ul>
        </div>
    </body>
</html>