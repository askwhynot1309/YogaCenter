<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/admin/admin.css">
        <link rel="stylesheet" href="css/admin/admin-user.css">
        <link rel="stylesheet" href="css/admin/admin-table.css">
        <link rel="stylesheet" href="css/admin/admin-course.css">
        <link rel="stylesheet" href="css/admin/admin-course-add.css">
        <title>Staff Dashboard</title>
    </head>
    <body>
       <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3" style="padding: 0">
                    <c:import url="staffMenu.jsp"></c:import>
                    </div>
                    <div class="col-lg-8">
                        <h2 style="display: flex; justify-content: center; margin-bottom: 10px; font-family: monospace;font-weight: 700; margin-top: 20px; text-transform: uppercase">View booking</h2>
                    <c:set var="listinf" value="${requestScope.listinf}"/>
                    <c:set var="total" value="${0}"/>
                    <c:if test="${listinf != null && !listinf.isEmpty()}">
                        <div class="tbl-header">
                            <table cellpadding="0" cellspacing="0" border="0">
                                <thead>
                                    <tr>
                                        <th style="width: 50px">No.</th>
                                        <th>Course name</th>
                                        <th>Quantity</th>
                                        <th>Price</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="tbl-content" style="height: 500px">
                            <table cellpadding="0" cellspacing="0" border="0">
                                <tbody>
                                    <c:forEach var="order" items="${listinf}" varStatus="loop">
                                        <tr>
                                            <td style="width: 50px">${loop.count}</td>
                                            <td>${order.name_course}</td>
                                            <td>${order.quantity}</td>
                                            <td>${order.fee_course}</td>
                                        </tr>
                                        <c:set var="total" value="${total + order.fee_course}"/>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <h3 style="float: right">Total : <c:out value="${total}"/> VNĐ</h3>
                    </c:if>
                </div>
            </div>
        </div>
    </body>
</html>
