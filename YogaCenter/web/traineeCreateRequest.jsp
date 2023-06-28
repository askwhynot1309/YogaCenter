<%-- 
    Document   : traineeCreateRequest
    Created on : Jun 27, 2023, 2:27:02 PM
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
        <title>Create Request</title>
    </head>
    <body>
        <c:import url="header.jsp"></c:import>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-2" style="margin-right: 50px; padding: 0;">
                    <c:import url="traineeClassMenu.jsp"></c:import>
                    </div>

                    <div class="col-lg-9" style="padding: 0">
                        <div class="container">
                        <c:set var="overdue" value="${requestScope.overdue}"></c:set>
                        <c:choose>
                            <c:when test="${overdue != null}">
                                <c:set var="startDate" value="${requestScope.startDate}"></c:set>
                                <c:set var="endDate" value="${requestScope.endDate}"></c:set>
                                <c:set var="courseList" value="${requestScope.courseList}"></c:set>
                                    <h2 style="text-align: center;">Request to change class</h2>
                                    <h4 style="text-align: center; color: red;">Starting date: ${startDate}. Due date: before ${endDate}</h4>

                                <div class="container mt-5">
                                    <div class="d-flex justify-content-center row">
                                        <div class="col-md-10">
                                            <div class="rounded">
                                                <div class="table-responsive table-borderless">
                                                    <table class="table" style="border: solid 1px;">
                                                        <form action="/YogaCenter/request" method="post">                                                            
                                                            <tr>
                                                                <th>Class</th>
                                                                <th>
                                                                    <select name="course" id="course">
                                                                        <c:forEach var="course" items="${requestScope.courseList}">
                                                                            <option value="${course.idCourse}">${course.name_course}</option>
                                                                        </c:forEach>                                                                        
                                                                    </select>
                                                                </th>
                                                            </tr>
                                                            <tr>
                                                                <th>To Trainee ID</th>
                                                                <th>
                                                                    Trainee No. <input type="number" id="txtToTraineeID" name="txtToTraineeID" required="">
                                                                    <input type="checkbox" id="check">
                                                                </th>
                                                            </tr>
                                                        </form>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:when>
                            <c:when test="${overdue == null}">
                                <div style="text-align: center">
                                    <h4 style="color: red">
                                        <span>${overdue}</span>
                                    </h4>
                                </div>
                            </c:when>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </body>

    <script>
        var checkbox = document.getElementById('check');
        var txtCourseID = document.getElementById("course");

        checkbox.addEventListener('change', function () {
            if (this.checked) {
                var ID_Course = txtCourseID.value;

                if (!traineeID) {
                    alert('Trainee No. is required.');
                    this.checked = false; // Uncheck the checkbox
                    return;
                }

                var form = document.createElement('form');
                form.method = 'POST';
                form.action = '/YogaCenter/request';

                var courseID = document.createElement('input');
                action.type = 'hidden';
                courseID.name = 'courseID';
                courseID.value = ID_Course;
                
                
                var action = document.createElement('input');
                action.type = 'hidden';
                action.name = 'action';
                action.value = 'checkTrainee';
                
                form.appendChild(courseID);
                form.appendChild(action);
                
                document.body.appendChild(form);
                form.submit();
            }
        });
    </script>
</html>
