<%-- 
    Document   : traineeViewRequestChangeClass
    Created on : Jun 26, 2023, 2:58:53 PM
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
        <title>JSP Page</title>
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
                            <h4>Request to change subject classes</h4>

                            <div class="d-flex justify-content-center row">
                                <div class="col-md-10">
                                    <div class="rounded">
                                        <div class="table-responsive table-borderless">
                                            <form action="/YogaCenter/request" method="post">
                                                <button type="submit" name="action" value="traineeRequestChangeClass">Create Request</button>
                                            </form>
                                            <table class="table">
                                                <thead>
                                                    <tr style="background-color: #1CB0F6;">
                                                        <th>Course ID</th>
                                                        <th>From trainee</th>
                                                        <th>From class</th>
                                                        <th>To trainee</th>
                                                        <th>To class</th>
                                                        <th>Status</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <c:set var="trainee" value="${sessionScope.account}"/>
                                                <c:forEach var="mess" items="${requestScope.messRequest}">      
                                                    <c:if test="${mess.toUserID == trainee.idaccount && mess.status == 0}">
                                                        <tr class="cell-1 ${rowNumber % 2 == 0 ? 'alternate-row' : ''}">
                                                            <th>${mess.course_ID}</th>
                                                            <th>${mess.fromUserID}</th>
                                                            <th>Room ${mess.fromClassID}</th>
                                                            <th>${mess.toUserID}</th>
                                                            <th>Room ${mess.toClassID}</th>
                                                            <th>
                                                                <form action="/YogaCenter/request" method="post">
                                                                    <input type="hidden" name="txtCourseID">
                                                                    <input type="hidden" name="txtMessageID" value="${mess.messageID}">
                                                                    <input type="hidden" name="txtFromTraineeID" value="${mess.fromUserID}">
                                                                    <input type="hidden" name="txtFromClassID" value="${mess.fromClassID}">
                                                                    <input type="hidden" name="txtToUserID" value="${mess.toUserID}">
                                                                    <input type="hidden" name="txtToClassID" value="${mess.toClassID}">
                                                                    <button type="submit" name="action" value="approveRequest"  class="badge badge-success">Approve</button> | 
                                                                    <button type="submit" name="action" value="rejectRequest" class="badge badge-danger">Reject</button>
                                                                </form>
                                                            </th>
                                                        </tr>
                                                    </c:if>
                                                    <c:if test="${mess.toUserID == trainee.idaccount && mess.status != 0}">
                                                        <tr class="cell-1 ${rowNumber % 2 == 0 ? 'alternate-row' : ''}">
                                                            <th>${mess.course_ID}</th>
                                                            <th>${mess.fromUserID}</th>
                                                            <th>Class ${mess.fromClassID}</th>
                                                            <th>${mess.toUserID}</th>
                                                            <th>Class ${mess.toClassID}</th>

                                                            <c:choose>
                                                                <c:when test="${mess.status == 0}">
                                                                    <th class="badge badge-warning">wait for confirmation</th>
                                                                    </c:when>
                                                                    <c:when test="${mess.status == 1}">
                                                                    <th class="badge badge-primary">Approved</th>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                    <th class="badge badge-danger">Reject</th>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                        </tr>
                                                    </c:if>
                                                    <c:if test="${mess.fromUserID == trainee.idaccount}">
                                                        <tr class="cell-1 ${rowNumber % 2 == 0 ? 'alternate-row' : ''}">
                                                            <th>${mess.course_ID}</th>
                                                            <th>${mess.fromUserID}</th>
                                                            <th>Class ${mess.fromClassID}</th>
                                                            <th>${mess.toUserID}</th>
                                                            <th>Class ${mess.toClassID}</th>

                                                            <c:choose>
                                                                <c:when test="${mess.status == 0}">
                                                                    <th class="badge badge-warning">wait for confirmation</th>
                                                                    </c:when>
                                                                    <c:when test="${mess.status == 1}">
                                                                    <th class="badge badge-primary">Approved</th>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                    <th class="badge badge-danger">Reject</th>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                        </tr>
                                                    </c:if>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
