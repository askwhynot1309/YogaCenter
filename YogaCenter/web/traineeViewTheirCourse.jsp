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
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
        <title>My Course</title>
    </head>
    <style>
        thead {
            background: #dddcdc;
        }
        .cell-1 th{
            vertical-align: middle;
        }
        html,
        body,
        h1,
        h2,
        h3,
        h4,
        h5 {
            font-family: "Raleway", sans-serif
        }
        body{
            font-size: 100%;
        }
        .w3-bar-block a:hover{
            text-decoration: none;
        }
        .head a:hover{
            text-decoration: none;
            color: orange!important;
            background-color: #f1f1f1!important;
            transition: .1s;
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
  <c:import url="header.jsp"></c:import>
    <body class="w3-light-grey">
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
        <c:set var="acc" value="${sessionScope.account}"/>
        <nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
            <div class="w3-container w3-row">
                <div class="w3-col s4">
                    <img src="/w3images/avatar2.png" class="w3-circle w3-margin-right" style="width:46px">
                </div>
                <div class="w3-col s8 w3-bar">
                    <span>Welcome,<strong>${acc.name}</strong></span><br>
                </div>
            </div>
            <hr>
            <div class="w3-container">
                <h5>Dashboard</h5>
            </div>
            <div class="w3-bar-block">
                <a href="traineeGeneralDashboard.jsp" class="w3-bar-item w3-button w3-padding"><i class="fa fa-users fa-fw"></i>  General</a>
                <a href="information" class="w3-bar-item w3-button w3-padding"><i class="fa fa-eye fa-fw"></i>  Views</a>
                <a href="/YogaCenter/classbooking" class="w3-bar-item w3-button w3-padding  w3-blue"><i class="fas fa-calendar-alt icon"></i>  My learning</a>
                <a href="/YogaCenter/purchase" class="w3-bar-item w3-button w3-padding"><i class="fa fa-history fa-fw"></i> Purchase History</a>
                <a href="/YogaCenter/request?action=ChangePassword" class="w3-bar-item w3-button w3-padding><i class="fa fa-cog fa-fw"></i>  Settings</a><br><br>
            </div>
        </nav>

        <div class="w3-main" style="margin-left:300px;">
            <header class="w3-container w3-row-padding w3-margin-bottom head" style="padding-top:22px">

                <a href="/YogaCenter/classbooking" class="w3-third w3-bar-item w3-button w3-padding" style="padding: 0">
                    <div class="w3-container  w3-padding">
                        <div class="w3-middle"><i class="fas fa-calendar-alt icon w3-xxlarge"><h6>Schedule</h6></i></div>

                    </div>
                </a>
                <a href="/YogaCenter/myCourses" class="w3-third w3-bar-item w3-button w3-padding" style="padding: 0">
                    <div class="w3-container  w3-padding">
                        <div class="w3-middle"><i class="fas fa-users w3-xxlarge"><h6>My courses</h6></i></div>

                    </div>
                </a>
                <a href="/YogaCenter/viewRequest" class="w3-third w3-bar-item w3-button w3-padding" style="padding: 0">
                    <div class="w3-container  w3-padding">
                        <div class="w3-middle"><i class="fas fa-exchange w3-xxlarge"><h6>Request to change classes</h6></i></div>

                    </div>
                </a>
            </header>
            <div class="container">
                <div style="padding: 0">
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
