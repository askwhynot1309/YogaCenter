<%-- 
    Document   : traineeViewTheirCourse
    Created on : Jun 26, 2023, 2:31:11 PM
    Author     : ngmin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="css/style.css"/>
        <title>My Course</title>
    </head>
    <style>
        thead {
            background: #dddcdc;
        }
        .cell-1 th{
            vertical-align: middle;
        }
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
    </style>
    <body>
        <c:set var="exist" value="${sessionScope.account}"/>
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
        <c:import url="header.jsp"></c:import>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-2" style="margin-right: 50px; padding: 0;">
                        <c:import url="traineeClassMenu.jsp"></c:import>
                    </div>

                    <div class="col-lg-9" style="padding: 0">
                        <div class="container">
                            <h2 style="text-align: center">My Learning</h2>
                            <div class="container mt-10">
                                <div class="d-flex justify-content-center row">
                                    <div class="col-lg-12">
                                        <div class="rounded">
                                            <div class="table-responsive table-borderless">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th>Course Name</th>
                                                            <th>Start Date</th>
                                                            <th>Slot</th>
                                                            <th>Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="table-body">
                                                    <c:forEach var="course" items="${requestScope.courseList}">
                                                        <tr class="cell-1">
                                                            <th><a href="/YogaCenter/request?action=inf&option=viewmore&id=${course.idCourse}">${course.name_course}</a></th>
                                                            <th>${course.date_start}</th>
                                                            <th>${course.slot}</th>
                                                            <th><a href="/YogaCenter/request?action=EditSchedule&courseID=${course.idCourse}">Edit Schedule</a></th>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
