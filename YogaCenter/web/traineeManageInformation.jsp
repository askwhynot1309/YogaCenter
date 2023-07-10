<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dao.UserDao"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/x-icon" href="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png">
        <link rel="stylesheet" href="css/trainee/trainee-inf.css"/>
        <link rel="stylesheet" href="css/trainee/trainee-add-message.css">
        <link rel="stylesheet" href="css/admin/admin-course.css">
        <link rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
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
        /*        .image:hover{
                    background: #008000;
                }*/
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
            position: relative;
            opacity: 0;
            background-color: rgba(0, 0, 0, 0.5);
            width: 150px;
            height: 150px;
            text-align: center;
            margin-left: 60px;
        }

        .plus-icon {
            color: #fff;
            font-size: 36px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        #popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #fff;
            padding: 20px;
            z-index: 9999;
            width: 300px;
        }
        .image {
            position: relative;
            display: inline-block;
        }
        .overlay1 {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 9999;
        }
        .hidden{
            display: none;
        }

    </style>
    <c:import url="header.jsp"/>
    <body class="w3-light-grey">
        <div id="overlay1" class="overlay1 hidden"></div>
        <c:set var="changeSuccess" value="${requestScope.changeSuccess}"></c:set>
        <c:set var="changeFail" value="${requestScope.changeFail}"></c:set>
        <c:set var="exist" value="${sessionScope.account}"/>
        <c:set var="requestList" value="${sessionScope.requestList}"></c:set>
        <c:if test="${exist == null}">
            <div id="overlay1" class="overlay1"></div>
            <div class="message" id="message">
                <h3 style="text-align: center; color: red">Message</h3>
                <p>Your session is timeout. Back to login page to login again!</p>
                <div style=" text-align: center">
                    <a class="btn btn-primary" href="login.jsp">Login</a>
                </div>
            </div>
        </c:if>

        <c:set var="account" value="${requestScope.acc}"/>
        <div id="popup">
            <div>
                <form action="/YogaCenter/request" method="POST">
                    <img src="img/${account.image}" height="200px" width="200px" id="img" style="margin-left: 10%; margin-bottom: 10px">
                    <input type="file" name="img" id="img-input">
                    <input name="oldimg" value="${account.image}" hidden="">
                    <input name="id" value="${account.idaccount}" hidden="">
                    <button name="action" value="ChangeAvatar" class="btn btn-primary" style="margin-left: 38%; margin-top: 10px">Change</button>
                </form>
                <button class="btn btn-primary" id="btn-close" style="margin-left: 40%; margin-top: 10px">Close</button>
            </div>
        </div>
        <nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
            <div style="text-align: center" class="w3-container w3-row">
                <div class="w3-col image" >
                    <img src="img/${account.image}" alt="image" class="w3-circle" width="150px" height="150px" id="avatar">
                    <div class="overlay w3-circle hidden">
                        <span class="plus-icon">+</span>
                    </div>
                </div>
                <script>
                    const image = document.getElementById('avatar');
                    const overlay = document.querySelector('.overlay');
                    const popup = document.getElementById('popup');
                    const closeButtons = document.getElementById("btn-close");
                    const overlay1 = document.getElementById("overlay1");

                    image.addEventListener('mouseenter', () => {
                        overlay.style.opacity = 1;
                        image.style.display = 'none';
                        overlay.classList.remove("hidden");
                    });

                    overlay.addEventListener('mouseleave', () => {
                        overlay.style.opacity = 0;
                        image.style.display = 'block';
                        image.style.marginLeft = "60px";
                        overlay.classList.add("hidden");
                    });

                    overlay.addEventListener('click', () => {
                        popup.style.display = 'block';
                        overlay1.classList.remove("hidden");
                    });

                    closeButtons.addEventListener('click', (event) => {
                        popup.style.display = 'none';
                        overlay1.classList.add("hidden");
                    });
                </script>
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
                <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black"
                   onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>  Close</a>
                <a href="GeneralDashboard" class="w3-bar-item w3-button w3-padding"><i class="fa fa-users fa-fw"></i>  General</a>
                <a href="yourcourse" class="w3-bar-item w3-button w3-padding"><i class="fa fa-users fa-fw"></i>  My courses</a>
                <a href="information" class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa fa-eye fa-fw"></i>  Views</a>
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

        <div class="w3-main" style="margin-left:300px;margin-top:43px;">
            <div class="container">
                <div class="tab-pane fade show active" id="account" role="tabpanel" aria-labelledby="account-tab">
                    <div style="padding: 10px; color: black; background: #d0efe1; margin-top: 50px; margin-bottom: 20px">
                        <h2 style="text-transform: uppercase; font-size: 900">Information</h2>
                    </div>
                    <h4>Amount: ${account.amount}VND</h4>
                    <form action="/YogaCenter/request" method="POST">
                        <div class="row">

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Trainee ID</label>
                                    <input type="text" class="form-control" name="txtAccountID" value="${account.idaccount}" readonly>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Full Name</label>
                                    <input type="text" class="form-control" name="txtFullname" value="${account.name}">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Email</label>
                                    <input type="email" class="form-control" name="txtEmail" value="${account.email}" readonly>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Phone number</label>
                                    <input type="tel" class="form-control" name="txtPhone" value="${account.phone}">
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Address</label>
                                    <input type="text" class="form-control" name="txtAddress" value="${account.address}">
                                </div>
                            </div>
                        </div>

                        <div style="margin-top: 50px;">
                            <button class="btn btn-primary" type="submit" name="action" value="ChangeInformation">Update</button>
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
            </div>s
            <script>
                let notification = document.querySelector('.notification');
                notification.timeOut = setTimeout(() => notification.remove(), 2000);
            </script>
        </c:if>            
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
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
        <script>
            const inputFile = document.getElementById('img-input');
            const image = document.getElementById('img');
            inputFile.addEventListener('change', function () {
                if (inputFile.files && inputFile.files[0]) {
                    const reader = new FileReader();
                    reader.onload = function (e) {
                        image.src = '';
                        image.src = e.target.result;
                    };
                    reader.readAsDataURL(inputFile.files[0]);
                }
            });
        </script>
        <c:if test="${changesuccess != null}">
            <div class="notification-success" style="z-index: 1000">
                <div class="content">
                    <div class="title">Success</div>
                    <span>Change avatar successfully.</span>
                </div>
            </div>
            <script>
                let notification = document.querySelector('.notification-success');
                notification.timeOut = setTimeout(() => notification.remove(), 2000);
            </script>
        </c:if>
    </body>

</html>
