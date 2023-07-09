<%-- 
    Document   : TraineeViewClassDetail
    Created on : Jun 18, 2023, 2:43:42 PM
    Author     : ngmin
--%>

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
        <title>Class Detail</title>
    </head>
    <body>
        <c:import url="header.jsp"></c:import>
            <div class="container">
                <h2 style="text-align: center">Class Details</h2>
                <div class="container mt-10">
                    <div class="d-flex justify-content-center row">
                        <div class="col-lg-12">
                        <c:set var="ListTrainee" value="${requestScope.ListTrainee}"/>
                        <c:set var="inforClass" value="${requestScope.InforClass}"/>
                        <c:if test="${inforClass != null}">
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
                                        <td style="padding: 20px">
                                            <a style="color: blue" href="/YogaCenter/request?action=inf&id=${inforClass.idaccount}&option=infEmployee" class="">${inforClass.account}</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 20px; font-weight: 700">Date : </td>
                                        <td style="padding: 20px">${inforClass.datestudy}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </c:if>
                        <h3 style="display: flex; margin-bottom: 20px; font-family: monospace;font-weight: 700; margin-top: 30px; text-transform: uppercase; background-color: #3b83f65f; color: #0071e2; padding: 10px">Trainees of the course</h3>
                        <c:if test="${ListTrainee == null}">
                            <p style="text-align: center; font-weight: 700">Do not have any trainees that learn this course !</p>
                        </c:if>
                        <c:if test="${ListTrainee != null}">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>Image</th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Phone</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="trainee" items="${ListTrainee}" varStatus="loop">
                                        <tr>
                                            <td>${loop.count}</td>
                                            <td>
                                                <c:if test="${not empty trainee.image}">
                                                    <img src="img/${trainee.image}" width="100px" height="100px">
                                                </c:if>
                                            </td>
                                            <td>${trainee.name}</td>
                                            <td>${trainee.email}</td>
                                            <td>${trainee.phone}</td>
                                        </tr>   
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>