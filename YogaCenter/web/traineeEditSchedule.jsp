<%-- 
    Document   : traineeEditSchedule.jsp
    Created on : Jun 14, 2023, 9:27:51 AM
    Author     : ngmin
--%>

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
        <%
            int Course_ID = Integer.parseInt(request.getParameter("courseID"));


        %>
        <div style="padding-top: 30px;" class="container">
            <div class="row">
                <table class="col-6">
                    <thead>
                        <tr>
                            <th class="col-lg-2">Trainer</th>
                            <th class="col-lg-2">Day</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%                            
                            HashMap<String, ArrayList<Integer>> hashChoise = ClassDetailDao.getChoiceWithAllTrainerInCourseID(Course_ID);
                            if (hashChoise != null) {
                                boolean isFirstRow = true;
                                for (Map.Entry<String, ArrayList<Integer>> entry : hashChoise.entrySet()) {
                                    String key = entry.getKey();
                                    ArrayList<Integer> listChoice = entry.getValue();

                                    for (Integer choice : listChoice) {
                        %>
                        <tr style="border-top: solid 0.5px">
                            <%if (isFirstRow) {
                            %>
                            <th style="border-right: solid 0.5px; vertical-align: top;" class="col-lg-2" rowspan="<%= listChoice.size()%>"><%= key%></th>
                                <%
                                        isFirstRow = false;
                                    }
                                %>
                            <th class="col-lg-2">
                                <%
                                    if (choice == 1) {
                                %>Monday - Wednesday - Friday<%
                                } else if (choice == 2) {
                                %>Tuesday - Thursday - Saturday<%
                                } else {
                                %>Sunday<%
                                %>
                            </th>
                        </tr>
                        <%                                    
                                        }
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
