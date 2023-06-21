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