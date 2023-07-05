<%@page import="java.util.TreeMap"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="Dao.OrderCourseDao"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="Object.OrderCourse"%>
<%@page import="Object.Account"%>
<%@page import="Dao.CourseDao"%>
<%@page import="Object.Course"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <title>Purchase History</title>
    </head>
    <style>
        thead {
            background: #dddcdc;
        }

        .toggle-btn {
            width: 40px;
            height: 21px;
            background: grey;
            border-radius: 50px;
            padding: 3px;
            cursor: pointer;
            -webkit-transition: all 0.3s 0.1s ease-in-out;
            -moz-transition: all 0.3s 0.1s ease-in-out;
            -o-transition: all 0.3s 0.1s ease-in-out;
            transition: all 0.3s 0.1s ease-in-out;
        }

        .toggle-btn > .inner-circle {
            width: 15px;
            height: 15px;
            background: #fff;
            border-radius: 50%;
            -webkit-transition: all 0.3s 0.1s ease-in-out;
            -moz-transition: all 0.3s 0.1s ease-in-out;
            -o-transition: all 0.3s 0.1s ease-in-out;
            transition: all 0.3s 0.1s ease-in-out;
        }

        .toggle-btn.active {
            background: blue !important;
        }

        .toggle-btn.active > .inner-circle {
            margin-left: 19px;
        }
        .cell-1 th{
            vertical-align: middle;
        }

        .container{
            margin: 50px auto;
        }

        .alternate-row{
            background-color: #f1f3f4;
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
        body{
            font-size: 100%;
        }
        a:hover{
            text-decoration: none;
        }
    </style>
    <c:import url="header.jsp"/>
    <body class="w3-light-grey">
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
                <a href="traineeGeneralDashboard.jsp" class="w3-bar-item w3-button w3-padding"><i class="fa fa-users fa-fw"></i>  General</a>
                <a href="information" class="w3-bar-item w3-button w3-padding"><i class="fa fa-eye fa-fw"></i>  Views</a>
                <a href="/YogaCenter/classbooking" class="w3-bar-item w3-button w3-padding"><i class="fas fa-calendar-alt icon"></i>  My learning</a>
                <a href="/YogaCenter/purchase" class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa fa-history fa-fw"></i> Purchase History</a>
                <a href="/YogaCenter/request?action=ChangePassword" class="w3-bar-item w3-button w3-padding"><i class="fa fa-cog fa-fw"></i>  Settings</a><br><br>
            </div>
        </nav>
        <div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer"
             title="close side menu" id="myOverlay">
        </div>

        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:300px;">
            <div class="container">
                <h2>Purchase history</h2>
                <c:set var="addsuccess" value="${requestScope.addsuccess}"></c:set>
                <c:set var="money" value="${requestScope.money}"></c:set>
                    <div class="container mt-5">
                        <div class="d-flex justify-content-center row">
                            <div class="col-md-12">
                                <div class="rounded">
                                    <div class="table-responsive table-borderless">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>Order #</th>
                                                    <th>Course name</th>
                                                    <th>Date</th>
                                                    <th>Total</th>
                                                    <th>Payment method</th>
                                                    <th>Status</th>
                                                    <th>Note</th>
                                                </tr>
                                            </thead>
                                            <tbody class="table-body">
                                            <%
                                                Account account = (Account) session.getAttribute("account");
                                                HashMap<Integer, ArrayList<OrderCourse>> purchase = (HashMap<Integer, ArrayList<OrderCourse>>) request.getAttribute("purchase");
                                                if (purchase != null) {
                                                    TreeMap<Integer, ArrayList<OrderCourse>> sortedPurchase = new TreeMap<>(purchase);
                                                    boolean isFirstRow = true;
                                                    int rowNumber = 0;
                                                    for (Map.Entry<Integer, ArrayList<OrderCourse>> entry : sortedPurchase.entrySet()) {
                                                        int OrderID = entry.getKey();
                                                        ArrayList<OrderCourse> orderDetail = entry.getValue();
                                                        int totalPrice = 0;
                                                        for (OrderCourse order : orderDetail) {
                                                            totalPrice += order.getFee_course().intValue();
                                                        }
                                                        NumberFormat nf = NumberFormat.getInstance(new Locale("vi", "VN"));

                                                        for (OrderCourse order : orderDetail) {

                                            %>
                                            <tr class="cell-1 <%= rowNumber % 2 == 0 ? "alternate-row" : ""%>">

                                                <% if (isFirstRow) {%>
                                                <th rowspan="<%= orderDetail.size()%>"><%= rowNumber + 1%></td>
                                                    <% }%>
                                                <th><a href="/YogaCenter/request?action=inf&option=viewmore&id=<%=order.getId_course()%>"><%= order.getName_course()%></a> </th>
                                                    <% if (isFirstRow) {%>
                                                <th rowspan="<%= orderDetail.size()%>"><%= order.getDateorder()%></td>
                                                    <% }
                                                        if (isFirstRow) {%>
                                                    <c:if test="${money == null}">
                                                    <th rowspan="<%= orderDetail.size()%>"><%= nf.format(totalPrice)%>.000 VNĐ</td>
                                                    </c:if>
                                                    <c:if test="${money != null}">
                                                    <th rowspan="<%= orderDetail.size()%>">${money} VNĐ</td>
                                                    </c:if>
                                                    <% }
                                                        switch (order.getMethod()) {
                                                            case 0:
                                                                if (isFirstRow) {%>
                                                <th rowspan="<%= orderDetail.size()%>">Cash</td>
                                                    <% }
                                                            break;
                                                        case 1:
                                                            if (isFirstRow) {%>
                                                <th rowspan="<%= orderDetail.size()%>">Bank Transfer</td>
                                                    <% }
                                                                break;
                                                        }

                                                        switch (order.getStatus()) {
                                                            case 0:
                                                                if (isFirstRow) {%>
                                                <th rowspan="<%= orderDetail.size()%>"><span class="badge badge-primary">Pending</span></th>
                                                    <% }
                                                            break;
                                                        case 1:
                                                            if (isFirstRow) {%>
                                                <th rowspan="<%= orderDetail.size()%>"><span class="badge badge-success">Success</span></th>
                                                    <% }
                                                            break;
                                                        case 2:
                                                            if (isFirstRow) {%>
                                                <th rowspan="<%= orderDetail.size()%>"><a class="badge badge-danger" href="/YogaCenter/request?action=TraineeReoder&oID=<%=OrderID%>">Cancel</a></th>
                                                    <% }
                                                                break;
                                                        }
                                                        if (isFirstRow) {

                                                    %>
                                                <th style="color: red; font-weight: 900;" rowspan="<%= orderDetail.size()%>">
                                                    <%
                                                        if (order.getStatus() == 0) {
                                                    %>Please complete order in 10 days<%
                                                        }
                                                    %>
                                                </th>
                                                <%
                                                    }
                                                %>

                                                <%isFirstRow = false;%>
                                            </tr>
                                            <%
                                                        }
                                                        isFirstRow = true;
                                                        rowNumber++;
                                                    }
                                                }
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <c:if test="${addsuccess != null}">
            <div class="notification-success" style="z-index: 1000">
                <div class="content">
                    <div class="title">Success</div>
                    <span>Buy courses successfully.</span>
                </div>
            </div>
            <script>
                let notification = document.querySelector('.notification-success');
                notification.timeOut = setTimeout(() => notification.remove(), 3000);
            </script>
        </c:if>
    </body>
    <%--<c:import url="footer.html"></c:import>--%>
</html>