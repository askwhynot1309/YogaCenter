<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Admin Dashboard</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="admin.css">
    </head>

    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3">
                    <div class="sidebar">
                        <h3>Admin Dashboard</h3>
                        <ul>
                            <li>
                                <a href="/YogaCenter/request?action=AdminDashBoard">
                                    <i class="fas fa-user icon"></i>
                                    Admin DashBoard
                                </a>
                            </li>
                            <li>
                                <a href="/YogaCenter/request?action=ManageEmployee">
                                    <i class="fas fa-user icon"></i>
                                    Manage Trainer
                                </a>
                            </li>
                            <li>
                                <a href="/YogaCenter/request?action=ManageSchedule">
                                    <i class="fas fa-calendar-alt icon"></i>
                                    Manage Schedule
                                </a>
                            </li>
                            <li>
                                <a href="/YogaCenter/request?action=ManageUser">
                                    <i class="fas fa-users icon"></i>
                                    Manage User
                                </a>
                            </li>
                            <li>
                                <a href="/YogaCenter/request?action=adminCourseList">
                                    <i class="fas fa-book icon"></i>
                                    Course List
                                </a>
                            </li>
                        </ul>
                        <div class="divider"></div>
                        <h4>Settings</h4>
                        <ul>
                            <li>
                                <a href="/YogaCenter/request?action=Logout">
                                    <i class="fas fa-sign-out-alt icon"></i>
                                    Logout
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <h2 style="display: flex; justify-content: center; margin-bottom: 20px; font-family: monospace;font-weight: 700; margin-top: 20px; text-transform: uppercase">Thông tin cụ thể khoá học</h2>
                    <c:set var="informationCourse" value="${requestScope.informationCourse}"/>
                    <c:set var="unlogical" value="${requestScope.unlogical}"/>
                    <c:set var="expired" value="${requestScope.expired}"/>
                    <c:set var="success" value="${requestScope.success}"/>
                    <c:if test="${informationCourse != null}">
                        <form action="/YogaCenter/request" method="POST" enctype="multipart/form-data" style="height: 100%; padding: 20px; position: relative; margin-top: 5rem">
                            <div style="float: left">
                                <p>Tên khoá học : <input type="text" name="course_name" value="${informationCourse.name_course}" class="input-course"></p>
                                <p>Giá khoá học : <input type="number" name="course_fee" value="${informationCourse.fee_course}" class="input-course"> đồng</p>
                                <p>Bắt đầu khoá học : <input type="date" name="course_start" value="${informationCourse.date_start}" class="input-course"></p>
                                <input name="id" value="${informationCourse.idCourse}" hidden="">
<<<<<<< Updated upstream
                                <p>Kết thúc khoá học : <input type="date" name="course_finish" value="${informationCourse.date_finish}"></p>
                                <p>Thông tin chi tiết : <textarea name="course_description">${informationCourse.description}</textarea></p>
                                    <c:set var="listLevel" value="${requestScope.listLevel}"/>
                                    <c:if test="${listLevel != null && !listLevel.isEmpty()}">
                                    <p><select name="level">
=======
                                <p>Số slots : <input type="number" name="slot" value="${informationCourse.slot}" class="input-course"></p>
                                <p>Thông tin chi tiết : </p><textarea name="course_description" class="input-description">${informationCourse.description}</textarea>
                                <c:set var="listLevel" value="${requestScope.listLevel}"/>
                                <c:if test="${listLevel != null && !listLevel.isEmpty()}">
                                    <p>Level : <select name="level" class="input-course">
>>>>>>> Stashed changes
                                            <option value="0"></option>
                                            <c:forEach var="level" items="${listLevel}">
                                                <c:set var="isSelected" value="${informationCourse.level == level.getIdLevel()}"/>
                                                <option value="${level.getIdLevel()}" <c:if test="${isSelected}">selected="selected"</c:if>>${level.getLevel_Name()}</option>
                                            </c:forEach>
                                        </select></p>
                                    </c:if>
                            </div>
                            <div style="float: right; width: 350px; border: 5px solid black; padding: 10px">
                                <img src="img/${informationCourse.img_course}" height="200px" width="200px" id="img" style="margin-left: 20%"><br><br>
                                <input type="file" name="img" id="img-input">
                                <input name="oldimg" value="${informationCourse.img_course}" hidden="">
                            </div>

                            <button name="action" value="ButtonChange" class="btn-update">Thay đổi thông tin</button>
                        </form>  
                        <c:if test="${expired != null}">
                            <script>
                                alert("Ngày bắt đầu đã qua.");
                            </script>
                        </c:if>

                        <c:if test="${success != null}">
                            <script>
                                alert("Update khoá học thành công.");
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
<<<<<<< Updated upstream
                </body>
                <c:if test="${unlogical != null}">
                    <script>
                        alert("Ngày bắt đầu phải trước ngày kết thúc.");
                    </script>
                </c:if>
=======
                <style>
                    html{
                        overflow-y: hidden;
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
>>>>>>> Stashed changes

                    .input-course:focus {
                        border: 1px solid #3b82f6;
                        box-shadow: 0 0 0 4px #3b83f65f;
                    }
                    .input-description {
                        font-family: monospace;
                        width: 500px;
                        height: 150px;
                        outline: none;
                        border: 1px solid #dadada;
                        padding: 10px;
                        border-radius: 5px;
                        background-color: #f3f7fe;
                        transition: .3s;
                        color: #3b82f6;
                    }

                    .input-description:focus {
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
                        position: absolute;
                        bottom: 20%;
                        float: left;
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
                </body>
                </html>
