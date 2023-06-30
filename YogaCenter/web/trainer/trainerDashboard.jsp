<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Staff Dashboard</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="css/admin/admin.css">
    </head>

    <body>
        <div class="sidebar">
            <h3>Trainer Dashboard</h3>
            <ul>
                <li>
                    <a href="/YogaCenter/request?action=DashBoard&option=2">
                        <i class="fas fa-user icon"></i>
                        Trainer DashBoard
                    </a>
                </li>
                <li>
                    <a href="/YogaCenter/manageuser">
                        <i class="fas fa-user icon"></i>
                        Manage Trainee
                    </a>
                </li>
                <li>
                    <a href="/YogaCenter/TrainerShowCourseList">
                        <i class="fas fa-book icon"></i>
                        Course List
                    </a>
                </li>
                <li>
                    <a href="/YogaCenter/trainerviewschedule">
                        <i class="fas fa-calendar-alt icon"></i>
                        View Schedule
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