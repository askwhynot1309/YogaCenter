<%-- 
    Document   : traineeViewCourseBooked
    Created on : Jun 12, 2023, 2:43:03 PM
    Author     : ngmin
--%>

<%@page import="Dao.CourseDao"%>
<%@page import="Object.Account"%>
<%@page import="Object.Course"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="css/style.css"/>
        <title>My learning</title>
    </head>
    <body>
        <c:import url="header.jsp"></c:import>
        <%

            Account account = (Account) session.getAttribute("account");
            ArrayList<Course> courseList = CourseDao.getAllCourseByTraineeID(account.getIdaccount());
        %>
        <div class="container">
            <h2 style="text-align: center">My Learning</h2>
            <div class="row">
                <table style="border: solid 0.5px;" class="col">
                    <thead>
                        <tr style="border: solid 0.5px;">
                            <th class="col-lg-3">Course Name</th>
                            <th class="col-lg-3">Start Date</th>
                            <th class="col-lg-3">Slot</th>
                            <th class="col-lg-3">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (Course course : courseList) {
                        %>
                        <tr style="border: solid 0.5px;">
                            <th class="col-lg-3"><%= course.getName_course()%></th>
                            <th class="col-lg-3"><%= course.getDate_start()%></th>
                            <th class="col-lg-3"><%= course.getSlot() %></th>
                            <th class="col-lg-3"><a href="/YogaCenter/request?action=EditSchedule&courseID=<%=course.getIdCourse()%>">Edit Schedule</a></th>
                        </tr>
                        <%
                            }
                        %>

                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
