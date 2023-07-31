<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="overflow-y: scroll">

    <head>
        <title>Course Management</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="icon" type="image/x-icon" href="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png">
        <link rel="stylesheet" href="css/admin/admin.css">
        <link rel="stylesheet" href="css/admin/admin-course-add.css">
        <link rel="stylesheet" href="css/admin/admin-inf-course.css">
        <style>
            .input-course-name {
                font-family: monospace;
                width: 300px;
                font-size: 13px;
                outline: none;
                border: 1px solid #dadada;
                padding: 10px;
                border-radius: 5px;
                background-color: #f3f7fe;
                transition: .3s;
                color: #3b82f6;
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
            .message {
                box-shadow: var(--shadow-2), 0 0 0 100vw rgb(0 0 0 / 0.5);
                background: #fff;
                color: #222;
                border: 0;
                border-radius: 0.25rem;
                position: fixed;
                top: 50%;
                left: 50%;
                border-radius: 20px;
                transform: translate(-50%, -50%);
                padding: 20px;
                z-index: 10000;
            }

            .message::backdrop {
                background: rgb(0 0 0 / 0.5);
                opacity: 0;
            }
        </style>
    </head>

    <body>
        <c:set var="exist" value="${sessionScope.Admin}"/>
        <c:if test="${exist == null}">
            <div id="overlay" class="overlay"></div>
            <div class="message" id="message">
                <h3 style="text-align: center; color: red">Message</h3>
                <p>Your session is timeout. Back to login page to login again!</p>
                <div style=" text-align: center">
                    <a class="btn btn-primary" href="login.jsp">Login</a>
                </div>
            </div>
        </c:if>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3" style="padding: 0;position: fixed">
                    <c:import url="adminMenu.jsp"></c:import>
                    </div>
                    <div class="col-lg-9" style="margin-left: 250px">
                        <a href="/YogaCenter/managecourse" class="btn">
                            <svg height="16" width="16" xmlns="http://www.w3.org/2000/svg" version="1.1" viewBox="0 0 1024 1024"><path d="M874.690416 495.52477c0 11.2973-9.168824 20.466124-20.466124 20.466124l-604.773963 0 188.083679 188.083679c7.992021 7.992021 7.992021 20.947078 0 28.939099-4.001127 3.990894-9.240455 5.996574-14.46955 5.996574-5.239328 0-10.478655-1.995447-14.479783-5.996574l-223.00912-223.00912c-3.837398-3.837398-5.996574-9.046027-5.996574-14.46955 0-5.433756 2.159176-10.632151 5.996574-14.46955l223.019353-223.029586c7.992021-7.992021 20.957311-7.992021 28.949332 0 7.992021 8.002254 7.992021 20.957311 0 28.949332l-188.073446 188.073446 604.753497 0C865.521592 475.058646 874.690416 484.217237 874.690416 495.52477z"></path></svg>
                            <span>Back</span>
                        </a>
                        <h2 style="display: flex; justify-content: center; margin-bottom: 10px; font-family: monospace;font-weight: 700; margin-top: 20px; text-transform: uppercase">Information of course</h2>
                    <c:set var="informationCourse" value="${requestScope.informationCourse}"/>
                    <c:set var="expired" value="${requestScope.expired}"/>
                    <c:set var="stringPrice" value="${requestScope.stringPrice}"/>
                    <c:set var="success" value="${requestScope.success}"/>
                    <c:set var="noimage" value="${requestScope.noimage}"/>
                    <c:if test="${informationCourse != null}">
                        <form action="/YogaCenter/request" method="POST" enctype="multipart/form-data" style="padding: 20px; margin-top: 1rem">
                            <div style="float: left; width: 700px">
                                <div style="display: flex; align-items: center; justify-content: space-between">
                                    <p>Name : <input type="text" name="course_name" value="${informationCourse.name_course}" class="input-course-name" readonly=""></p>
                                    <p>Fee of course : <input type="number" name="course_fee" value="${stringPrice}" class="input-course"></p>
                                </div>
                                <div style="display: flex; align-items: center; justify-content: space-between">
                                    <p>Start-date of course : <input value="${informationCourse.date_start}" class="input-course" readonly=""></p>
                                    <input name="id" value="${informationCourse.idCourse}" hidden="">
                                    <p>Slots : <input type="number" name="slot" value="${informationCourse.slot}" class="input-course"></p>
                                </div>
                                <div style="display: flex; align-items: center; justify-content: space-between">
                                    <p>Time :
                                        <c:if test="${informationCourse.idtime == 1}">
                                            9h - 11h
                                        </c:if>
                                        <c:if test="${informationCourse.idtime == 2}">
                                            13h - 15h
                                        </c:if>
                                        <c:if test="${informationCourse.idtime == 3}">
                                            16h - 18h
                                        </c:if>
                                        <c:if test="${informationCourse.idtime == 4}">
                                            19h - 21h
                                        </c:if>
                                    </p>
                                    <p>Time slot :
                                        <c:if test="${informationCourse.choice == 1}">
                                            Monday - Wednesday - Friday 
                                        </c:if>
                                        <c:if test="${informationCourse.choice == 2}">
                                            Tuesday - Thursday - Saturday 
                                        </c:if>
                                        <c:if test="${informationCourse.choice == 3}">
                                            Sunday
                                        </c:if>
                                    </p>
                                </div>
                                <p>Level : ${informationCourse.name_level}</p>
                                <p>Detail of course : </p><textarea name="course_description">${informationCourse.description}</textarea>
                                <p>Summary of course : </p><textarea name="course_summary">${informationCourse.summary}</textarea>
                                <p>Objective of course : </p><textarea name="course_object">${informationCourse.learnt}</textarea>
                                <button name="action" value="ButtonChange" class="btn-update" style="margin-top: 20px; margin-bottom: 20px">Change information</button>
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
                            CKEDITOR.replace('course_object');
                </script>
                </body>
                <c:if test="${noimage != null}">
                    <div class="notification">
                        <div class="content">
                            <div class="title">Error</div>
                            <span>Image of course does not empty !</span>
                        </div>
                        <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
                    </div>
                    <script>
                        let notification = document.querySelector('.notification');
                        notification.timeOut = setTimeout(() => notification.remove(), 5000);
                    </script>
                </c:if> 
                </html>
