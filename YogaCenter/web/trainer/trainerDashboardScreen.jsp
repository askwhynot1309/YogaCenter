<%--
    Document   : trainerDashboardScreen
    Created on : Jun 28, 2023, 7:45:27 PM
    Author     : CCLaptop
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <style>
            .dashboard-item .card-body i {
                margin-bottom: 1px;
            }
            .feedback-heading {
                font-size: 1.3em;
            }

        </style>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3" style="padding: 0;">
                    <jsp:include page="trainerDashboard.jsp" />
                </div>

                <div class="col-lg-9" style="padding-right: 100px;">
                    <h2 class="text-center" style="margin-top: 20px;">Yoga Center Statistics</h2>
                    <div class="d-flex justify-content-center" style="margin-top: 30px;">
                        <div class="row justify-content-between flex-wrap">
                            <div class="col-md-3">
                                <div class="dashboard-item mb-4">
                                    <div class="card-body border d-flex align-items-center">
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
                                    <div class="card-body border d-flex align-items-center">
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
                                    <div class="card-body border d-flex align-items-center">
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
                                    <div class="card-body border d-flex align-items-center">
                                        <i class="fas fa-calendar-alt fa-3x text-warning" style="margin-right: 5px;"></i>
                                        <div>
                                            <h5 class="card-title mb-1">Date</h5>
                                            <h2 class="card-title mb-0" id="current-date"></h2>
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
                            <div class="col-md-6">
                                <h3 class="text-center" style="margin-top: 20px;">Yoga Course Order Statistics</h3>
                                <div class="d-flex justify-content-center align-items-center" style="height: 500px;">
                                    <canvas id="lineChart" width="500" height="500"></canvas>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="dashboard-item mb-5">
                                    <div class="card text-center">
                                        <div class="card-body">
                                            <i class="fas fa-envelope fa-3x text-success d-flex align-self-left"></i>
                                            <div>
                                                <h5 class="card-title mb-1 text-left feedback-heading">Latest feedback message</h5>

                                                <c:forEach var="msg" items="${requestScope.message}" varStatus="loop">
                                                    <c:if test="${loop.index < 3}">
                                                        <div class="text-left">
                                                            <p><strong>From: ${msg.sender}</strong></p>
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
        </div>

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

        <script>
            // Get the current date
            var currentDate = new Date();

            var formattedDate = currentDate.toLocaleDateString("en-US", {
                month: 'long',
                day: 'numeric'
            });

            // Set the formatted date to the element with id "current-date"
            document.getElementById("current-date").textContent = formattedDate;
        </script>

    </body>
</html>
