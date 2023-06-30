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
                    <a href="/YogaCenter/request?action=DashBoard&option=0">
                        <i class="fas fa-user icon" style="margin-right: 17px"></i>
                        Admin DashBoard
                    </a>
                </li>
                <li>
                    <a href="/YogaCenter/message">
                        <i class="fas fa-user icon" style="margin-right: 17px"></i>
                        Notification
                        <c:if test="${notification != null}">
                            <svg xmlns="http://www.w3.org/2000/svg" height="0.75em" viewBox="0 0 512 512" style="margin-left: 10px"><!--! Font Awesome Free 6.4.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#f40606}</style><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zm0-384c13.3 0 24 10.7 24 24V264c0 13.3-10.7 24-24 24s-24-10.7-24-24V152c0-13.3 10.7-24 24-24zM224 352a32 32 0 1 1 64 0 32 32 0 1 1 -64 0z"/></svg>
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
                    <a href="/YogaCenter/manageclass">
                        <i class="fas fa-door-open icon"></i>
                        Manage Class
                    </a>
                </li>
                 <li>
                    <a href="/YogaCenter/booking">
                        <i class="fas fa-door-open icon"></i>
                        Manage Booking
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