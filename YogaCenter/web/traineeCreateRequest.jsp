
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="icon" type="image/x-icon" href="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png">
        <link rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="css/trainee/trainee-add-message">
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
            html,
            body,
            h1,
            h2,
            h3,
            h4,
            h5 {
                font-family: "Raleway", sans-serif
            }
            #btn-create:hover {
                background-color: #3b82f6;
                box-shadow: 0 0 0 5px #3b83f65f;
                color: #fff;
            }
            body{
                font-size: 100%;
            }
            .w3-bar-block a:hover{
                text-decoration: none;
            }
            .head a:hover{
                text-decoration: none;
                color: orange!important;
                background-color: #f1f1f1!important;
                transition: .1s;
            }
            .notificate{
                /*position: absolute;*/
                background: red;
                color: white;
                border-radius: 9999em;
                padding: 0% 2% !important;
                /*top: -100%;*/
                /*right: 0;*/
            }
        </style>
    </head>
    <body class="w3-light-grey">
        <c:import url="header.jsp"></c:import>
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
        <nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
            <div style="text-align: center" class="w3-container w3-row">
                <div class="w3-col image">
                    <img src="${exist.image}" alt="image" class="w3-circle " style="width:150px; height: 150px; margin-right: 0px;">
                </div>
                <div class="w3-col w3-bar">
                    <br>
                    <span>Welcome <strong>${exist.name}</strong></span><br>
                </div>
            </div>
            <hr>
            <div class="w3-container">
                <h5>Dashboard</h5>
            </div>
            <div class="w3-bar-block">
                <a href="traineeGeneralDashboard.jsp" class="w3-bar-item w3-button w3-padding"><i class="fa fa-users fa-fw"></i>  General</a>
                <a href="yourcourse" class="w3-bar-item w3-button w3-padding"><i class="fa fa-users fa-fw"></i>  My courses</a>
                <a href="information" class="w3-bar-item w3-button w3-padding"><i class="fa fa-eye fa-fw"></i>  Views</a>
                <a href="/YogaCenter/classbooking" class="w3-bar-item w3-button w3-padding  w3-blue"><i class="fas fa-calendar-alt icon"></i>  My learning
                    <c:if test="${requestList.size() > 0}">
                        <div class="w3-right notificate">${requestList.size()}</div>
                    </c:if>
                </a>
                <a href="/YogaCenter/purchase" class="w3-bar-item w3-button w3-padding"><i class="fa fa-history fa-fw"></i> Purchase History</a>
                <a href="/YogaCenter/request?action=ChangePassword" class="w3-bar-item w3-button w3-padding"><i class="fa fa-cog fa-fw"></i>  Settings</a><br><br>
                <a href="/YogaCenter/request?action=Logout" class="w3-bar-item w3-button w3-padding"><i class="fas fa-sign-out-alt icon"></i>Logout</a>
            </div>
        </nav>
        <div class="w3-main" style="margin-left:300px;">
            <header class="w3-container w3-row-padding w3-margin-bottom head" style="padding-top:22px">

                <a href="/YogaCenter/classbooking" class="w3-third w3-bar-item w3-button w3-padding" style="padding: 0"><br><br>
                    <div class="w3-container  w3-padding">
                        <div class="w3-middle"><i class="fas fa-calendar-alt icon w3-xxlarge"><h6>Schedule</h6></i></div>

                    </div>
                </a>
                <a href="/YogaCenter/myCourses" class="w3-third w3-bar-item w3-button w3-padding" style="padding: 0"><br><br>
                    <div class="w3-container  w3-padding">
                        <div class="w3-middle"><i class="fas fa-users w3-xxlarge"><h6>My courses</h6></i></div>

                    </div>
                </a>
                <a href="/YogaCenter/viewRequest" class="w3-third w3-bar-item w3-button w3-padding" style="padding: 0">
                    <c:if test="${requestList.size() > 0}">
                        <div style="display: flex; flex-direction: column; align-items: center;" class="w3-container  w3-padding">
                            <div style="width: 24.525px;" class="w3-middle notificate">
                                ${requestList.size()}
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${requestList == null or requestList.size() == 0}">
                        <br><br>
                    </c:if>
                    <div class="w3-container  w3-padding">
                        <div class="w3-middle"><i class="fas fa-exchange w3-xxlarge"><h6>Request to change classes</h6></i></div>

                    </div>
                </a>
            </header>
            <div class="container">
                <div class="container mt-5">
                    <div class="d-flex justify-content-center row">
                        <div class="col-md-12">
                            <div class="rounded">
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
