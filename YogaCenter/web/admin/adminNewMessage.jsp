<%-- 
    Document   : adminNewMessage
    Created on : Jul 4, 2023, 4:51:59 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Message</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="icon" type="image/x-icon" href="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png">
        <link rel="stylesheet" href="css/admin/admin.css">
        <link rel="stylesheet" href="css/admin/admin-course-add.css">
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
                <div class="col-lg-3" style="padding: 0">
                    <c:import url="adminMenu.jsp"></c:import>
                    </div>
                    <div class="col-lg-8">
                        <div style="height: 40px; width: 100%; margin-top: 10px; margin-bottom: 10px">
                            <a href="/YogaCenter/message" class="btn">
                                <svg height="16" width="16" xmlns="http://www.w3.org/2000/svg" version="1.1" viewBox="0 0 1024 1024"><path d="M874.690416 495.52477c0 11.2973-9.168824 20.466124-20.466124 20.466124l-604.773963 0 188.083679 188.083679c7.992021 7.992021 7.992021 20.947078 0 28.939099-4.001127 3.990894-9.240455 5.996574-14.46955 5.996574-5.239328 0-10.478655-1.995447-14.479783-5.996574l-223.00912-223.00912c-3.837398-3.837398-5.996574-9.046027-5.996574-14.46955 0-5.433756 2.159176-10.632151 5.996574-14.46955l223.019353-223.029586c7.992021-7.992021 20.957311-7.992021 28.949332 0 7.992021 8.002254 7.992021 20.957311 0 28.949332l-188.073446 188.073446 604.753497 0C865.521592 475.058646 874.690416 484.217237 874.690416 495.52477z"></path></svg>
                                <span>Back</span>
                            </a>
                        </div>
                        <h2 style="display: flex; justify-content: center; margin-bottom: 50px; font-family: monospace;font-weight: 700; margin-top: 20px; text-transform: uppercase">New Message</h2>
                    <c:set var="listStaff" value="${requestScope.listStaff}"/>
                    <c:set var="listTrainee" value="${requestScope.listTrainee}"/>
                    <c:set var="listTrainer" value="${requestScope.listTrainer}"/>
                    <c:set var="success" value="${requestScope.success}"/>
                    <c:set var="wrong" value="${requestScope.wrong}"/>
                    <form action="/YogaCenter/request" method="POST">
                        <div style="display: flex; align-items: center; justify-content: space-between">
                            <h5><strong>Send to : </strong></h5>
                            <textarea id="myTextarea" rows="4" cols="100" style="height: 30px; width: 80%; border-radius: 10px; font-size: 15px; padding: 5px" name="send"></textarea>
                        </div>
                        <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 20px;margin-top: 20px">
                            <select id="choice" name="choice" onchange="showSelect()">
                                <option value="0">All accounts</option>
                                <option value="1">All trainees</option>
                                <option value="2">All trainers</option>
                                <option value="3">All staffs</option>
                            </select>
                            <select id="traineeSelect" style="display:none;">
                                <option></option>
                                <c:forEach items="${listTrainee}" var="trainee">
                                    <option value="${trainee.idaccount}">${trainee.email}</option>
                                </c:forEach>
                            </select>

                            <select id="staffSelect" style="display:none;">
                                <option></option>
                                <c:forEach items="${listStaff}" var="staff">
                                    <option value="${staff.idaccount}">${staff.email}</option>
                                </c:forEach>
                            </select>

                            <select id="trainerSelect" style="display:none;">
                                <option></option>
                                <c:forEach items="${listTrainer}" var="trainer">
                                    <option value="${trainer.idaccount}">${trainer.email}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div style="display: flex; align-items: center; justify-content: space-between">
                            <h5><strong>Title : </strong></h5>
                            <textarea name="title" style="height: 30px; width: 80%; border-radius: 10px; font-size: 15px; padding: 5px"></textarea>
                        </div>
                        <h5><strong>Message :</strong></h5>
                        <textarea name="message" value="" style="width: 100%"></textarea>
                        <button name="action" value="AddMessage" style="margin-top: 30px; float: right" class="btn btn-primary">Send</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
    <c:if test="${success != null}">
        <div class="notification-success">
            <div class="content">
                <div class="title">Success</div>
                <span>Create a new successful message.</span>
            </div>
            <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
        </div>
        <script>
            let notification = document.querySelector('.notification-success');
            notification.timeOut = setTimeout(() => notification.remove(), 5000);
        </script>
    </c:if>
        <c:if test="${wrong != null}">
            <div class="notification">
                <div class="content">
                    <div class="title">Error</div>
                    <span>Field Send to is wrong because of your choice.</span>
                </div>
                <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
            </div>
            <script>
                let notification = document.querySelector('.notification');
                notification.timeOut = setTimeout(() => notification.remove(), 5000);
            </script>
        </c:if> 
    <script src="https://cdn.ckeditor.com/4.21.0/standard/ckeditor.js"></script>
    <script>
            CKEDITOR.replace('message');
    </script>
    <script>
        var select = document.getElementById("traineeSelect");
        var select2 = document.getElementById("staffSelect");
        var select3 = document.getElementById("trainerSelect");
        var textarea = document.getElementById("myTextarea");

// Xử lý sự kiện khi tùy chọn được chọn
        select.addEventListener("change", function () {
            var selectedOption = select.options[select.selectedIndex].innerHTML;

            // Kiểm tra xem tùy chọn đã được thêm vào textarea chưa
            if (textarea.value.indexOf(selectedOption) === -1) {
                // Thêm tùy chọn vào textarea
                textarea.value += selectedOption + " ";
            }
        });
        select2.addEventListener("change", function () {
            var selectedOption = select2.options[select2.selectedIndex].innerHTML;

            // Kiểm tra xem tùy chọn đã được thêm vào textarea chưa
            if (textarea.value.indexOf(selectedOption) === -1) {
                // Thêm tùy chọn vào textarea
                textarea.value += selectedOption + " ";
            }
        });
        select3.addEventListener("change", function () {
            var selectedOption = select3.options[select3.selectedIndex].innerHTML;

            // Kiểm tra xem tùy chọn đã được thêm vào textarea chưa
            if (textarea.value.indexOf(selectedOption) === -1) {
                // Thêm tùy chọn vào textarea
                textarea.value += selectedOption + " ";
            }
        });
    </script>
    <script>
        function showSelect() {
            var choice = document.getElementById("choice");
            var traineeSelect = document.getElementById("traineeSelect");
            var staffSelect = document.getElementById("staffSelect");
            var trainerSelect = document.getElementById("trainerSelect");

            traineeSelect.style.display = "none";
            staffSelect.style.display = "none";
            trainerSelect.style.display = "none";

            if (choice.value === "1") {
                traineeSelect.style.display = "inline";
            } else if (choice.value === "2") {
                trainerSelect.style.display = "inline";
            } else if (choice.value === "3") {
                staffSelect.style.display = "inline";
            }
        }
    </script>
</html>
