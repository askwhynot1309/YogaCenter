<%-- 
    Document   : traineeManagePurchase
    Created on : Jun 12, 2023, 3:33:20 PM
    Author     : ngmin
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="Dao.OrderCourseDao"%>
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
    </style>
    <body>
        <c:import url="header.jsp"></c:import>
        <div class="container" style="padding-top: 200px;">
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
                                                <th>Company name</th>
                                                <th>status</th>
                                                <th>Total</th>
                                                <th>Created</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody class="table-body">
                                            <tr class="cell-1">
                                                <td></td>
                                                <td></td>
                                                <td><span class="badge badge-success">Success</span></td>
                                                <td></td>
                                                <td></td>
                                                <td><i class="fa fa-ellipsis-h text-black-50"></i></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
            <div class="container" style="margin-top: 150px;">
                <h2 style="text-align: center">Purchase history</h2>
                <div class="row">
                    <table class="col">
                        <thead>
                            <tr>
                                <th style="border-right: solid 0.5px;" class="col-lg-2">Order ID</th>
                                <th class="col-lg-2">Course name</th>
                                <th class="col-lg-2">Date</th>
                                <th class="col-lg-2">Total price</th>
                                <th class="col-lg-2">Payment method</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%
                            Account account = (Account) session.getAttribute("account");

                            HashMap<Integer, ArrayList<OrderCourse>> purchase = OrderCourseDao.getPurchaseByTrainee(account.getIdaccount());
                            if (purchase != null) {
                                boolean isFirstRow = true;
                                for (Map.Entry<Integer, ArrayList<OrderCourse>> entry : purchase.entrySet()) {
                                    int OrderID = entry.getKey();
                                    ArrayList<OrderCourse> orderDetail = entry.getValue();

                                    for (OrderCourse order : orderDetail) {
                        %>
                        <tr style="border-top: solid 0.5px">

                            <% if (isFirstRow) {%>
                            <th style="border-right: solid 0.5px; vertical-align: top;" class="col-lg-2" rowspan="<%= orderDetail.size()%>"><%= OrderID%></td>
                                <% isFirstRow = false; %>
                                <% }%>
                            <th class="col-lg-2"><%= order.getCourseName()%></th>
                            <th class="col-lg-2"><%= order.getDateorder()%></th>
                            <th class="col-lg-2"><%= order.getTotalPrice()%></th>
                            <th class="col-lg-2"><%= order.getPaymentMethod()%></th>

                        </tr>
                        <%
                                    }
                                    isFirstRow = true;
                                }
                            }
                        %>

                    </tbody>
                </table>
            </div>
        </div>

    </body>
</html>
