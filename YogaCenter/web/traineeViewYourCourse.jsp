<%-- 
    Document   : traineeViewYourCourse
    Created on : Jun 21, 2023, 10:09:32 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
        <link rel="icon" type="image/x-icon" href="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png">
        <link rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="css/trainee/trainee-viewyourcourse.css"/>
        <link rel="stylesheet" href="css/trainee/trainee-add-message.css">
        <title>View Your Course</title>
        <style>
            .pagination a.active {
                background-color: #ccc;
                color: #fff;
            }
            .pagination ul li {
                display: inline-block;
                margin: 0 4px;
            }
            .pagination ul li a{
                display: inline-block;
                padding: 4px 8px;
                border: 1px solid #ccc;
                text-decoration: none;
            }
            .pagination a.active{
                background-color: #ccc;
                color: #fff;
            }
            .menu ul li:hover{
                background-color: wheat;
            }
            .menu{
                margin-bottom: 50px;
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
                top: 40%;
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
            a:hover{
                text-decoration: none;
            }
            .notificate{
                /*position: absolute;*/
                background: red;
                color: white;
                border-radius: 9999em;
                padding: 0% 2% !important;
                top: -100%;
                right: 0;
            }
        </style>
    </head>
    <c:import url="header.jsp"/>
    <body class="w3-light-grey">
        <c:set var="exist" value="${sessionScope.account}"/>
        <c:set var="requestList" value="${sessionScope.requestList}"></c:set>
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
        <c:set var="listCourseTrainee" value="${requestScope.listCourseTrainee}"/>
        <c:set var="current_date" value="${requestScope.current_date}"/>
        <c:set var="refund" value="${requestScope.refund}"/>
        <c:set var="cancel" value="${requestScope.cancel}"/>
        <c:set var="acc" value="${requestScope.accountTrainee}"/>

        <nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
            <div style="text-align: center" class="w3-container w3-row">
                    <div class="w3-col image">
                        <img src="img/${acc.image}" alt="image" class="w3-circle " style="width:150px; height: 150px; margin-right: 0px;">
                </div>
                <div class="w3-col w3-bar">
                    <br>
                    <span>Welcome <strong>${acc.name}</strong></span><br>
                </div>
            </div>
            <hr>
            <div class="w3-container">
                <h5>Dashboard</h5>
            </div>
            <div class="w3-bar-block">
                <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black"
                   onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>  Close</a>
                <a href="GeneralDashboard" class="w3-bar-item w3-button w3-padding"><i class="fa fa-users fa-fw"></i>  General</a>
                <a href="yourcourse" class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa fa-users fa-fw"></i>  My courses</a>
                <a href="information" class="w3-bar-item w3-button w3-padding"><i class="fa fa-eye fa-fw"></i>  Views</a>
                <a href="/YogaCenter/classbooking" class="w3-bar-item w3-button w3-padding"><i class="fas fa-calendar-alt icon"></i>  My learning
                    <c:if test="${requestList.size() > 0}">
                        <div class="w3-right notificate">${requestList.size()}</div>
                    </c:if>
                </a>
                <a href="/YogaCenter/purchase" class="w3-bar-item w3-button w3-padding"><i class="fa fa-history fa-fw"></i> Purchase History</a>
                <a href="/YogaCenter/request?action=ChangePassword" class="w3-bar-item w3-button w3-padding"><i class="fa fa-cog fa-fw"></i>  Settings</a><br><br>
                <a href="/YogaCenter/request?action=Logout" class="w3-bar-item w3-button w3-padding"><i class="fas fa-sign-out-alt icon"></i>Logout</a>
            </div>
        </nav>

        <div class="w3-main" style="margin-left:350px;margin-top:43px;">
            <div id="overlay" class="overlay hidden"></div>
            <div style="padding: 10px; color: black; background: #d0efe1; margin-top: 50px; margin-bottom: 20px">
                <h2 style="text-transform: uppercase; font-size: 900">Your course</h2>
            </div>
            <c:if test="${listCourseTrainee.size() == 0}">
                <h3 style="text-align: center; margin-bottom: 400px">You don't have any course.</h3>

            </c:if>
            <c:if test="${listCourseTrainee.size() > 0}">
                <div class="main" style="height: 1200px">
                    <c:forEach var="course" items="${listCourseTrainee}"  varStatus="status">
                        <div style="width: 100%; height: 250px; padding: 10px;  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); margin-bottom: 20px">
                            <div class="row">
                                <div class="col-lg-3">
                                    <p style="margin-bottom: 20px"><strong>Date-order : </strong>${course.dateorder}</p>
                                    <img src="img/${course.img}" height="150px" width="200px" style="border-radius: 10px">
                                </div>
                                <div class="col-lg-8" style="margin-top: 30px">
                                    <h5><strong>Course name : </strong>${course.name_course}</h5>
                                    <div class="row">
                                        <p class="col-lg-6"><strong>Course-start : </strong>${course.course_start}</p>
                                        <p class="col-lg-6"><strong>Level : </strong>${course.level}</p>
                                        <p class="col-lg-6"><strong>Slots : </strong>${course.slot}</p>
                                        <p class="col-lg-6"><strong>Course-fee : </strong>${course.fee_course} VNĐ</p>        
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-8">
                                            <a href="/YogaCenter/classbooking" class="btn btn-primary">View schedule</a>
                                        </div>
                                        <div class="col-lg-4">
                                            <div style=" align-items: center; justify-content: space-between">
                                                <a href="/YogaCenter/request?action=inf&option=getInforOfClass&id=${course.id_course}" class="btn btn-primary">View detail course</a>
                                                <c:if test="${course.status == 1}">
                                                    <c:if test="${current_date.before(course.course_start)}">
                                                        <button class="btn btn-primary open" data-dialog="dialog${status.index}">Cancel</button>
                                                        <dialog class="message" id="dialog${status.index}">
                                                            <h3 style="text-align: center; color: red">Warning</h3>
                                                            <p>If you cancel the course now, we will save the amount you paid in your account.</p>
                                                            <div style="display: flex; align-items: center; justify-content: space-between">
                                                                <form method="POST" action="/YogaCenter/request">
                                                                    <input name="id_course" value="${course.id_course}" hidden="">
                                                                    <input name="id_order" value="${course.id_order}" hidden="">
                                                                    <input name="course_fee" value="${course.fee_course}" hidden="">
                                                                    <input name="status" value="2" hidden="">
                                                                    <button class="btn btn-primary" name="action" value="Cancel">Cancel</button>
                                                                </form>
                                                                <button class="btn btn-primary btn-close" data-dialog="dialog${status.index}">Close</button>
                                                            </div>
                                                        </dialog>
                                                    </c:if>
                                                    <c:if test="${current_date.after(course.course_start)}">
                                                        <button class="btn btn-primary open" data-dialog="dialog${status.index}">Cancel</button>
                                                        <dialog class="message" id="dialog${status.index}">
                                                            <h3 style="text-align: center; color: red">Warning</h3>
                                                            <p>You are currently studying, if you cancel this course there will be no refund. Are you sure you want to cancel ?</p>
                                                            <div style="display: flex; align-items: center; justify-content: space-between">
                                                                <form method="POST" action="/YogaCenter/request">
                                                                    <input name="id_course" value="${course.id_course}" hidden="">
                                                                    <input name="id_order" value="${course.id_order}" hidden="">
                                                                    <input name="status" value="0" hidden="">
                                                                    <button class="btn btn-primary" name="action" value="Cancel">Cancel</button>
                                                                </form>
                                                                <button class="btn btn-primary btn-close" data-dialog="dialog${status.index}">Close</button>
                                                            </div>
                                                        </dialog>
                                                    </c:if>
                                                </c:if>
                                                <c:if test="${course.status == 0}">
                                                    <p style="color: red; width: 75px; margin-top: 10px"><i class="fa-solid fa-ban" style="color: #ea0606;"></i> Cancel</p>
                                                </c:if>
                                                <c:if test="${course.status == 2}">
                                                    <p style="color: yellowgreen; width: 75px; margin-top: 10px"><i class="fa-sharp fa-solid fa-reply" style="color: yellowgreen"></i> Refund</p>
                                                </c:if>
                                                <c:if test="${course.status == 3}">
                                                    <p style="color: brown; width: 150px; margin-top: 10px">Pending! Please complete order.</p>
                                                </c:if>
                                                <c:if test="${course.status == 4}">
                                                    <p style="color: green; width: 150px; margin-top: 10px">Finished!</p>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div>
                    <div class="pagination" style="display: flex; align-items: center; margin-bottom: 50px; justify-content: space-between">
                        <ul style="display: inline-block;list-style: none;margin: 0;padding: 0">
                            <li><a href="#" class="prev">Previous</a></li>
                            <li><a href="#" class="page active">1</a></li>
                            <li><a href="#" class="next">Next</a></li>
                        </ul>
                    </div>
                </div>
            </c:if>
        </div>
        <c:if test="${refund != null}">
            <div class="notification-success" style="z-index: 1000">
                <div class="content">
                    <div class="title">Success</div>
                    <span>Refund course successfully.</span>
                </div>
            </div>
            <script>
                let notification = document.querySelector('.notification-success');
                notification.timeOut = setTimeout(() => notification.remove(), 2000);
            </script>
        </c:if>
        <c:if test="${cancel != null}">
            <div class="notification-success" style="z-index: 1000">
                <div class="content">
                    <div class="title">Success</div>
                    <span>Cancel course successfully.</span>
                </div>
            </div>
            <script>
                let notification = document.querySelector('.notification-success');
                notification.timeOut = setTimeout(() => notification.remove(), 2000);
            </script>
        </c:if>
    </body>
    <script>
        const course = document.querySelector('.main');
        const pagination = document.querySelector('.pagination ul');
        const page = document.querySelector('.pagination ul li:nth-child(2)');

        const coursesPerPage = 4;
        let currentPage = 1;

        function displayCourses() {
            const startIndex = (currentPage - 1) * coursesPerPage;
            const endIndex = startIndex + coursesPerPage;
            const courses = Array.from(course.children);

            courses.forEach((course, index) => {
                if (index >= startIndex && index < endIndex) {
                    course.style.display = 'block';
                } else {
                    course.style.display = 'none';
                }
            });
        }

        function createPagination() {
            const products = Array.from(course.children);
            const pageCount = Math.ceil(products.length / coursesPerPage);

            for (let i = 2; i <= pageCount; i++) {
                const li = document.createElement('li');
                const link = document.createElement('a');
                link.href = '#';
                link.textContent = i;
                link.classList.add('page');
                if (i === currentPage) {
                    link.classList.add('active');
                }
                li.appendChild(link);
                pagination.insertBefore(li, pagination.lastElementChild);
            }
        }

        createPagination();
        displayCourses();

        pagination.addEventListener('click', e => {
            e.preventDefault();
            if (e.target.classList.contains('page')) {
                currentPage = parseInt(e.target.textContent);
                displayCourses();
                const currentLink = pagination.querySelector('.active');
                currentLink.classList.remove('active');
                e.target.classList.add('active');
            } else if (e.target.classList.contains('prev')) {
                if (currentPage > 1) {
                    currentPage--;
                    displayCourses();
                    const currentLink = pagination.querySelector('.active');
                    currentLink.classList.remove('active');
                    const prevLink = currentLink.parentNode.previousElementSibling.querySelector('a');
                    prevLink.classList.add('active');
                }
            } else if (e.target.classList.contains('next')) {
                const courses = Array.from(course.children);
                const pageCount = Math.ceil(courses.length / coursesPerPage);
                if (currentPage < pageCount) {
                    currentPage++;
                    displayCourses();
                    const currentLink = pagination.querySelector('.active');
                    currentLink.classList.remove('active');
                    const nextLink = currentLink.parentNode.nextElementSibling.querySelector('a');
                    nextLink.classList.add('active');
                }
            }
        });
    </script>
    <script>
        const openButtons = document.querySelectorAll(".open");
        const closeButtons = document.querySelectorAll(".btn-close");
        var overlay = document.getElementById("overlay");

        openButtons.forEach((button) => {
            button.addEventListener("click", () => {
                const dialogId = button.getAttribute("data-dialog");
                const dialog = document.getElementById(dialogId);

                if (dialog) {
                    dialog.showModal();
                    overlay.classList.remove("hidden");
                }
            });
        });

        closeButtons.forEach((button) => {
            button.addEventListener("click", () => {
                const dialogId = button.getAttribute("data-dialog");
                const dialog = document.getElementById(dialogId);

                if (dialog) {
                    dialog.setAttribute("closing", "");

                    dialog.addEventListener(
                            "animationend",
                            () => {
                        dialog.removeAttribute("closing");
                        dialog.close();
                    },
                            {once: true}
                    );
                    overlay.classList.add("hidden");
                }
            });
        });

    </script>
</html>
