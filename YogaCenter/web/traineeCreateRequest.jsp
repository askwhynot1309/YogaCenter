
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="css/style.css"/>
        <title>Create Request</title>
        <style>
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
        <c:import url="header.jsp"></c:import>
        <c:set var="exist" value="${sessionScope.account}"/>
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
                    <div class="col-lg-2" style="margin-right: 50px; padding: 0;">
                    <c:import url="traineeClassMenu.jsp"></c:import>
                    </div>

                    <div class="col-lg-9" style="padding: 0">
                        <div class="container">
                        <c:set var="trainee" value="${sessionScope.account}"></c:set>
                        <c:set var="registered" value="${requestScope.registered}"></c:set>
                        <c:choose>
                            <c:when test="${registered == null}">
                                <c:set var="overdue" value="${requestScope.overdue}"></c:set>
                                <c:set var="startDate" value="${requestScope.startDate}"></c:set>
                                <c:set var="endDate" value="${requestScope.endDate}"></c:set>
                                <c:set var="courseList" value="${requestScope.courseList}"></c:set>

                                <c:set var="classDetails" value="${requestScope.classDetails}"></c:set>
                                <c:set var="dayChoice" value="${requestScope.dayChoice}"></c:set>
                                <c:set var="time" value="${requestScope.Time}"></c:set>
                                <c:set var="toTraineeRegistered" value="${requestScope.toTraineeRegistered}"></c:set>
                                <c:set var="Course_ID" value="${requestScope.Course_ID}"></c:set>

                                    <h2 style="text-align: center;">Request to change class</h2>
                                    <h4 style="text-align: center; color: red;">Starting date: ${startDate}. Due date: before ${endDate}</h4>

                                <c:choose>
                                    <c:when test="${overdue != null}">

                                        <div class="container mt-5">
                                            <div class="d-flex justify-content-center row">
                                                <div class="col-md-10">
                                                    <div class="rounded">
                                                        <div class="table-responsive table-borderless">
                                                            <form action="/YogaCenter/request" method="post">
                                                                <table class="table" style="border: solid 1px;">
                                                                    <tr>
                                                                        <th>Course</th>
                                                                        <th>
                                                                            <select name="txtCourseID">
                                                                                <c:forEach var="course" items="${requestScope.courseList}">
                                                                                    <c:choose>
                                                                                        <c:when test="${course.idCourse == Course_ID}">
                                                                                            <option value="${course.idCourse}" selected>${course.name_course}</option>
                                                                                        </c:when>
                                                                                        <c:otherwise>
                                                                                            <option value="${course.idCourse}">${course.name_course}</option>
                                                                                        </c:otherwise>
                                                                                    </c:choose>
                                                                                </c:forEach>                                                                        
                                                                            </select>
                                                                        </th>
                                                                    </tr>
                                                                    <tr>
                                                                        <th>To Trainee ID</th>
                                                                        <th>
                                                                            Trainee No. <input type="number" id="txtToTraineeID" name="txtToTraineeID" required="" value="${classDetails.idaccount}">
                                                                            <button type="submit" name="action" value="checkTrainee">Check Trainee</button>
                                                                            <c:if test="${classDetails.class_name != null && classDetails.idaccount != null}">
                                                                                <p>${classDetails.account}</p>
                                                                            </c:if>
                                                                        </th>
                                                                    </tr>

                                                                    <c:if test="${classDetails.class_name != null && classDetails.idaccount != null}">
                                                                        <tr>
                                                                            <th>Class</th>
                                                                            <th>
                                                                                <p>${classDetails.class_name}</p>
                                                                                <p>${dayChoice}</p>
                                                                                <p>${time}</p>
                                                                            </th>

                                                                        </tr>
                                                                    </c:if>
                                                                </table>
                                                                <c:if test="${classDetails.class_name != null && classDetails.idaccount != null}">
                                                                    <c:set var="currentRoomName" value="${requestScope.currentRoomName}"/>
                                                                    <input type="hidden" name="txtFromTraineeID" value="${trainee.idaccount}">
                                                                    <input type="hidden" name="txtToTraineeID" value="${classDetails.idaccount}">
                                                                    <input type="hidden" name="txtFromRoomName" value="${currentRoomName}">
                                                                    <input type="hidden" name="txtToRoomName" value="${classDetails.id_class}">
                                                                    <button type="submit" name="action" value="createRequest">Submit</button> 
                                                                </c:if>
                                                                <c:if test="${toTraineeRegistered != null}">
                                                                    <h4 style="color: red">${toTraineeRegistered}</h4>
                                                                </c:if>   
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:when test="${overdue == null}">
                                        <div style="text-align: center">
                                            <h4 style="color: red">
                                                <span>${overdue}</span>
                                            </h4>
                                        </div>
                                    </c:when>
                                </c:choose>
                            </c:when>

                            <c:when test="${registered != null}">
                                <h4>${registered}</h4>
                            </c:when>
                        </c:choose>


                    </div>
                </div>
            </div>
        </div>
    </body>

    <script>
        var checkbox = document.getElementById('check');
        var txtCourseID = document.getElementById("course");

        checkbox.addEventListener('change', function () {
            if (this.checked) {
                var ID_Course = txtCourseID.value;

                if (!traineeID) {
                    alert('Trainee No. is required.');
                    this.checked = false; // Uncheck the checkbox
                    return;
                }

                var form = document.createElement('form');
                form.method = 'POST';
                form.action = '/YogaCenter/request';

                var courseID = document.createElement('input');
                action.type = 'hidden';
                courseID.name = 'courseID';
                courseID.value = ID_Course;


                var action = document.createElement('input');
                action.type = 'hidden';
                action.name = 'action';
                action.value = 'checkTrainee';

                form.appendChild(courseID);
                form.appendChild(action);

                document.body.appendChild(form);
                form.submit();
            }
        });
    </script>
</html>
