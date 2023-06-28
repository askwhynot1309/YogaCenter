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
        <link rel="icon" type="image/x-icon" href="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png">
        <link rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="css/trainee/trainee-viewyourcourse.css"/>
        <link rel="stylesheet" href="css/trainee/trainee-add-message.css">
        <title>View Your Course</title>
    </head>
    <body>
        <c:import url="header.jsp"/>
        <c:set var="listCourseTrainee" value="${requestScope.listCourseTrainee}"/>
        <c:set var="slotPresent" value="${requestScope.slotPresent}"/>
        <c:set var="slotAbsent" value="${requestScope.slotAbsent}"/>
        <c:set var="current_date" value="${requestScope.current_date}"/>
        <c:set var="listCoursebyTrainee" value="${requestScope.listCoursebyTrainee}"/>
        <c:set var="refund" value="${requestScope.refund}"/>
        <c:set var="cancel" value="${requestScope.cancel}"/>
        <div class="container">
            <div id="overlay" class="overlay hidden"></div>
            <div style="padding: 10px; color: white; background: #00FF00; margin-top: 50px; margin-bottom: 20px">
                <h2 style="text-transform: uppercase; font-size: 700">Your course</h2>
            </div>
            <c:if test="${listCourseTrainee.size() == 0}">
                <h3 style="text-align: center; margin-bottom: 400px">You don't have any course.</h3>

            </c:if>
            <c:if test="${listCourseTrainee != null}">
                <c:forEach var="course" items="${listCourseTrainee}"  varStatus="status">
                    <div style="width: 100%; height: 220px; padding: 10px;  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); margin-bottom: 20px">
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
                                    <c:if test="${listCoursebyTrainee != null}">
                                        <c:forEach var="coursebyTrainee" items="${listCoursebyTrainee}">
                                            <c:if test="${coursebyTrainee.id_course == course.id_course && coursebyTrainee.status == 1}">
                                                <c:if test="${slotPresent.size() > 0 && slotAbsent.size() > 0}">
                                                    <c:forEach var="present" items="${slotPresent}">
                                                        <c:if test="${present.id_course == course.id_course}">
                                                            <p style="color: green" class="col-lg-6"><strong>Present : ${present.slot}/${course.slot}</strong></p>
                                                        </c:if>
                                                    </c:forEach>
                                                    <c:forEach var="absent" items="${slotAbsent}">
                                                        <c:if test="${absent.id_course == course.id_course}">
                                                            <p style="color: red" class="col-lg-6"><strong>Absent : ${absent.slot}/${course.slot}</strong></p>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:if>
                                                <c:if test="${slotPresent.size() == 0 && slotAbsent.size() == 0}">
                                                    <h5 style="font-size: 700" class="col-lg-12">NOT YET</h5>
                                                </c:if>
                                                <c:if test="${slotPresent.size() > 0 && slotAbsent.size() == 0}">
                                                    <c:forEach var="present" items="${slotPresent}">
                                                        <c:if test="${present.id_course == course.id_course}">
                                                            <p style="color: green" class="col-lg-6"><strong>Present : ${present.slot}/${course.slot}</strong></p>
                                                        </c:if>
                                                    </c:forEach>
                                                    <p style="color: red" class="col-lg-6"><strong>Absent : 0/${course.slot}</strong></p>
                                                </c:if> 
                                                <c:if test="${slotPresent.size() == 0 && slotAbsent.size() > 0}">
                                                    <p style="color: green" class="col-lg-6"><strong>Present : 0/${course.slot}</strong></p>
                                                    <c:forEach var="absent" items="${slotAbsent}">
                                                        <c:if test="${absent.id_course == course.id_course}">
                                                            <p style="color: red" class="col-lg-6"><strong>Absent : ${absent.slot}/${course.slot}</strong></p>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:if>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>
                                </div>
                                <div class="row">
                                    <div class="col-lg-8">
                                        <a href="/YogaCenter/classbooking" class="btn btn-primary">View schedule</a>
                                    </div>
                                    <div class="col-lg-4">
                                        <div style="display: flex; align-items: center; justify-content: space-between">
                                            <a href="/YogaCenter/request?action=inf&option=viewmore&id=${course.id_course}" class="btn btn-primary">View detail course</a>
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
                                                <p style="color: red; width: 75px"><i class="fa-solid fa-ban" style="color: #ea0606;"></i> Cancel</p>
                                            </c:if>
                                            <c:if test="${course.status == 2}">
                                                <p style="color: yellowgreen; width: 75px"><i class="fa-sharp fa-solid fa-reply" style="color: yellowgreen"></i> Refund</p>
                                            </c:if>
                                                <c:if test="${course.status == 3}">
                                                <p style="color: brown; width: 75px">Pending! Please complete order.</p>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
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
    <c:import url="footer.html"/>
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
