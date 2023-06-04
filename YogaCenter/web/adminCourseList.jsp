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
                    <h2 style="display: flex; justify-content: center; margin-bottom: 20px; font-family: monospace;font-weight: 700; margin-top: 20px; text-transform: uppercase">Yoga Center Course List</h2>
                    <div style="display: flex; margin-left: 30%; margin-bottom: 2rem; margin-top: 2rem">
                        <form action="/YogaCenter/request" method="POST" class="form-search">
                            <div class="group">
                                <svg class="icon-search" aria-hidden="true" viewBox="0 0 24 24"><g><path d="M21.53 20.47l-3.66-3.66C19.195 15.24 20 13.214 20 11c0-4.97-4.03-9-9-9s-9 4.03-9 9 4.03 9 9 9c2.215 0 4.24-.804 5.808-2.13l3.66 3.66c.147.146.34.22.53.22s.385-.073.53-.22c.295-.293.295-.767.002-1.06zM3.5 11c0-4.135 3.365-7.5 7.5-7.5s7.5 3.365 7.5 7.5-3.365 7.5-7.5 7.5-7.5-3.365-7.5-7.5z"></path></g></svg>
                                <input placeholder="Search by Name Course" type="text" name="txtsearch" value="${param.txtsearch}" class="input">
                                <input name="option" value="searchCourse" hidden="">
                                <c:set var="listLevel" value="${requestScope.listLevel}"/>
                                <c:if test="${listLevel != null && !listLevel.isEmpty()}">
                                    <select name="level">
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
                                <button name="action" value="search" class="btn-search">Tìm kiếm</button>
                            </div>
                        </form>
                    </div>
                    <button class="button" id="addCourseButton">
                        <span class="button__text">Add New Course</span>
                        <span class="button__icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" viewBox="0 0 24 24" stroke-width="2" stroke-linejoin="round" stroke-linecap="round" stroke="currentColor" height="24" fill="none" class="svg"><line y2="19" y1="5" x2="12" x1="12"></line><line y2="12" y1="12" x2="19" x1="5"></line></svg></span>
                    </button>
                    <c:set var="listCourse" value="${requestScope.listCourse}"/>
                    <c:set var="nulllist" value="${requestScope.nulllist}"/>
                    <c:set var="blank" value="${requestScope.blank}"/>
                    <c:set var="unlogical" value="${requestScope.unlogical}"/>
                    <c:set var="expired" value="${requestScope.expired}"/>
                    <c:set var="success" value="${requestScope.success}"/>
                    <c:if test="${listCourse == null}">
                        <p style="text-align: center"><c:out value="${nulllist}"/></p>
                    </c:if>
                    <div id="overlay" class="overlay hidden"></div>

                    <div id="courseForm" class="hidden">
                        <div id="closeButton" style="display: flex; float: right; cursor: pointer; width: 30px;height: 30px">&#10006;</div>
                        <div style="display: block; width: 500px">
                            <h3 style="text-align: center;margin-top: 30px">Thêm khoá học</h3>
                            <form action="/YogaCenter/request" method="POST" enctype="multipart/form-data">
                                <p>Tên khoá học : <input type="text" name="course_name" value="${param.course_name}" required="" class="input-course"></p>
                                <p>Hình : <input type="file" name="course_img"></p>
<<<<<<< Updated upstream
                                <p>Giá khoá học : <input type="number" name="course_fee" value="${param.course_fee}" required=""></p>
                                <p>Ngày bắt đầu : <input type="date" name="course_start" value="${param.course_start}" required=""></p>
                                <p>Ngày kết thúc : <input type="date" name="course_finish" value="${param.course_finish}" required=""></p>
                                <p>Thông tin chi tiết : <textarea name="course_description" value="${param.course_description}" style="width: 400px;height: 100px"></textarea></p>
                                    <c:if test="${listLevel != null && !listLevel.isEmpty()}">
                                    <p>Level : <select name="level">
=======
                                <p>Giá khoá học : <input type="number" name="course_fee" value="${param.course_fee}" required="" class="input-course"></p>
                                <p>Ngày bắt đầu : <input type="date" name="course_start" value="${param.course_start}" required="" class="input-course"></p>
                                <p>Số slots : <input type="number" name="slot" value="${param.slot}" required="" class="input-course"></p>
                                <p>Thông tin chi tiết :</p><textarea name="course_description" value="${param.course_description}" class="input-description"></textarea>
                                <c:if test="${listLevel != null && !listLevel.isEmpty()}">
                                    <p>Level : <select name="level" class="input-course">
>>>>>>> Stashed changes
                                            <option value="0"></option>
                                            <c:forEach var="level" items="${listLevel}">
                                                <option value="${level.getIdLevel()}">${level.getLevel_Name()}</option>
                                            </c:forEach>
                                        </select></p>
                                    </c:if>
                                    <c:if test="${listLevel == null}">
                                    <p>Level : <select name="level">
                                            <option value="0"></option>
                                        </select></p>
                                    </c:if>
                                <input name="course_status" value="0" hidden="">
                                <button name="action" value="Add" class="btn-add">Thêm</button>
                            </form>
                        </div>
                        <br>
                    </div>
                    <c:if test="${listCourse != null && !listCourse.isEmpty()}">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Tên khoá học</th>
                                    <th>Giá khoá học</th>
                                    <th>Tình trạng khoá học</th>
                                    <th>Thông tin chi tiết</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="course" items="${listCourse}" varStatus="loop">
                                    <tr>
                                        <td>${loop.count}</td>
                                        <td>${course.name_course}</td>
                                        <td>${course.fee_course} đồng</td>
                                        <td>
                                            <c:if test="${course.status == 0}">
                                                <form action="/YogaCenter/request" method="POST">
                                                    <span>Hoạt động</span>&ensp; <input type="radio" name="status" value="0" checked="">
                                                    <span>Không hoạt động</span>&ensp; <input type="radio" name="status" value="1">
                                                    <input name="id" value="${course.idCourse}" hidden="">
                                                    <input name="option" value="courseChange" hidden="">
                                                    <button value="comfirm" name="action" class="btn-search">Xác nhận</button>
                                                </form>
                                            </c:if>
                                            <c:if test="${course.status == 1}">
                                                <form action="/YogaCenter/request" method="POST">
                                                    <span>Hoạt động</span>&ensp; <input type="radio" name="status" value="0">
                                                    <span>Không hoạt động</span>&ensp; <input type="radio" name="status" value="1" checked="">
                                                    <input name="id" value="${course.idCourse}" hidden="">
                                                    <input name="option" value="courseChange" hidden="">
                                                    <button value="comfirm" name="action" class="btn-search">Xác nhận</button>
                                                </form>
                                            </c:if>
                                        </td>
                                        <td><a href="/YogaCenter/request?action=inf&id=${course.idCourse}&option=infCourse" class="btn btn-primary">Thông tin chi tiết</a></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                </div>
            </div>
        </div>

        <c:if test="${blank != null}">
            <script>
                alert("Vui lòng chọn level cho khoá học.");
            </script>
        </c:if> 
            
            <c:if test="${unlogical != null}">
                <script>
                    alert("Ngày bắt đầu phải trước ngày kết thúc.");
                </script>
            </c:if>

        <c:if test="${expired != null}">
            <script>
                alert("Ngày bắt đầu đã qua.");
            </script>
        </c:if>

        <c:if test="${success != null}">
            <script>
                alert("Tạo mới khoá học thành công.");
            </script>
        </c:if>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
    </body>

    <style>
        .hidden {
            display: none;
        }

        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 9999;
        }

        #courseForm {
            position: fixed;
            top: 50%;
            left: 50%;
            border-radius: 20px;
            transform: translate(-50%, -50%);
            background-color: white;
            padding: 20px;
            z-index: 10000;
        }
        #courseForm input{
            font-size: 15px;
        }
        .form-search{
            width: 500px;
        }
        .group {
            display: flex;
            justify-content: space-between;
            line-height: 28px;
            align-items: center;
            position: relative;
            max-width: 500px;
        }

        .input {
            height: 40px;
            line-height: 28px;
            padding: 0 1rem;
            padding-left: 2.5rem;
            border: 2px solid transparent;
            border-radius: 8px;
            outline: none;
            background-color: #f3f3f4;
            color: #0d0c22;
            transition: .3s ease;
        }

        .input::placeholder {
            color: #9e9ea7;
        }

        .input:focus, input:hover {
            outline: none;
            border-color: rgba(234,76,137,0.4);
            background-color: #fff;
            box-shadow: 0 0 0 4px rgb(234 76 137 / 10%);
        }

        .icon-search {
            position: absolute;
            left: 1rem;
            fill: #9e9ea7;
            width: 1rem;
            height: 1rem;
        }
        .button {
            position: relative;
            margin-bottom: 20px;
            width: 238px;
            height: 40px;
            cursor: pointer;
            display: flex;
            align-items: center;
            border: 1px solid #34974d;
            background-color: #3aa856;
        }

        .button, .button__icon, .button__text {
            transition: all 0.3s;
        }

        .button .button__text {
            transform: translateX(30px);
            color: #fff;
            font-weight: 600;
        }

        .button .button__icon {
            position: absolute;
            transform: translateX(190px);
            height: 100%;
            width: 40px;
            background-color: #34974d;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .button .svg {
            width: 30px;
            stroke: #fff;
        }

        .button:hover {
            background: #34974d;
        }

        .button:hover .button__text {
            color: transparent;
        }

        .button:hover .button__icon {
            width: 230px;
            transform: translateX(0);
        }

        .button:active .button__icon {
            background-color: #2e8644;
        }

        .button:active {
            border: 1px solid #2e8644;
        }
        .btn-search {
            width: 100px;
            height: 35px;
            appearance: button;
            background-color: #1899D6;
            border: solid transparent;
            border-radius: 16px;
            border-width: 0 0 4px;
            box-sizing: border-box;
            color: #FFFFFF;
            cursor: pointer;
            display: inline-block;
            font-size: 15px;
            font-weight: 500;
            letter-spacing: .8px;
            line-height: 20px;
            margin: 0;
            outline: none;
            overflow: visible;
            padding: 8px 10px;
            text-align: center;
            text-transform: uppercase;
            touch-action: manipulation;
            transform: translateZ(0);
            transition: filter .2s;
            user-select: none;
            -webkit-user-select: none;
            vertical-align: middle;
            white-space: nowrap;
        }

        .btn-search:after {
            background-clip: padding-box;
            background-color: #1CB0F6;
            border: solid transparent;
            border-radius: 16px;
            border-width: 0 0 4px;
            bottom: -4px;
            content: "";
            left: 0;
            position: absolute;
            right: 0;
            top: 0;
            z-index: -1;
        }

        .btn-search:main, button:focus {
            user-select: auto;
        }

        .btn-search:hover:not(:disabled) {
            filter: brightness(1.1);
        }

        .btn-search:disabled {
            cursor: auto;
        }

        .btn-search:active:after {
            border-width: 0 0 0px;
        }

        .btn-search:active {
            padding-bottom: 10px;
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
        .btn-add {
            margin-left: 40%;
            --clr-font-main: hsla(0 0% 20% / 100);
            --btn-bg-1: hsla(194 100% 69% / 1);
            --btn-bg-2: hsla(217 100% 56% / 1);
            --btn-bg-color: hsla(360 100% 100% / 1);
            --radii: 0.5em;
            cursor: pointer;
            padding: 0.9em 1.4em;
            min-width: 120px;
            min-height: 44px;
            font-size: var(--size, 1rem);
            font-family: "Segoe UI", system-ui, sans-serif;
            font-weight: 500;
            transition: 0.8s;
            background-size: 280% auto;
            background-image: linear-gradient(325deg, var(--btn-bg-2) 0%, var(--btn-bg-1) 55%, var(--btn-bg-2) 90%);
            border: none;
            border-radius: var(--radii);
            color: var(--btn-bg-color);
            box-shadow: 0px 0px 20px rgba(71, 184, 255, 0.5), 0px 5px 5px -1px rgba(58, 125, 233, 0.25), inset 4px 4px 8px rgba(175, 230, 255, 0.5), inset -4px -4px 8px rgba(19, 95, 216, 0.35);
        }

        .btn-add:hover {
            background-position: right top;
        }
        @media (prefers-reduced-motion: reduce) {
            .btn-add {
                transition: linear;
            }
        }
    </style>

    <script>
                var addCourseButton = document.getElementById("addCourseButton");
                var courseForm = document.getElementById("courseForm");
                var closeButton = document.getElementById("closeButton");
                var overlay = document.getElementById("overlay");

                addCourseButton.addEventListener("click", function () {
                    courseForm.classList.remove("hidden");
                    overlay.classList.remove("hidden");
                });

                closeButton.addEventListener("click", function () {
                    courseForm.classList.add("hidden");
                    overlay.classList.add("hidden");
                });

                overlay.addEventListener("click", function () {
                    courseForm.classList.add("hidden");
                    overlay.classList.add("hidden");
                });
    </script>

</html>