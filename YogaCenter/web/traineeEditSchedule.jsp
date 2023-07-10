<%-- 
    Document   : traineeEditSchedule.jsp
    Created on : Jun 14, 2023, 9:27:51 AM
    Author     : ngmin
--%>

<%@page import="Object.ClassDetail"%>
<%@page import="Object.Message"%>
<%@page import="java.time.LocalDate"%>
<%@page import="Object.Time"%>
<%@page import="Dao.TimeDao"%>
<%@page import="Dao.AccountDao"%>
<%@page import="Object.Account"%>
<%@page import="java.util.Map"%>
<%@page import="Dao.ClassDetailDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="icon" type="image/x-icon" href="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
        <link rel="icon" type="image/x-icon" href="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png">
        <link rel="stylesheet" href="css/style.css"/>
        <title>Schedule Editing</title>
    </head>
    <style>
        thead {
            background: #dddcdc;
        }

        .cell-1 th{
            vertical-align: middle;
        }

        .alternate-row{
            background-color: #f1f3f4;
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
        .w3-button:hover{
            text-decoration: none;
            color: orange!important;
            background-color: #f1f1f1!important;
            transition: 1s;
        }
        .notificate{
            /*position: absolute;*/
            background: red;
            color: white;
            border-radius: 9999em;
            padding: 0% 2% !important;
            /*top: -100%;*/
            /*right: 0;*/
        }
    </style>
    <body class="w3-light-grey">
        <c:import url="header.jsp"></c:import>
        <c:set var="exist" value="${sessionScope.account}"/>
        <c:set var="requestList" value="${sessionScope.requestList}"></c:set>
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
        <c:set var="acc" value="${requestScope.acc}"/>
        <nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
            <div style="text-align: center" class="w3-container w3-row">
                <div class="w3-col image">
                    <img src="img/${acc.image}" alt="image" class="w3-circle " style="width:150px; height: 150px; margin-right: 0px;">
                </div>
                <div class="w3-col w3-bar">
                    <br>
                    <span>Welcome <strong>${acc.name}</strong></span><br>
                </div>
            </div>
            <hr>
            <div class="w3-container">
                <h5>Dashboard</h5>
            </div>
            <div class="w3-bar-block">
                <a href="traineeGeneralDashboard.jsp" class="w3-bar-item w3-button w3-padding"><i class="fa fa-users fa-fw"></i>  General</a>
                <a href="yourcourse" class="w3-bar-item w3-button w3-padding"><i class="fa fa-users fa-fw"></i>  My courses</a>
                <a href="information" class="w3-bar-item w3-button w3-padding"><i class="fa fa-eye fa-fw"></i>  Views</a>
                <a href="/YogaCenter/classbooking" class="w3-bar-item w3-button w3-padding  w3-blue"><i class="fas fa-calendar-alt icon"></i>  My Learning
                    <c:if test="${requestList.size() > 0}">
                        <div class="w3-right notificate">${requestList.size()}</div>
                    </c:if>
                </a>
                <a href="/YogaCenter/purchase" class="w3-bar-item w3-button w3-padding"><i class="fa fa-history fa-fw"></i> Purchase History</a>
                <a href="/YogaCenter/request?action=ChangePassword" class="w3-bar-item w3-button w3-padding"><i class="fa fa-cog fa-fw"></i>  Settings</a><br><br>
                <a href="/YogaCenter/request?action=Logout" class="w3-bar-item w3-button w3-padding"><i class="fas fa-sign-out-alt icon"></i>Logout</a>
            </div>
        </nav>
        <div class="w3-main" style="margin-left:300px;">
            <header class="w3-container w3-row-padding w3-margin-bottom head" style="padding-top:22px">
                <a href="/YogaCenter/classbooking" class="w3-third w3-bar-item w3-button w3-padding" style="padding: 0"><br><br>
                    <div class="w3-container  w3-padding">
                        <div class="w3-middle"><i class="fas fa-calendar-alt icon w3-xxlarge"><h6>Schedule</h6></i></div>
                    </div>
                </a>

                <a href="/YogaCenter/myCourses" class="w3-third w3-bar-item w3-button w3-padding" style="padding: 0"><br><br>
                    <div class="w3-container  w3-padding">
                        <div class="w3-middle"><i class="fas fa-users w3-xxlarge"><h6>My courses</h6></i></div>
                    </div>
                </a>

                <a href="/YogaCenter/viewRequest" class="w3-third w3-bar-item w3-button w3-padding" style="padding: 0">
                    <c:if test="${requestList.size() > 0}">
                        <div style="display: flex; flex-direction: column; align-items: center;" class="w3-container  w3-padding">
                            <div style="width: 24.525px;" class="w3-middle notificate">
                                ${requestList.size()}
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${requestList == null or requestList.size() == 0}">
                        <br><br>
                    </c:if>
                    <div class="w3-container  w3-padding">
                        <div class="w3-middle"><i class="fas fa-exchange w3-xxlarge"><h6>Request to change classes</h6></i></div>
                    </div>
                </a>
            </header>
            <div class="container">
                <div style="padding: 0">
                    <div class="container">
                        <h2 style="text-align: center">Class Schedule</h2>
                        <%
                            HashMap<Integer, ArrayList<ClassDetail>> hashClassDetail = (HashMap<Integer, ArrayList<ClassDetail>>) request.getAttribute("hashClassDetail");
                            String overdue = (String) request.getAttribute("overdue");
                            Account trainee = (Account) session.getAttribute("account");
                            LocalDate startDate = (LocalDate) request.getAttribute("startDate");
                            LocalDate endDate = (LocalDate) request.getAttribute("endDate");
                        %>
                        <h4 style="text-align: center; color: red;">Starting date: <%=startDate%>. Due date: before <%=endDate%></h4>
                        <%
                            if (!hashClassDetail.isEmpty() && overdue != null) {

                        %>
                        <div class="container mt-12">
                            <div class="d-flex justify-content-center row">
                                <div class="col-md-10">
                                    <div class="rounded">
                                        <div class="table-responsive table-borderless">
                                            <table class="table">
                                                <thead>
                                                    <tr class="cell-1">
                                                        <th class="col-lg-2">Trainer</th>
                                                        <th class="col-lg-1">Class ID</th>
                                                        <th class="col-lg-4">Day</th>
                                                        <th class="col-lg-1">Time</th>
                                                        <th class="col-lg-1">Room</th>
                                                        <th class="col-lg-1">Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="table-body">
                                                    <%                                            boolean isFirstRow = true;
                                                        int rowNumber = 0;
                                                        for (Map.Entry<Integer, ArrayList<ClassDetail>> entry : hashClassDetail.entrySet()) {
                                                            Integer key = entry.getKey();
                                                            ArrayList<ClassDetail> listChoice = entry.getValue();
                                                            for (ClassDetail classDetails : listChoice) {
                                                                String trainerName = "";
                                                                ArrayList<Account> accountList = AccountDao.getAllTrainer();
                                                                for (Account account : accountList) {
                                                                    if (key == account.getIdaccount()) {
                                                                        trainerName = account.getName();
                                                                    }
                                                                }
                                                                if (!trainerName.isEmpty()) {
                                                    %>
                                                    <tr class="cell-1 <%= rowNumber % 2 == 0 ? "alternate-row" : ""%>">
                                                        <%if (isFirstRow) {
                                                        %>
                                                        <th style="vertical-align: middle;" class="col-lg-2" rowspan="<%= listChoice.size()%>"><%= trainerName%></th>
                                                            <%
                                                                    isFirstRow = false;
                                                                }
                                                            %>
                                                        <th class="col-lg-1">
                                                            <a href="/YogaCenter/request?action=ClassDetail&id=<%=classDetails.getId_class()%>&option=classDetail"><%=classDetails.getId_class()%></a>
                                                        </th>
                                                        <th class="col-lg-4">
                                                            <%
                                                                if (classDetails.getChoice() == 1) {
                                                            %>Monday - Wednesday - Friday<%
                                                            } else if (classDetails.getChoice() == 2) {
                                                            %>Tuesday - Thursday - Saturday<%
                                                            } else {
                                                            %>Sunday<%
                                                                }
                                                            %>
                                                        </th>
                                                        <%

                                                        %>
                                                        <%                                                                switch (classDetails.getTime()) {
                                                                case 1:
                                                        %><th class="col-lg-1">9h - 11h</th><%
                                                                break;
                                                            case 2:
                                                            %><th class="col-lg-1">13h - 15h</th><%
                                                                    break;
                                                                case 3:
                                                            %><th class="col-lg-1">16h - 18h</th><%
                                                                    break;
                                                                case 4:
                                                            %><th class="col-lg-1">19h - 21h</th><%
                                                                        break;
                                                                    default:
                                                                        throw new AssertionError();
                                                                }
                                                            %>
                                                        <th class="col-lg-1"><%=classDetails.getClass_name()%></th>
                                                        <th class="col-lg-1">
                                                            <%
                                                                int AccountID = ClassDetailDao.checkTraineeIDInClass(classDetails.getId_course(), trainee.getIdaccount(), classDetails.getTime(), classDetails.getId_room(), classDetails.getChoice());
                                                                if (AccountID == 0) {
                                                            %>
                                                            <form action="/YogaCenter/request" method="post">
                                                                <input type="hidden" name="trainee" value="<%=trainee.getIdaccount()%>">
                                                                <input type="hidden" name="id_course" value="<%=classDetails.getId_course()%>">
                                                                <input type="hidden" name="id_room" value="<%=classDetails.getId_room()%>">
                                                                <input type="hidden" name="option" value="<%=classDetails.getChoice()%>">
                                                                <input type="hidden" name="id_time" value="<%=classDetails.getTime()%>">
                                                                <button class="w3-button" type="submit" name="action" value="traineeChooseClass">Choose</button>
                                                            </form>
                                                            <%
                                                                }
                                                            %>
                                                        </th>
                                                    </tr>
                                                    <%
                                                                }
                                                            }
                                                            isFirstRow = true;
                                                            rowNumber++;
                                                        }
                                                    %>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                        } else if (!hashClassDetail.isEmpty() && overdue == null) {
                        %>
                        <div style="text-align: center">
                            <h4>
                                <span><%=overdue%></span>
                            </h4>
                        </div>
                        <%
                        } else if (hashClassDetail.size() == 0) {
%><h1 style="text-align: center">Your course currently has no classes</h1><%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
