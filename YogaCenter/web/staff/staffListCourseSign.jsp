<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html style="overflow-y: scroll">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/admin/admin-employee-add.css">
        <link rel="stylesheet" href="css/staff/staff-user.css"/>
        <title>Staff Dashboard</title>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3" style="padding: 0; position: fixed">
                    <c:import url="staffMenu.jsp"/>
                </div>
                <div class="col-lg-9" style="margin-left: 300px">
                    <h2 style="display: flex; justify-content: center; margin-bottom: 20px; font-family: monospace;font-weight: 700; margin-top: 20px; text-transform: uppercase">Yoga Center Course List</h2>
                    <div style="display: flex; margin-left: 30%; margin-bottom: 2rem; margin-top: 2rem ">
                        <form action="/YogaCenter/request" method="POST" class="form-search">
                            <div class="group">
                                <svg class="icon-search" aria-hidden="true" viewBox="0 0 24 24"><g><path d="M21.53 20.47l-3.66-3.66C19.195 15.24 20 13.214 20 11c0-4.97-4.03-9-9-9s-9 4.03-9 9 4.03 9 9 9c2.215 0 4.24-.804 5.808-2.13l3.66 3.66c.147.146.34.22.53.22s.385-.073.53-.22c.295-.293.295-.767.002-1.06zM3.5 11c0-4.135 3.365-7.5 7.5-7.5s7.5 3.365 7.5 7.5-3.365 7.5-7.5 7.5-7.5-3.365-7.5-7.5z"></path></g></svg>
                                <input placeholder="Search by Name Course" type="text" name="txtsearch" value="${param.txtsearch}" class="input">
                                <input name="option" value="staffSearchCourseToSign" hidden="">
                                <c:set var="listLevel" value="${requestScope.listlevel}"/>
                                <c:if test="${listLevel != null && !listLevel.isEmpty()}">
                                    <select name="level" style="margin-left: 10px">
                                        <c:forEach var="level" items="${listLevel}">
                                            <option value="${level.getIdLevel()}">${level.getLevel_Name()}</option>
                                        </c:forEach>
                                    </select>
                                </c:if>
                                <c:if test="${listLevel == null}">
                                    <select name="level">
                                        <option value="0"></option>
                                    </select>
                                </c:if>
                                <button name="action" value="search" class="btn-search" style="margin-left: 10px">Search</button>
                            </div>
                        </form>
                    </div>
                    <c:set var="listcourse" value="${requestScope.listcourse}"/>
                    <c:set var="idaccount" value="${requestScope.key}"/>
                    <c:set var="nulllist" value="${requestScope.nonelist}"/>
                    <c:set var="success" value="${requestScope.success}"/>
                    <c:if test="${listcourse == null}">
                        <p style="text-align: center"><c:out value="${nulllist}"/></p>
                    </c:if>
                    <c:if test="${listcourse != null}">
                        <div class="course">
                            <c:forEach var="course" items="${listcourse}">
                                <div style="border: 2px solid black; float: left; margin-left: 10px; padding: 10px; border-radius: 10px; width: 260px;height: 350px; margin-bottom: 10px">
                                    <img src="img/${course.img_course}" width="100px" height="100px" style="margin-left: 30%">
                                    <div>
                                        <form action="/YogaCenter/request" method="POST">
                                            <p>Name of course : ${course.name_course}</p>
                                            <p>Fee of course : ${course.fee_course} đồng</p>
                                            <p>Date-start : ${course.date_start}</p>
                                            <input name="id" value="${course.idCourse}" hidden="">
                                            <c:if test="${idaccount != null}">
                                                <input name="key" value="${idaccount}" hidden="">
                                            </c:if>
                                            <button value="ButtonSignCourse" name="action" class="btn-search" style="margin-left: 25%">Sign in</button>
                                        </form>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
        <c:if test="${success != null}">
            <div class="notification-success">
                <div class="content">
                    <div class="title">Success</div>
                    <span>Sign course successfully !</span>
                </div>
                <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
            </div>
            <script>
                let notification = document.querySelector('.notification-success');
                notification.timeOut = setTimeout(() => notification.remove(), 5000);
            </script>
        </c:if>
    </body>
</html>
