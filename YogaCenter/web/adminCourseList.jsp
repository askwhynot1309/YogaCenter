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
                    <h2 style="display: flex; justify-content: center; margin-bottom: 20px;">Yoga Center Course List</h2>
                    <div style="display: flex; margin-left: 30%; margin-bottom: 2rem; margin-top: 2rem">
                        <form action="/YogaCenter/request" method="POST">
                            <input type="text" name="txtsearch" value="${param.txtsearch}" style="width: 400px"/>
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
                            <button name="action" value="search">Tìm kiếm</button>
                        </form>

                    </div>
                    <button id="addCourseButton" style="margin-bottom: 10px">Add New Course</button>
                    <c:set var="listCourse" value="${requestScope.listCourse}"/>
                    <c:set var="nulllist" value="${requestScope.nulllist}"/>
                    <c:set var="blank" value="${requestScope.blank}"/>
                    <c:set var="expired" value="${requestScope.expired}"/>
                    <c:set var="success" value="${requestScope.success}"/>
                    <c:if test="${listCourse == null}">
                        <p style="text-align: center"><c:out value="${nulllist}"/></p>
                    </c:if>
                    <div id="overlay" class="overlay hidden"></div>

                    <div id="courseForm" class="hidden">
                        <div id="closeButton" style="display: flex; float: right; cursor: pointer; width: 30px;height: 30px">&#10006;</div>
                        <div style="display: block;width: 100%">
                            <h3 style="text-align: center;margin-top: 30px">Thêm khoá học</h3>
                            <form action="/YogaCenter/request" method="POST" enctype="multipart/form-data">
                                <p>Tên khoá học : <input type="text" name="course_name" value="${param.course_name}" required=""></p>
                                <p>Hình : <input type="file" name="course_img"></p>
                                <p>Giá khoá học : <input type="number" name="course_fee" value="${param.course_fee}" required=""></p>
                                <p>Ngày bắt đầu : <input type="date" name="course_start" value="${param.course_start}" required=""></p>
                                <p>Số slots : <input type="number" name="slot" value="${param.slot}" required=""></p>
                                <p>Thông tin chi tiết : <textarea name="course_description" value="${param.course_description}" style="width: 400px;height: 100px"></textarea></p>
                                    <c:if test="${listLevel != null && !listLevel.isEmpty()}">
                                    <p>Level : <select name="level">
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
                                <button name="action" value="Add">Thêm</button>
                            </form>
                        </div>
                        <br>
                    </div>
                    <c:if test="${listCourse != null && !listCourse.isEmpty()}">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>STT</th>
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
                                                    <button value="comfirm" name="action">Xác nhận</button>
                                                </form>
                                            </c:if>
                                            <c:if test="${course.status == 1}">
                                                <form action="/YogaCenter/request" method="POST">
                                                    <span>Hoạt động</span>&ensp; <input type="radio" name="status" value="0">
                                                    <span>Không hoạt động</span>&ensp; <input type="radio" name="status" value="1" checked="">
                                                    <input name="id" value="${course.idCourse}" hidden="">
                                                    <input name="option" value="courseChange" hidden="">
                                                    <button value="comfirm" name="action">Xác nhận</button>
                                                </form>
                                            </c:if>
                                        </td>
                                        <td><a href="/YogaCenter/request?action=inf&id=${course.idCourse}" class="btn btn-primary">Thông tin chi tiết</a></td>
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
            padding: 5px;
            z-index: 10000;
        }
        #courseForm input{
            font-size: 15px;
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