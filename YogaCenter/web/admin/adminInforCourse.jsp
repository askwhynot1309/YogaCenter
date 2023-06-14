<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="overflow-y: scroll">

    <head>
        <title>Admin Dashboard</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="css/admin/admin.css">
        <link rel="stylesheet" href="css/admin/admin-course-add.css">
        <link rel="stylesheet" href="css/admin/admin-inf-course.css">
    </head>

    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3" style="padding: 0;position: fixed">
                    <c:import url="adminMenu.jsp"></c:import>
                    </div>
                    <div class="col-lg-9" style="margin-left: 250px">
                        <h2 style="display: flex; justify-content: center; margin-bottom: 10px; font-family: monospace;font-weight: 700; margin-top: 20px; text-transform: uppercase">Information of course</h2>
                    <c:set var="informationCourse" value="${requestScope.informationCourse}"/>
                    <c:set var="expired" value="${requestScope.expired}"/>
                    <c:set var="success" value="${requestScope.success}"/>
                    <c:if test="${informationCourse != null}">
                        <form action="/YogaCenter/request" method="POST" enctype="multipart/form-data" style="padding: 20px; margin-top: 1rem">
                            <div style="float: left; width: 700px">
                                <div style="display: flex; align-items: center; justify-content: space-between">
                                    <p>Name of course : <input type="text" name="course_name" value="${informationCourse.name_course}" class="input-course" readonly=""></p>
                                    <p>Fee of course : <input type="number" name="course_fee" value="${informationCourse.fee_course}" class="input-course"></p>
                                </div>
                                <div style="display: flex; align-items: center; justify-content: space-between">
                                    <p>Start-date of course : <input type="date" name="course_start" value="${informationCourse.date_start}" class="input-course"></p>
                                    <input name="id" value="${informationCourse.idCourse}" hidden="">
                                    <p>Slots : <input type="number" name="slot" value="${informationCourse.slot}" class="input-course"></p>
                                </div>
                                <p>Detail of course : </p><textarea name="course_description">${informationCourse.description}</textarea>
                                <p>Detail of course : </p><textarea name="course_summary">${informationCourse.description}</textarea>
                                <p>Detail of course : </p><textarea name="course_learnt">${informationCourse.description}</textarea>
                                <c:set var="listLevel" value="${requestScope.listLevel}"/>
                                <c:if test="${listLevel != null && !listLevel.isEmpty()}">
                                    <p style="margin-top: 10px">Level : <select name="level" class="input-course">
                                            <option value="0"></option>
                                            <c:forEach var="level" items="${listLevel}">
                                                <c:set var="isSelected" value="${informationCourse.level == level.getIdLevel()}"/>
                                                <option value="${level.getIdLevel()}" <c:if test="${isSelected}">selected="selected"</c:if>>${level.getLevel_Name()}</option>
                                            </c:forEach>
                                        </select></p>
                                    </c:if>
                                <button name="action" value="ButtonChange" class="btn-update">Change information</button>
                            </div>
                            <div style="float: right; height: 540px">
                                <div style="width: 350px; border: 5px solid black; padding: 10px">
                                    <img src="img/${informationCourse.img_course}" height="200px" width="200px" id="img" style="margin-left: 20%"><br><br>
                                    <input type="file" name="img" id="img-input">
                                    <input name="oldimg" value="${informationCourse.img_course}" hidden="">
                                </div>
                            </div>
                        </form>  
                        <c:if test="${expired != null}">
                            <div class="notification">
                            <div class="content">
                                <div class="title">Error</div>
                                <span>The start date is over.</span>
                            </div>
                            <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
                        </div>
                        <script>
                            let notification = document.querySelector('.notification');
                            notification.timeOut = setTimeout(() => notification.remove(), 5000);
                        </script>
                    </c:if>

                    <c:if test="${success != null}">
                        <div class="notification-success">
                            <div class="content">
                                <div class="title">Success</div>
                                <span>Update course successfully.</span>
                            </div>
                            <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
                        </div>
                        <script>
                            let notification = document.querySelector('.notification-success');
                            notification.timeOut = setTimeout(() => notification.remove(), 5000);
                        </script>
                    </c:if>
                    <script>
                        const inputFile = document.getElementById('img-input');
                        const image = document.getElementById('img');
                        inputFile.addEventListener('change', function () {
                            if (inputFile.files && inputFile.files[0]) {
                                const reader = new FileReader();
                                reader.onload = function (e) {
                                    image.src = e.target.result;
                                };
                                reader.readAsDataURL(inputFile.files[0]);
                            }
                        });
                    </script>
                </c:if>
            </div>
            <script type="text/javascript" <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
            <script src="https://cdn.ckeditor.com/4.21.0/standard/ckeditor.js"></script>
            <script>
                        CKEDITOR.replace('course_description');
                        CKEDITOR.replace('course_summary');
                        CKEDITOR.replace('course_learnt');
            </script>
    </body>
</html>
