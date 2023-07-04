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
    </style>
    <body>
        <c:import url="header.jsp"></c:import>
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
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-2" style="margin-right: 50px; padding: 0;">
                    <c:import url="traineeClassMenu.jsp"></c:import>
                    </div>

                    <div class="col-lg-9" style="padding: 0">
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
                        <div class="container mt-5">
                            <div class="d-flex justify-content-center row">
                                <div class="col-md-10">
                                    <div class="rounded">
                                        <div class="table-responsive table-borderless">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th>Trainer</th>
                                                        <th>Class ID</th>
                                                        <th>Day</th>
                                                        <th>Time</th>
                                                        <th>Room</th>
                                                        <th>Action</th>
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
                                                        <th class="col-lg-2">
                                                            <a href="/YogaCenter/request?action=ClassDetail&id=<%=classDetails.getId_class()%>&option=classDetail"><%=classDetails.getId_class()%></a>
                                                        </th>
                                                        <th class="col-lg-3">
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
                                                        %><th class="col-lg-2">9h - 11h</th><%
                                                                break;
                                                            case 2:
                                                            %><th class="col-lg-2">13h - 15h</th><%
                                                                    break;
                                                                case 3:
                                                            %><th class="col-lg-2">16h - 18h</th><%
                                                                    break;
                                                                case 4:
                                                            %><th class="col-lg-2">19h - 21h</th><%
                                                                        break;
                                                                    default:
                                                                        throw new AssertionError();
                                                                }
                                                            %>
                                                        <th class="col-lg-2"><%=classDetails.getClass_name()%></th>
                                                        <th class="col-lg-2">
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
                                                                <button type="submit" name="action" value="traineeChooseClass">Change</button>
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
                        } else if (hashClassDetail.isEmpty()) {
                        %><h1>title</h1><%
                                    }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
