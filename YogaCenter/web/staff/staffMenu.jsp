<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Staff Dashboard</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="css/staff/staff.css">
    </head>

    <body>
        <div class="sidebar">
            <h3>Staff Dashboard</h3>
            <ul>
                <li>
                    <a href="/YogaCenter/request?action=DashBoard&option=1">
                        <i class="fas fa-user icon"></i>
                        Staff DashBoard
                    </a>
                </li>
                <li>
                    <a href="/YogaCenter/request?action=ManageTrainee">
                        <i class="fas fa-user icon"></i>
                        Manage Trainee
                    </a>
                </li>
                <li>
                    <a href="/YogaCenter/request?action=ViewSchedule">
                        <i class="fas fa-calendar-alt icon"></i>
                        View Schedule
                    </a>
                </li>
                <li>
                    <a href="/YogaCenter/request?action=ManageClass">
                        <i class="fas fa-door-open icon"></i>
                        Manage Class
                    </a>
                </li>
                <li>
                    <a href="/YogaCenter/request?action=StaffCourseList">
                        <i class="fas fa-book icon"></i>
                        Course List
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