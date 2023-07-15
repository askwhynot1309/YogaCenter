<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html style="overflow-y: scroll">

    <head>
        <title>Admin Dashboard</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="icon" type="image/x-icon" href="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png">
        <link rel="stylesheet" href="css/admin/admin.css">
        <link rel="stylesheet" href="css/admin/admin-employee-add.css">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <style>
            .dashboard-item .card-body i {
                margin-bottom: 1px;
            }

            .feedback-heading {
                font-size: 1.2em;
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
        </style>
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
                <div class="col-lg-3" style="padding: 0; position: fixed">
                    <c:import url="adminMenu.jsp"/>
                </div>
                <div class="col-lg-9" style="padding-right: 100px; margin-left: 350px">
                    <c:set var="message" value="${requestScope.message}"/>
                    <h2 class="text-center" style="margin-top: 20px;">Yoga Center Statistics</h2>
                    <div class="d-flex justify-content-center" style="margin-top: 30px;">
                        <div class="row justify-content-between flex-wrap">
                            <div class="col-md-3" >
                                <div class="dashboard-item mb-4" >
                                    <div class="card-body border d-flex align-items-center" style="height: 150px">
                                        <i class="fas fa-users fa-3x mb-3 text-primary mr-3" style="margin-right: 5px;"></i>
                                        <div>
                                            <h5 class="card-title mb-1">Total Customer</h5>
                                            <h2 class="card-title mb-0">${requestScope.customerCount}</h2>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="dashboard-item mb-4">
                                    <div class="card-body border d-flex align-items-center" style="height: 150px">
                                        <i class="fas fa-users-cog fa-3x text-success" style="margin-right: 5px;"></i>
                                        <div>
                                            <h5 class="card-title mb-1">Total Employee</h5>
                                            <h2 class="card-title mb-0">${requestScope.employeeCount}</h2>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="dashboard-item mb-4">
                                    <div class="card-body border d-flex align-items-center" style="height: 150px">
                                        <i class="fas fa-book fa-3x text-info" style="margin-right: 5px;"></i>
                                        <div>
                                            <h5 class="card-title mb-1">Total Course</h5>
                                            <h2 class="card-title mb-0">${requestScope.courseCount}</h2>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="dashboard-item mb-4">
                                    <div class="card-body border d-flex align-items-center" style="height: 150px">
                                        <i class="fas fa-shopping-cart fa-3x text-warning" style="margin-right: 5px;"></i>
                                        <div>
                                            <h5 class="card-title mb-1">Pending Orders</h5>
                                            <h2 class="card-title mb-0">${requestScope.pendingOrders}</h2>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <hr class="my-4">
                            </div>

                            <div class="col-md-3">
                                <h3 class="text-center" style="margin-top: 20px;">Yoga Course Level Statistics</h3>
                                <div class="d-flex justify-content-center align-items-center" style="height: 500px;">
                                    <canvas id="pieChart" width="350" height="350"></canvas>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <h3 class="text-center" style="margin-top: 20px;">Yoga Course Order Statistics</h3>
                                <div class="d-flex justify-content-center align-items-center" style="height: 500px;">
                                    <canvas id="lineChart" width="500" height="500"></canvas>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="dashboard-item mb-5">
                                    <div class="card text-center">
                                        <div class="card-body">
                                            <i class="fas fa-envelope fa-3x text-success d-flex align-self-left"></i>
                                            <div>
                                                <h5 class="card-title mb-1 text-left feedback-heading">Latest feedback message</h5>

                                                <c:forEach var="msg" items="${requestScope.msg}" varStatus="loop">
                                                    <c:if test="${loop.index < 3}">
                                                        <div class="text-left">
                                                            <p><strong>From: ${msg.dateSend}</strong></p>
                                                            <p>Message: ${msg.message}</p>
                                                            <hr class="my-4">
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <c:if test="${message != null}">
                <div class="notification-success" style="height: 100px">
                    <div class="content">
                        <div class="title">Notification</div>
                        <span>There is a course to create a class, you need to create a class now!!!!</span>
                    </div>
                </div>
                <script>
                    let notification = document.querySelector('.notification-success');
                    notification.timeOut = setTimeout(() => notification.remove(), 5000);
                </script>
            </c:if>

            <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
    </body>
    <script>
                    // Get the canvas element
                    var pieChartCanvas = document.getElementById('pieChart').getContext('2d');

                    // Get the level counts from the request attribute
                    var levelCounts = <%= request.getAttribute("level")%>;

                    var pie = {
                        labels: ['Easy', 'Medium', 'Advanced'],
                        datasets: [{
                                data: levelCounts,
                                backgroundColor: ['lightgreen', 'yellow', 'red'],
                            }]
                    };

                    // Create the pie chart
                    var pieChart = new Chart(pieChartCanvas, {
                        type: 'pie',
                        data: pie,
                        options: {
                            responsive: false,
                            maintainAspectRatio: true,
                        }
                    });
    </script>


    <script>
        var lineChartCanvas = document.getElementById('lineChart').getContext('2d');
        var chartData = {
            labels: [
        <% for (Object label : (List<?>) request.getAttribute("labels")) {%>
                "<%= label%>",
        <% } %>
            ],
            datasets: [{
                    label: 'Order Count',
                    data: [
        <% for (Object value : (List<?>) request.getAttribute("data")) {%>
        <%= value%>,
        <% }%>
                    ],
                    borderColor: 'green',
                            backgroundColor: 'transparent',
                    borderWidth: 2
                }]
        };
        var lineChart = new Chart(lineChartCanvas, {
            type: 'line',
            data: chartData,
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: {
                        beginAtZero: true,
                        ticks: {
                            stepSize: 1
                        }
                    }
                }
            }
        });
    </script>


</html>