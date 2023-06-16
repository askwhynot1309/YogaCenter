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
    </style>
    <body>
        <c:import url="headerTrainee.jsp"></c:import>

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
                <!--                <script>
                                    function refreshOrders() {
                                        if (localStorage.getItem('orders') !== null && localStorage.getItem('orders') !== {} ) {
                                            let orders = JSON.parse(localStorage.getItem('orders'));
                                            let items = "";
                                            for (const [k, c] of Object.entries(orders)) {
                                                console.log(c);
                                                items += '<tr class="cell-1">'
                                                        + '<td>' + k + '</td>'
                                                        + '<td>' + c.item.name + '</td>'
                                                        + '<td><span class="badge badge-success">Success</span></td>'
                                                        + '<td>' + c.item.price + '</td>'
                                                        + '<td>' + c.datetime + '</td>'
                                                        + '<td><i class="fa fa-ellipsis-h text-black-50"></i></td>'
                                                        + '</tr>';
                                            }
                                            document.getElementById('orderItems').innerHTML = items;
                                        }
                                    }
                                    refreshOrders();
                                </script>-->
                <!--                <div class="row">
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

            %>
            <tr style="border-top: solid 0.5px">


                <th style="border-right: solid 0.5px;" class="col-lg-2" rowspan="">2</th>

                <th class="col-lg-2">1</th>
                <th class="col-lg-2">2</th>
                <th class="col-lg-2">3</th>
                <th class="col-lg-2">4</th>

            </tr>


        </tbody>
    </table>
</div>-->
        </div>

    </body>
    <c:import url="footer.html"></c:import>
</html>