<%-- 
    Document   : traineeGeneralDashboard
    Created on : Jul 4, 2023, 9:01:24 PM
    Author     : ngmin
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dao.MessageDao"%>
<%@page import="Dao.AttendenceDao"%>
<%@page import="Object.Message"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Object.Account"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Trainee General</title>
    </head>
    <style>
        html,
        body,
        h1,
        h2,
        h3,
        h4,
        h5 {
            font-family: "Raleway", sans-serif
        }
        body{
            font-size: 100%;
        }
    </style>
    <c:import url="header.jsp"/>
    <body class="w3-light-grey">
        <c:set var="acc" value="${sessionScope.account}"/>
        <c:set var="cart" value="${sessionScope.cart}"/>
        <c:set var="courseList" value="${requestScope.courseList}"></c:set>

        <c:if test="${acc != null}">
            <c:set var="notiList" value="${MessageDao.getAllMessageByUserIDWithNotRead(acc.idaccount)}"></c:set>

                <nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
                    <div class="w3-container w3-row">
                        <div class="w3-col s4">
                            <img src="/w3images/avatar2.png" class="w3-circle w3-margin-right" style="width:46px">
                        </div>
                        <div class="w3-col s8 w3-bar">
                            <span>Welcome, <strong>${acc.name}</strong></span>
                    </div>
                </div>
                <hr>
                <div class="w3-container">
                    <h5>Dashboard</h5>
                </div>
                <div class="w3-bar-block">
                    <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black"
                       onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>  Close</a>
                    <a href="traineeGeneralDashboard.jsp" class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa fa-users fa-fw"></i>  General</a>
                    <a href="information" class="w3-bar-item w3-button w3-padding"><i class="fa fa-eye fa-fw"></i>  Views</a>
                    <a href="/YogaCenter/classbooking" class="w3-bar-item w3-button w3-padding"><i class="fas fa-calendar-alt icon"></i>  My learning</a>
                    <a href="/YogaCenter/purchase" class="w3-bar-item w3-button w3-padding"><i class="fa fa-history fa-fw"></i> Purchase History</a>
                    <a href="/YogaCenter/request?action=ChangePassword" class="w3-bar-item w3-button w3-padding"><i class="fa fa-cog fa-fw"></i>  Settings</a><br><br>
                </div>
            </nav>
            <div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer"
                 title="close side menu" id="myOverlay">
            </div>

            <!-- !PAGE CONTENT! -->
            <div class="w3-main" style="margin-left:300px;margin-top:43px;">

                <!-- Header -->
                <header class="w3-container" style="padding-top:22px">
                    <h5><b><i class="fa fa-dashboard"></i>${acc.name}</b></h5>
                </header>

                <div class="w3-row-padding w3-margin-bottom">
                    <a href="/YogaCenter/request?action=viewNotification" class="w3-third">
                        <div class="w3-container w3-red w3-padding-16">
                            <div class="w3-left"><i class="fa fa-comment w3-xxxlarge"></i></div>
                            <div class="w3-right">
                                <c:if test="${notiList.size() > 0}">
                                    <h3>${notiList.size()}</h3>
                                </c:if>
                                <c:if test="${notiList == null}">
                                    <h3>0</h3>
                                </c:if>
                            </div>
                            <div class="w3-clear"></div>
                            <h4>Messages</h4>
                        </div>
                    </a>

                    <a href="/YogaCenter/viewcart" class="w3-third">
                        <div class="w3-container w3-blue w3-padding-16">
                            <div class="w3-left"><i class="fa fa-shopping-cart fa-fw w3-xxxlarge"></i></div>
                            <div class="w3-right">
                                <c:if test="${cart.size() > 0}">
                                    <h3>${cart.size()}</h3>
                                </c:if>
                                <c:if test="${cart == null}">
                                    <h3>0</h3>
                                </c:if>
                            </div>
                            <div class="w3-clear"></div>
                            <h4>Cart</h4>
                        </div>
                    </a>

                    <a href="#" class="w3-third">
                        <div class="w3-container w3-orange w3-text-white w3-padding-16">
                            <div class="w3-left"><i class="fa fa-users w3-xxxlarge"></i></div>
                            <div class="w3-right">
                                <h3>1</h3>
                            </div>
                            <div class="w3-clear"></div>
                            <h4>Users</h4>
                        </div>
                    </a>
                </div>

                <div class="w3-panel">
                    <div class="w3-row-padding" style="margin:0 -16px">
                        <!-- <div class="w3-third">
                            <h5>Regions</h5>
                            <img src="https://www.w3schools.com/w3images/region.jpg" style="width:100%"
                                alt="Google Regional Map">
                        </div> -->
                        <div class="w3-twothird">
                            <h5>Feeds</h5>
                            <table class="w3-table w3-striped w3-white">
                                <tr>
                                    <td><i class="fa fa-shopping-cart w3-text-blue w3-large"></i></td>
                                    <td>Checkout your cart.</td>
                                    <td><i>10 mins</i></td>
                                </tr>
                                <!-- <tr>
                                    <td><i class="fa fa-bell w3-text-teal w3-large"></i></td>
                                    <td>Database error.</td>
                                    <td><i>15 mins</i></td>
                                </tr> -->
                                <tr>
                                    <td><i class="fa fa-users w3-text-orange w3-large"></i></td>
                                    <td>A trainee request you to change class.</td>
                                    <td><i>17 mins</i></td>
                                </tr>
                                <tr>
                                    <td><i class="fa fa-comment w3-text-red w3-large"></i></td>
                                    <td>The course you signed up for has classes.</td>
                                    <td><i>25 mins</i></td>
                                </tr>
                                <tr>
                                    <td><i class="fa fa-history w3-text-blue w3-large"></i></td>
                                    <td>Check transactions.</td>
                                    <td><i>28 mins</i></td>
                                </tr>

                            </table>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="w3-container">
                    <h5>Process Tracking</h5>
                    <c:if test="${courseList != null && courseList.size() > 0}">
                        <c:forEach var="course" items="${courseList}">
                            <p>${course.name_course}</p>
                            <div class="w3-grey">
                                <c:set var="progress" value="${AttendenceDao.getProgressByAttendance(acc.idaccount, course.idCourse)}"></c:set>
                                <div class="w3-container w3-center w3-green" style="width:${progress}%; padding: 8px 0;">${progress}%</div>
                            </div>
                        </c:forEach>
                    </c:if>
<!--

                    <p>Course 2</p>
                    <div class="w3-grey">
                        <div class="w3-container w3-center w3-padding w3-orange" style="width:50%">50%</div>
                    </div>

                    <p>Course 3</p>
                    <div class="w3-grey">
                        <div class="w3-container w3-center w3-padding w3-red" style="width:75%">75%</div>
                    </div>-->
                </div>
                <hr>

                <!-- <div class="w3-container">
                    <h5>Countries</h5>
                    <table class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white">
                        <tr>
                            <td>United States</td>
                            <td>65%</td>
                        </tr>
                        <tr>
                            <td>UK</td>
                            <td>15.7%</td>
                        </tr>
                        <tr>
                            <td>Russia</td>
                            <td>5.6%</td>
                        </tr>
                        <tr>
                            <td>Spain</td>
                            <td>2.1%</td>
                        </tr>
                        <tr>
                            <td>India</td>
                            <td>1.9%</td>
                        </tr>
                        <tr>
                            <td>France</td>
                            <td>1.5%</td>
                        </tr>
                    </table><br>
                    <button class="w3-button w3-dark-grey">More Countries  <i class="fa fa-arrow-right"></i></button>
                </div> -->
                <hr>
                <!--            <div class="w3-container">
                                <h5>Recent Users</h5>
                                <ul class="w3-ul w3-card-4 w3-white">
                                    <li class="w3-padding-16">
                                        <img src="https://www.w3schools.com/w3images/avatar2.png" class="w3-left w3-circle w3-margin-right"
                                             style="width:35px">
                                        <span class="w3-xlarge">Mike</span><br>
                                    </li>
                                    <li class="w3-padding-16">
                                        <img src="https://www.w3schools.com/w3images/avatar2.png" class="w3-left w3-circle w3-margin-right"
                                             style="width:35px">
                                        <span class="w3-xlarge">John</span><br>
                                    </li>
                                    <li class="w3-padding-16">
                                        <img src="https://www.w3schools.com/w3images/avatar2.png" class="w3-left w3-circle w3-margin-right"
                                             style="width:35px">
                                        <span class="w3-xlarge">Dave</span><br>
                                    </li>
                                </ul>
                            </div>-->
                <hr>


                <!-- Footer -->
                <footer class="w3-container w3-padding-16 w3-light-grey">
                    <%--<c:import url="footer.html"/>--%>
                    <%-- there are some error when merge the footer into the dashboard. --%>
                </footer>

                <!-- End page content -->
            </div>
        </c:if>



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
