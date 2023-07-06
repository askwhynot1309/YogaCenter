
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dao.UserDao"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/trainee/trainee-inf.css"/>
        <link rel="stylesheet" href="css/trainee/trainee-add-message.css">
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
    </style>
    <c:import url="header.jsp"/>
    <body>
        <c:set var="changeSuccess" value="${requestScope.changeSuccess}"></c:set>
        <c:set var="changeFail" value="${requestScope.changeFail}"></c:set>
        <c:set var="account" value="${sessionScope.account}"></c:set>
        <c:set var="acc" value="${UserDao.getAccountByID(exist.idaccount)}"/>

        <nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
            <div class="w3-container w3-row">
                <div class="w3-col s4">
                    <img src="/w3images/avatar2.png" class="w3-circle w3-margin-right" style="width:46px">
                </div>
                <div class="w3-col s8 w3-bar">
                    <span>Welcome,<strong>${acc.name}</strong></span><br>
                </div>
            </div>
            <hr>
            <div class="w3-container">
                <h5>Dashboard</h5>
            </div>
            <div class="w3-bar-block">
                <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black"
                   onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>  Close</a>
                <a href="traineeGeneralDashboard.jsp" class="w3-bar-item w3-button w3-padding"><i class="fa fa-users fa-fw"></i>  General</a>
                <a href="information" class="w3-bar-item w3-button w3-padding"><i class="fa fa-eye fa-fw"></i>  Views</a>
                <a href="/YogaCenter/classbooking" class="w3-bar-item w3-button w3-padding"><i class="fas fa-calendar-alt icon"></i>  My learning</a>
                <a href="/YogaCenter/purchase" class="w3-bar-item w3-button w3-padding"><i class="fa fa-history fa-fw"></i> Purchase History</a>
                <a href="/YogaCenter/request?action=ChangePassword" class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa fa-cog fa-fw"></i>  Settings</a><br><br>
                <a href="/YogaCenter/request?action=Logout" class="w3-bar-item w3-button w3-padding"><i class="fas fa-sign-out-alt icon"></i>Logout</a>
            </div>
        </nav>

        <div class="w3-main" style="margin-left:300px;margin-top:43px;">
            <div class="container">
                <div class="tab-pane fade show active" id="account" role="tabpanel" aria-labelledby="account-tab">
                    <h3 class="mb-4">Manage password</h3>
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
                notification.timeOut = setTimeout(() => notification.remove(), 2000);
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
                notification.timeOut = setTimeout(() => notification.remove(), 2000);
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
