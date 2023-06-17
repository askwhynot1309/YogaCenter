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
    <body>
        <c:import url="header.jsp"></c:import>
            <div style="padding-top: 30px;" class="container">
                <h2 style="text-align: center">Class Schedule</h2>
                <div style="display: flex; justify-content: center" class="row">
                    <table class="col-12">
                        <thead>
                            <tr>
                                <th class="col-lg-3">Trainer</th>
                                <th class="col-lg-3">Day</th>
                                <th class="col-lg-3">Time</th>
                                <th class="col-lg-3">Room</th>
                                <th class="col-lg-3">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%
                            int Course_ID = Integer.parseInt(request.getParameter("courseID"));
                            HashMap<Integer, ArrayList<Integer>> hashChoise = ClassDetailDao.getChoiceWithAllTrainerInCourseID(Course_ID);
                            Account trainee = (Account)session.getAttribute("account");
                            if (hashChoise != null) {
                                boolean isFirstRow = true;
                                for (Map.Entry<Integer, ArrayList<Integer>> entry : hashChoise.entrySet()) {
                                    Integer key = entry.getKey();
                                    ArrayList<Integer> listChoice = entry.getValue();

                                    for (Integer choice : listChoice) {
                                        String trainerName = "";
                                        Time time_class = null;
                                        int ID_Class = 0;
                                        ArrayList<Account> accountList = AccountDao.getAllTrainer();
                                        for (Account account : accountList) {
                                            if (key == account.getIdaccount()) {
                                                trainerName = account.getName();
                                                time_class = TimeDao.getTimeByTrainerAndChoice(Course_ID, key, choice);
                                                ID_Class = ClassDetailDao.getIDClassByTrainerCourseChoiseTime(key, Course_ID, choice, time_class.getId_time());
                                            }
                                        }
                        %>
                        <tr style="border-top: solid 0.5px">
                            <%if (isFirstRow) {
                            %>
                            <th style="border-right: solid 0.5px; vertical-align: top;" class="col-lg-3" rowspan="<%= listChoice.size()%>"><%= trainerName%></th>
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
                            <th class="col-lg-3"><%=time_class.getTime()%></th>
                            <th class="col-lg-3">Room <%= ID_Class %></th>
                            <th class="col-lg-3">
                                <form action="/YogaCenter/request" method="post">
                                    <input type="hidden" name="trainee" value="<%=trainee.getIdaccount()%>">
                                    <input type="hidden" name="id_course" value="<%=Course_ID%>">
                                    <input type="hidden" name="id_room" value="<%=ID_Class%>">
                                    <input type="hidden" name="option" value="<%=choice%>">
                                    <input type="hidden" name="id_time" value="<%=time_class.getId_time()%>">
                                    <button type="submit" name="action" value="traineeChooseClass">Choose</button>
                                </form>
                            </th>
                        </tr>
                        <%

                                    }
                                    isFirstRow = true;
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
