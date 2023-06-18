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
        <link rel="stylesheet" href="css/style.css"/>
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
    </style>
    <c:import url="header.jsp"/>
    <body>
        <div class="container">
            <h2>Purchase history</h2>
            <div class="container mt-5">
                <div class="d-flex justify-content-center row">
                    <div class="col-md-10">
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
                                        </tr>
                                    </thead>
                                    <tbody class="table-body">
                                        <%
                                            Account account = (Account) session.getAttribute("account");
                                            HashMap<Integer, ArrayList<OrderCourse>> purchase = OrderCourseDao.getPurchaseByTrainee(account.getIdaccount());
                                            if (purchase != null) {
                                                TreeMap<Integer, ArrayList<OrderCourse>> sortedPurchase = new TreeMap<>(purchase);
                                                boolean isFirstRow = true;
                                                int rowNumber = 0;
                                                for (Map.Entry<Integer, ArrayList<OrderCourse>> entry : sortedPurchase.entrySet()) {
                                                    int OrderID = entry.getKey();
                                                    ArrayList<OrderCourse> orderDetail = entry.getValue();
                                                    int totalPrice = 0;
                                                    for (OrderCourse order : orderDetail) {
                                                        totalPrice += order.getTotalPrice().intValue();
                                                    }
                                                    NumberFormat nf = NumberFormat.getInstance(new Locale("vi", "VN"));

                                                    for (OrderCourse order : orderDetail) {

                                        %>
                                        <tr class="cell-1 <%= rowNumber % 2 == 0 ? "alternate-row" : ""%>">

                                            <% if (isFirstRow) {%>
                                            <th rowspan="<%= orderDetail.size()%>"><%= rowNumber + 1%></td>
                                                <% }%>
                                            <th><%= order.getCourseName()%></th>
                                                <% if (isFirstRow) {%>
                                            <th rowspan="<%= orderDetail.size()%>"><%= order.getDateorder()%></td>
                                                <% }
                                                    if (isFirstRow) {%>
                                            <th rowspan="<%= orderDetail.size()%>"><%= nf.format(totalPrice)%>.000 VNĐ</td>
                                                <% }
                                                    switch (order.getPaymentMethod()) {
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
                                                    isFirstRow = false;
                                                %>
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

    </body>
    <c:import url="footer.html"></c:import>
</html>