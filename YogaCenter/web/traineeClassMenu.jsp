<%-- 
    Document   : traineeClassMenu
    Created on : Jun 26, 2023, 1:29:48 PM
    Author     : ngmin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="icon" type="image/x-icon" href="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png">
        <link rel="stylesheet" href="css/style.css"/>
        <title>Menu</title>
    </head>
    <style>
        a{
            color: black;
        }
        .sidebar {
            background-color: #f8f9fa;
            padding: 20px;
            width: 250px;
            height: 100vh;
        }

        .sidebar h3 {
            color: #333;
            font-size: 24px;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 1px solid #ddd;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
            margin-top: 20px;
        }

        .sidebar ul li {
            margin-bottom: 10px;
        }

        .sidebar ul li a {
            color: #333;
            text-decoration: none;
            font-size: 18px;
            display: flex;
            align-items: center;
        }

        .sidebar ul li a:hover {
            color: #007bff;
        }

        .sidebar ul li a .icon {
            margin-right: 10px;
        }

        .sidebar .divider {
            margin-top: 20px;
            border-top: 1px solid #ddd;
            padding-top: 20px;
        }
    </style>
    <body>
        <div class="sidebar" style="height: 100%;">
            <h3>Trainee Dashboard</h3>
            <ul>
                <li>
                    <a href="/YogaCenter/classbooking">
                        <i class="fas fa-calendar-alt icon" style="margin-right: 17px"></i>
                        Weekly schedule
                    </a>
                </li>
                <li>
                    <a href="/YogaCenter/myCourses">
                        <i class="fas fa-users" style="margin-right: 17px"></i>
                        My courses
                    </a>
                </li>
                <li>
                    <a href="/YogaCenter/viewRequest">
                        <i class="fas fa-exchange" style="margin-right: 17px"></i>
                        Request to change classes
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
