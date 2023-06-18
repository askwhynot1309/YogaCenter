<%-- 
    Document   : traineeEditSchedule.jsp
    Created on : Jun 14, 2023, 9:27:51 AM
    Author     : ngmin
--%>

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
        <link rel="stylesheet" href="css/style.css"/>
        <title>Schedule Editing</title>
    </head>
    <style>
        thead {
            background: #dddcdc;
        }

        .toggle-btn {
            width: 40px;
            height: 21px;
            background: grey;
            border-radius: 50px;
            padding: 3px;
            cursor: pointer;
            -webkit-transition: all 0.3s 0.1s ease-in-out;
            -moz-transition: all 0.3s 0.1s ease-in-out;
            -o-transition: all 0.3s 0.1s ease-in-out;
            transition: all 0.3s 0.1s ease-in-out;
        }

        .toggle-btn > .inner-circle {
            width: 15px;
            height: 15px;
            background: #fff;
            border-radius: 50%;
            -webkit-transition: all 0.3s 0.1s ease-in-out;
            -moz-transition: all 0.3s 0.1s ease-in-out;
            -o-transition: all 0.3s 0.1s ease-in-out;
            transition: all 0.3s 0.1s ease-in-out;
        }

        .toggle-btn.active {
            background: blue !important;
        }

        .toggle-btn.active > .inner-circle {
            margin-left: 19px;
        }
        .cell-1 th{
            vertical-align: middle;
        }

        .container{
            margin: 50px auto;
        }

        .alternate-row{
            background-color: #f1f3f4;
        }
    </style>
    <body>
        <c:import url="header.jsp"></c:import>
            <div class="container">
                <h2 style="text-align: center">Class Schedule</h2>
                <div class="container mt-5">
                    <div class="d-flex justify-content-center row">
                        <div class="col-md-10">
                            <div class="rounded">
                                <div class="table-responsive table-borderless">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Trainer</th>
                                                <th>Day</th>
                                                <th>Time</th>
                                                <th>Room</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody class="table-body">
                                        <%
                                            int Course_ID = Integer.parseInt(request.getParameter("courseID"));
                                            HashMap<Integer, ArrayList<Integer>> hashChoise = ClassDetailDao.getChoiceWithAllTrainerInCourseID(Course_ID);
                                            Account trainee = (Account) session.getAttribute("account");
                                            if (hashChoise != null) {
                                                boolean isFirstRow = true;
                                                int rowNumber = 0;
                                                for (Map.Entry<Integer, ArrayList<Integer>> entry : hashChoise.entrySet()) {
                                                    Integer key = entry.getKey();
                                                    ArrayList<Integer> listChoice = entry.getValue();
                                                    for (Integer choice : listChoice) {
                                                        String trainerName = "";
                                                        int ID_Class = 0;
                                                        Time time_class = TimeDao.getTimeByTrainerAndChoice(Course_ID, key, choice);
                                                        String time = time_class.getTime();
                                                        ID_Class = ClassDetailDao.getIDClassByTrainerCourseChoiseTime(key, Course_ID, choice, time_class.getId_time());
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
                                            <th style="vertical-align: middle;" class="col-lg-3" rowspan="<%= listChoice.size()%>"><%= trainerName%></th>
                                                <%
                                                        isFirstRow = false;
                                                    }
                                                %>
                                            <th class="col-lg-3">
                                                <%
                                                    if (choice == 1) {
                                                %>Monday - Wednesday - Friday<%
                                                } else if (choice == 2) {
                                                %>Tuesday - Thursday - Saturday<%
                                                } else {
                                                %>Sunday<%
                                                    }
                                                %>
                                            </th>
                                            <%

                                            %>
                                            <th class="col-lg-3"><%= time%></th>
                                            <th class="col-lg-3">Room <%= ID_Class%></th>
                                            <th class="col-lg-3">
                                                <%
                                                    int AccountID = ClassDetailDao.checkTraineeIDInClass(Course_ID, trainee.getIdaccount(), time_class.getId_time(), ID_Class);
                                                    if (AccountID == 0) {
                                                %>
                                                <form action="/YogaCenter/request" method="post">
                                                    <input type="hidden" name="trainee" value="<%=trainee.getIdaccount()%>">
                                                    <input type="hidden" name="id_course" value="<%=Course_ID%>">
                                                    <input type="hidden" name="id_room" value="<%=ID_Class%>">
                                                    <input type="hidden" name="option" value="<%=choice%>">
                                                    <input type="hidden" name="id_time" value="<%=time_class.getId_time()%>">
                                                    <button type="submit" name="action" value="traineeChooseClass">Choose</button>
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
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
