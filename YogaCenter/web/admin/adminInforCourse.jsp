<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Admin Dashboard</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="css/admin/admin.css">
        <link rel="stylesheet" href="css/admin/admin-course-add.css">
    </head>

    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3">
                    <c:import url="adminMenu.jsp"></c:import>
                    </div>
                    <div class="col-lg-9">
                        <h2 style="display: flex; justify-content: center; margin-bottom: 10px; font-family: monospace;font-weight: 700; margin-top: 20px; text-transform: uppercase">Information of course</h2>
                    <c:set var="informationCourse" value="${requestScope.informationCourse}"/>
                    <c:set var="expired" value="${requestScope.expired}"/>
                    <c:set var="success" value="${requestScope.success}"/>
                    <c:if test="${informationCourse != null}">
                        <form action="/YogaCenter/request" method="POST" enctype="multipart/form-data" style="height: 100vh; padding: 20px; margin-top: 1rem">
                            <div style="float: left; width: 700px">
                                <div style="display: flex; align-items: center; justify-content: space-between">
                                    <p>Name of course : <input type="text" name="course_name" value="${informationCourse.name_course}" class="input-course"></p>
                                    <p>Fee of course : <input type="number" name="course_fee" value="${informationCourse.fee_course}" class="input-course"></p>
                                </div>
                                <div style="display: flex; align-items: center; justify-content: space-between">
                                    <p>Start-date of course : <input type="date" name="course_start" value="${informationCourse.date_start}" class="input-course"></p>
                                    <input name="id" value="${informationCourse.idCourse}" hidden="">
                                    <p>Slots : <input type="number" name="slot" value="${informationCourse.slot}" class="input-course"></p>
                                </div>
                                <p>Detail of course : </p><textarea name="course_description">${informationCourse.description}</textarea>
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
                            div class="notification">
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
            <style>
                html{
                    overflow-y: hidden;
                    height: 100vh;
                }
                .input-course {
                    font-family: monospace;
                    max-width: 190px;
                    outline: none;
                    border: 1px solid #dadada;
                    padding: 10px;
                    border-radius: 5px;
                    background-color: #f3f7fe;
                    transition: .3s;
                    color: #3b82f6;
                }

                .input-course:focus {
                    border: 1px solid #3b82f6;
                    box-shadow: 0 0 0 4px #3b83f65f;
                }

                input[type ="file"] {
                    display: inline-block;
                    position: relative;
                    padding: 10px 25px;
                    background-color: #9e9ea7;
                    color: white;
                    font-family: sans-serif;
                    text-decoration: none;
                    font-size: 0.9em;
                    text-align: center;
                    text-indent: 15px;
                    border: none;
                }

                input[type ="file"]:hover {
                    background-color: #9e9ea7;
                    color: white;
                }

                input[type ="file"]:before, input[type ="file"]:after {
                    content: ' ';
                    display: block;
                    position: absolute;
                    left: 15px;
                    top: 52%;
                }

                input[type ="file"]:before {
                    width: 10px;
                    height: 2px;
                    border-style: solid;
                    border-width: 0 2px 2px;
                }

                input[type ="file"]:after {
                    width: 0;
                    height: 0;
                    margin-left: 3px;
                    margin-top: -7px;
                    border-style: solid;
                    border-width: 4px 4px 0 4px;
                    border-color: transparent;
                    border-top-color: inherit;
                    animation: downloadArrow 1s linear infinite;
                    animation-play-state: paused;
                }

                input[type ="file"]:hover:before {
                    border-color: #cdefbd;
                }

                input[type ="file"]:hover:after {
                    border-top-color: #cdefbd;
                    animation-play-state: running;
                }

                @keyframes downloadArrow {
                    0% {
                        margin-top: -7px;
                        opacity: 1;
                    }

                    0.001% {
                        margin-top: -15px;
                        opacity: 0.4;
                    }

                    50% {
                        opacity: 1;
                    }

                    100% {
                        margin-top: 0;
                        opacity: 0.4;
                    }
                }

                .btn-update {
                    padding: 12.5px 30px;
                    border: 0;
                    border-radius: 100px;
                    background-color: #2ba8fb;
                    color: #ffffff;
                    font-weight: Bold;
                    transition: all 0.5s;
                    -webkit-transition: all 0.5s;
                    margin-left: 45%
                }

                .btn-update:hover {
                    background-color: #6fc5ff;
                    box-shadow: 0 0 20px #6fc5ff50;
                    transform: scale(1.1);
                }

                .btn-update:active {
                    background-color: #3d94cf;
                    transition: all 0.25s;
                    -webkit-transition: all 0.25s;
                    box-shadow: none;
                    transform: scale(0.98);
                }
            </style>
            <script type="text/javascript" <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
            <script src="https://cdn.ckeditor.com/4.21.0/standard/ckeditor.js"></script>
            <script>
                        CKEDITOR.replace('course_description');
            </script>
    </body>
</html>
