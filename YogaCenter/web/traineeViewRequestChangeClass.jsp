<%-- 
    Document   : traineeViewRequestChangeClass
    Created on : Jun 26, 2023, 2:58:53 PM
    Author     : ngmin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="icon" type="image/x-icon" href="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png">
        <link rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="css/trainee/trainee-add-message">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Request Class</title>
    </head>
    <style>
        #btn-create {
            font-family: monospace;
            background-color: #f3f7fe;
            color: #3b82f6;
            border: none;
            border-radius: 8px;
            width: 150px;
            height: 45px;
            transition: .1s;
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

        <c:set var="account" value="${requestScope.acc}"/>
        <nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
            <div style="text-align: center" class="w3-container w3-row">
                    <div class="w3-col image">
                        <img src="img/${account.image}" alt="image" class="w3-circle " style="width:150px; height: 150px; margin-right: 0px;">
                </div>
                <div class="w3-col w3-bar">
                    <br>
                    <span>Welcome <strong>${account.name}</strong></span><br>
                </div>
            </div>
            <hr>
            <div class="w3-container">
                <h5>Dashboard</h5>
            </div>
            <div class="w3-bar-block">
                <a href="GeneralDashboard" class="w3-bar-item w3-button w3-padding"><i class="fa fa-users fa-fw"></i>  General</a>
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
                <h4>Request to change subject classes</h4>
                <div class="container mt-5">
                    <div class="d-flex justify-content-center row">
                        <div class="col-md-12">
                            <div class="rounded">
                                <div class="table-responsive table-borderless">
                                    <form action="/YogaCenter/request" method="post">
                                        <button id="btn-create" type="submit" name="action" value="traineeRequestChangeClass">Create Request</button>
                                    </form>
                                    <table class="table">
                                        <thead>
                                            <tr style="background-color: #1CB0F6;">
                                                <th>Course ID</th>
                                                <th>From trainee</th>
                                                <th>From class</th>
                                                <th>To trainee</th>
                                                <th>To class</th>
                                                <th>Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:set var="trainee" value="${sessionScope.account}"/>
                                            <c:forEach var="mess" items="${requestScope.messRequest}">      
                                                <c:if test="${mess.toUserID == trainee.idaccount && mess.status == 0}">
                                                    <tr class="cell-1 ${rowNumber % 2 == 0 ? 'alternate-row' : ''}">
                                                        <th>${mess.course_ID}</th>
                                                        <th>${mess.fromUserID}</th>
                                                        <th>Room ${mess.fromClassID}</th>
                                                        <th>${mess.toUserID}</th>
                                                        <th>Room ${mess.toClassID}</th>
                                                        <th>
                                                            <form action="/YogaCenter/request" method="post">
                                                                <input type="hidden" name="txtCourseID">
                                                                <input type="hidden" name="txtMessageID" value="${mess.messageID}">
                                                                <input type="hidden" name="txtFromTraineeID" value="${mess.fromUserID}">
                                                                <input type="hidden" name="txtFromClassID" value="${mess.fromClassID}">
                                                                <input type="hidden" name="txtToUserID" value="${mess.toUserID}">
                                                                <input type="hidden" name="txtToClassID" value="${mess.toClassID}">
                                                                <button type="submit" name="action" value="approveRequest"  class="badge badge-success">Approve</button> | 
                                                                <button type="submit" name="action" value="rejectRequest" class="badge badge-danger">Reject</button>
                                                            </form>
                                                        </th>
                                                    </tr>
                                                </c:if>
                                                <c:if test="${mess.toUserID == trainee.idaccount && mess.status != 0}">
                                                    <tr class="cell-1 ${rowNumber % 2 == 0 ? 'alternate-row' : ''}">
                                                        <th>${mess.course_ID}</th>
                                                        <th>${mess.fromUserID}</th>
                                                        <th>Class ${mess.fromClassID}</th>
                                                        <th>${mess.toUserID}</th>
                                                        <th>Class ${mess.toClassID}</th>

                                                        <c:choose>
                                                            <c:when test="${mess.status == 0}">
                                                                <th class="badge badge-warning">wait for confirmation</th>
                                                                </c:when>
                                                                <c:when test="${mess.status == 1}">
                                                                <th class="badge badge-primary">Approved</th>
                                                                </c:when>
                                                                <c:otherwise>
                                                                <th class="badge badge-danger">Reject</th>
                                                                </c:otherwise>
                                                            </c:choose>
                                                    </tr>
                                                </c:if>
                                                <c:if test="${mess.fromUserID == trainee.idaccount}">
                                                    <tr class="cell-1 ${rowNumber % 2 == 0 ? 'alternate-row' : ''}">
                                                        <th>${mess.course_ID}</th>
                                                        <th>${mess.fromUserID}</th>
                                                        <th>Class ${mess.fromClassID}</th>
                                                        <th>${mess.toUserID}</th>
                                                        <th>Class ${mess.toClassID}</th>

                                                        <c:choose>
                                                            <c:when test="${mess.status == 0}">
                                                                <th class="badge badge-warning">wait for confirmation</th>
                                                                </c:when>
                                                                <c:when test="${mess.status == 1}">
                                                                <th class="badge badge-primary">Approved</th>
                                                                </c:when>
                                                                <c:otherwise>
                                                                <th class="badge badge-danger">Reject</th>
                                                                </c:otherwise>
                                                            </c:choose>
                                                    </tr>
                                                </c:if>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function selectMenuItem(event, item) {
                event.preventDefault(); // Prevent the default behavior of the anchor tag
                // Remove 'li-active' class from all <li> elements
                var listItems = document.querySelectorAll('.sidebar li');
                for (var i = 0; i < listItems.length; i++) {
                    listItems[i].classList.remove('li-active');
                }

                // Add 'li-active' class to the parent <li> element of the clicked anchor tag
                item.parentNode.classList.add('li-active');

                // Reload the page
                window.location.reload();
            }
        </script>
        <script>
            // Get the Sidebar
            var mySidebar = document.getElementById("mySidebar");

            // Get the DIV with overlay effect
            var overlayBg = document.getElementById("myOverlay");

            // Toggle between showing and hiding the sidebar, and add overlay effect
            function w3_open() {
                if (mySidebar.style.display === 'block') {
                    mySidebar.style.display = 'none';
                    overlayBg.style.display = "none";
                } else {
                    mySidebar.style.display = 'block';
                    overlayBg.style.display = "block";
                }
            }

            // Close the sidebar with the close button
            function w3_close() {
                mySidebar.style.display = "none";
                overlayBg.style.display = "none";
            }
        </script>
    </body>
</html>
