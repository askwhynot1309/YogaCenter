
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dao.UserDao"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/trainee/trainee-inf.css"/>
        <link rel="stylesheet" href="css/admin/admin-course.css">
        <link rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
        <link rel="icon" type="image/x-icon" href="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png">
        <title>Manage Information</title>

    </head>
    <style>
        @import url("https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap");
        body {
            background: #f9f9f9;
            font-family: "Roboto", sans-serif;
        }

        .shadow {
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1) !important;
        }

        .profile-tab-nav {
            min-width: 250px;
        }

        .tab-content {
            flex: 1;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .nav-pills a.nav-link {
            padding: 15px 20px;
            border-bottom: 1px solid #ddd;
            border-radius: 0;
            color: #333;
        }
        .nav-pills a.nav-link i {
            width: 20px;
        }

        .img-circle img {
            height: 100px;
            width: 100px;
            border-radius: 100%;
            border: 5px solid #fff;
        }
        body{
            font-size: 100%;
        }
        a:hover{
            text-decoration: none;
        }

        .form-group input{
            width: 440.200px;
        }
        .cart {
            z-index: 2;
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
        .notification{
            position: fixed;
            top: 20px;
            right: 0px;
            padding: 5px;
            padding-left: 10px;
            color: white;
            margin-bottom: 10px;
            width: 300px;
            height: 100px;
            border-radius: 5px;
            background-color: #008000;
            animation: show 0.3s ease 1 forwards
        }

        .notification .title{
            font-size: 18px;
            font-weight: bold;
        }
        .notification span, .notification i:nth-child(3){
            color: white;
            opacity: 0.8;
        }
        .notification .content {
            padding: 5px 0;
        }
        @keyframes show{
            0%{
                transform: translateX(100%);
            }
            40%{
                transform: translateX(-5%);
            }
            80%{
                transform: translateX(0%);
            }
            100%{
                transform: translateX(-10%);
            }
        }
        .notification::before{
            position: absolute;
            bottom: 0;
            left: 0;
            background-color: var(--color);
            width: 100%;
            height: 3px;
            content: '';
            box-shadow: 0 0 10px var(--color);
            animation: timeOut 5s linear 1 forwards
        }
        @keyframes timeOut{
            to{
                width: 0;
            }
        }
        .notification{
            --color: #FFFFFF;
            background-image:
                linear-gradient(
                to right, #FF3366, #FF0000 30%
                );
        }
        .notification-success{
            position: fixed;
            top: 20px;
            right: 0px;
            padding: 5px;
            padding-left: 10px;
            color: white;
            margin-bottom: 10px;
            width: 300px;
            height: 80px;
            border-radius: 5px;
            background-color: #008000;
            animation: show 0.3s ease 1 forwards
        }

        .notification-success .title{
            font-size: 18px;
            font-weight: bold;
        }
        .notification-success span, .notification-success i:nth-child(3){
            color: white;
            opacity: 0.9;
        }
        .notification-success .content {
            padding: 5px 0;
        }
        @keyframes show{
            0%{
                transform: translateX(100%);
            }
            40%{
                transform: translateX(-5%);
            }
            80%{
                transform: translateX(0%);
            }
            100%{
                transform: translateX(-10%);
            }
        }
        .notification-success::before{
            position: absolute;
            bottom: 0;
            left: 0;
            background-color: var(--color);
            width: 100%;
            height: 3px;
            content: '';
            box-shadow: 0 0 10px var(--color);
            animation: timeOut 5s linear 1 forwards
        }
        @keyframes timeOut{
            to{
                width: 0;
            }
        }
        .notification-success{
            --color: #FFFFFF;
            background-image:
                linear-gradient(
                to right, #00FF00, #00CC00 30%
                );
        }
    </style>
    <c:import url="header.jsp"/>
    <body>
        <c:set var="changeSuccess" value="${requestScope.changeSuccess}"></c:set>
        <c:set var="changeFail" value="${requestScope.changeFail}"></c:set>
        <c:set var="account" value="${sessionScope.account}"></c:set>
        <c:set var="acc" value="${requestScope.acc}"/>
        <c:set var="requestList" value="${sessionScope.requestList}"></c:set>
        <c:if test="${account == null}">
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
                <a href="yourcourse" class="w3-bar-item w3-button w3-padding"><i class="fa fa-users fa-fw"></i>  My courses</a>
                <a href="information" class="w3-bar-item w3-button w3-padding"><i class="fa fa-eye fa-fw"></i>  Views</a>
                <a href="/YogaCenter/classbooking" class="w3-bar-item w3-button w3-padding"><i class="fas fa-calendar-alt icon"></i>  My learning
                    <c:if test="${requestList.size() > 0}">
                        <div class="w3-right notificate">${requestList.size()}</div>
                    </c:if>
                </a>
                <a href="/YogaCenter/purchase" class="w3-bar-item w3-button w3-padding"><i class="fa fa-history fa-fw"></i> Purchase History</a>
                <a href="/YogaCenter/request?action=ChangePassword" class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa fa-cog fa-fw"></i>  Settings</a><br><br>
                <a href="/YogaCenter/request?action=Logout" class="w3-bar-item w3-button w3-padding"><i class="fas fa-sign-out-alt icon"></i>Logout</a>
            </div>
        </nav>

        <div class="w3-main" style="margin-left:300px;margin-top:43px;">
            <div class="container">
                <div class="tab-pane fade show active" id="account" role="tabpanel" aria-labelledby="account-tab">
                    <div style="padding: 10px; color: black; background: #d0efe1; margin-top: 50px; margin-bottom: 20px">
                        <h2 style="text-transform: uppercase; font-size: 900">Manage password</h2>
                    </div>
                    <form action="/YogaCenter/request" method="POST">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Current password</label>
                                    <input type="password" class="form-control" name="txtOldPassword">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <!--<label>Trainee ID</label>-->
                                    <input type="hidden" class="form-control" name="txtAccountID" value="${acc.idaccount}" readonly>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>New password</label>
                                    <input type="password" class="form-control" name="txtNewPassword">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Confirm password</label>
                                    <input type="password" class="form-control" name="txtConfirmPassword">
                                </div>
                            </div>
                        </div>

                        <div style="margin-top: 100px;">
                            <button class="btn btn-primary" type="submit" name="action" value="UpdatePassword">Update</button>
                        </div>
                    </form>


                </div>
            </div>
        </div>

        <c:if test="${changeSuccess != null}">
            <div class="notification-success" style="z-index: 1000">
                <div class="content">
                    <div class="title">Success</div>
                    <span>${changeSuccess}</span>
                </div>
            </div>
            <script>
                let notification = document.querySelector('.notification-success');
                notification.timeOut = setTimeout(() => notification.remove(), 3000);
            </script>
        </c:if>
        <c:if test="${changeFail != null}">
            <div class="notification" style="z-index: 1000">
                <div class="content">
                    <div class="title">Fail</div>
                    <span>${changeFail}</span>
                </div>
            </div>
            <script>
                let notification = document.querySelector('.notification');
                notification.timeOut = setTimeout(() => notification.remove(), 3000);
            </script>
        </c:if>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
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
