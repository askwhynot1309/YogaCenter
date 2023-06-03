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
                    <h2 style="display: flex; justify-content: center; margin-bottom: 20px;">Thông tin cụ thể khoá học</h2>
                    <c:set var="informationCourse" value="${requestScope.informationCourse}"/>
                    <c:set var="expired" value="${requestScope.expired}"/>
                    <c:set var="success" value="${requestScope.success}"/>
                    <c:if test="${informationCourse != null}">
                        <form action="/YogaCenter/request" method="POST" enctype="multipart/form-data" style="height: 100%; padding: 20px; position: relative; margin-top: 5rem">
                            <div style="float: left">
                                <p>Tên khoá học : <input type="text" name="course_name" value="${informationCourse.name_course}"></p>
                                <p>Giá khoá học : <input type="number" name="course_fee" value="${informationCourse.fee_course}"> đồng</p>
                                <p>Bắt đầu khoá học : <input type="date" name="course_start" value="${informationCourse.date_start}"></p>
                                <input name="id" value="${informationCourse.idCourse}" hidden="">
                                <p>Số slots : <input type="number" name="slot" value="${informationCourse.slot}"></p>
                                <p>Thông tin chi tiết : <textarea name="course_description">${informationCourse.description}</textarea></p>
                                    <c:set var="listLevel" value="${requestScope.listLevel}"/>
                                    <c:if test="${listLevel != null && !listLevel.isEmpty()}">
                                    <p><select name="level">
                                            <option value="0"></option>
                                            <c:forEach var="level" items="${listLevel}">
                                                <c:set var="isSelected" value="${informationCourse.level == level.getIdLevel()}"/>
                                                <option value="${level.getIdLevel()}" <c:if test="${isSelected}">selected="selected"</c:if>>${level.getLevel_Name()}</option>
                                            </c:forEach>
                                        </select></p>
                                    </c:if>
                            </div>
                            <div style="float: right">
                                Hình: <img src="img/${informationCourse.img_course}" height="100px" width="100px" id="img"><br><br>
                                <input type="file" name="img" id="img-input">
                                <input name="oldimg" value="${informationCourse.img_course}" hidden="">
                            </div>

                            <button name="action" value="ButtonChange" style="position: absolute; bottom: 50%">Thay đổi thông tin</button>
                        </form>             
                    </c:if>
                </div>
                </body>

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
                </html>
