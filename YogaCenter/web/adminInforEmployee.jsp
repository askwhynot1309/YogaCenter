<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Admin Dashboard</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="admin.css">
    </head>

    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3">
                    <div class="sidebar">
                        <h3>Admin Dashboard</h3>
                        <ul>
                            <li>
                                <a href="/YogaCenter/request?action=AdminDashBoard">
                                    <i class="fas fa-user icon"></i>
                                    Admin DashBoard
                                </a>
                            </li>
                            <li>
                                <a href="/YogaCenter/request?action=ManageEmployee">
                                    <i class="fas fa-user icon"></i>
                                    Manage Trainer
                                </a>
                            </li>
                            <li>
                                <a href="/YogaCenter/request?action=ManageSchedule">
                                    <i class="fas fa-calendar-alt icon"></i>
                                    Manage Schedule
                                </a>
                            </li>
                            <li>
                                <a href="/YogaCenter/request?action=ManageUser">
                                    <i class="fas fa-users icon"></i>
                                    Manage User
                                </a>
                            </li>
                            <li>
                                <a href="/YogaCenter/request?action=adminCourseList">
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
                </div>
                <div class="col-lg-9">
                    <h2 style="display: flex; justify-content: center; margin-bottom: 100px; font-family: monospace;font-weight: 700; margin-top: 20px; text-transform: uppercase">Information of Employee</h2>
                    <c:set var="informationEmployee" value="${requestScope.informationEmployee}"/>
                    <c:if test="${informationEmployee != null}">
                        <div style="float: left; width: 600px">
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <td style="padding: 20px; font-weight: 700">Name : </td>
                                        <td style="padding: 20px">${informationEmployee.name}</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 20px; font-weight: 700">Email : </td>
                                        <td style="padding: 20px">${informationEmployee.email}</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 20px; font-weight: 700">Citizen Identity Card : </td>
                                        <td style="padding: 20px">${informationEmployee.cccd}</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 20px; font-weight: 700">Phone : </td>
                                        <td style="padding: 20px">${informationEmployee.phone}</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 20px; font-weight: 700">Address : </td>
                                        <td style="padding: 20px">${informationEmployee.address}</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 20px; font-weight: 700">Link CV : </td>
                                        <td style="padding: 20px">${informationEmployee.address}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div style="float: right; width: 350px; border: 5px solid black; padding: 10px">
                            <img src="img/${informationEmployee.image}" height="200px" width="200px" id="img" style="margin-left: 20%">
                        </div>
                    </c:if>
                </div>
                </body>
                </html>
