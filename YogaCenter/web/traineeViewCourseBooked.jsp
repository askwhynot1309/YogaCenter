<%-- 
    Document   : traineeViewCourseBooked
    Created on : Jun 12, 2023, 2:43:03 PM
    Author     : ngmin
--%>

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
            ArrayList<Course> courseList = (ArrayList<Course>) request.getAttribute("courseList");
        %>
        <div class="our-classes">
            <h1>Our classes</h1>
            <div class="main-class">
                <%
                    Account account = (Account) session.getAttribute("account");

                    for (Course course : courseList) {

                %>

                <div class="inner-class">
                    <div>
                        <img style="width: 80%; height: 250px; object-fit: cover" src="<%= course.getImg_course()%>" alt=""/>
                    </div>
                    <div class="class-content">
                        <h2><%= course.getLevel()%></h2>
                        <p><%= course.getDescription()%></p>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </body>
</html>
