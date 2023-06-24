<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Admin Dashboard</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="icon" type="image/x-icon" href="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png">
        <link rel="stylesheet" href="css/staff/staff.css">
    </head>

    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3" style="padding: 0">
                    <c:import url="staffMenu.jsp"/>
                </div>
                <div class="col-lg-9">
                    <h2 style="display: flex; justify-content: center; margin-bottom: 50px; font-family: monospace;font-weight: 700; margin-top: 20px; text-transform: uppercase">Class Information</h2>
                    <c:set var="ListTrainee" value="${requestScope.ListTrainee}"/>
                    <c:set var="inforClass" value="${requestScope.InforClass}"/>
                    <c:set var="listAttendence" value="${requestScope.ListAttendence}"/>
                    <c:set var="currentDate" value="${requestScope.currentDate}"/>
                    <c:if test="${InforClass != null}">
                        <table class="table">
                            <tbody>
                                <tr>
                                    <td style="padding: 20px; font-weight: 700">Course Name : </td>
                                    <td style="padding: 20px">${inforClass.course}</td>
                                </tr>
                                <tr>
                                    <td style="padding: 20px; font-weight: 700">Room : </td>
                                    <td style="padding: 20px">${inforClass.class_name}</td>
                                </tr>
                                <tr>
                                    <td style="padding: 20px; font-weight: 700">Time : </td>
                                    <td style="padding: 20px">
                                        <c:if test="${inforClass.time == 1}">
                                            9h - 11h
                                        </c:if>
                                        <c:if test="${inforClass.time == 2}">
                                            13h - 15h
                                        </c:if>
                                        <c:if test="${inforClass.time == 3}">
                                            16h - 18h
                                        </c:if>
                                        <c:if test="${inforClass.time == 4}">
                                            19h - 21h
                                        </c:if>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 20px; font-weight: 700">Trainer : </td>
                                    <td style="padding: 20px">${inforClass.account}</td>
                                </tr>
                                <tr>
                                    <td style="padding: 20px; font-weight: 700">Date : </td>
                                    <td style="padding: 20px">${inforClass.date}</td>
                                </tr>
                            </tbody>
                        </table>
                    </c:if>
                    <h3 style="display: flex; margin-bottom: 20px; font-family: monospace;font-weight: 700; margin-top: 30px; text-transform: uppercase; background-color: #3b83f65f; color: #0071e2; padding: 10px">Trainees of the course</h3>
                    <c:if test="${ListTrainee == null}">
                        <p style="text-align: center; font-weight: 700">Do not have any trainees that learn this course !</p>
                    </c:if>
                    <c:if test="${ListTrainee != null}">
                        <table class="table" style="text-align: center">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Phone</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="trainee" items="${ListTrainee}" varStatus="loop">
                                    <tr>
                                        <td>${loop.count}</td>
                                        <td>${trainee.name}</td>
                                        <td>${trainee.email}</td>
                                        <td>${trainee.phone}</td>
                                        <td>
                                            <c:if test="${currentDate != null}">
                                                <c:if test="${listAttendence != null}">
                                                    <c:forEach var="attendence" items="${listAttendence}" >
                                                                <c:if test="${attendence.dateAttendence.after(currentDate) && trainee.idaccount == attendence.id_trainee}">
                                                                    <button class="btn btn-primary">Change class</button>
                                                                </c:if>
                                                                <c:if test="${attendence.dateAttendence.before(currentDate) && trainee.idaccount == attendence.id_trainee}">
                                                                    <c:if test="${attendence.status == 0}">
                                                                        <p style="color: red">Absent</p>
                                                                    </c:if>
                                                                    <c:if test="${attendence.status == 1}">
                                                                        <p style="color: green">Present</p>
                                                                    </c:if>
                                                                </c:if>
                                                    </c:forEach>
                                                </c:if>
                                            </c:if>
                                        </td>
                                    </tr>   
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                </div>
            </div>
        </div>
    </body>
</html>