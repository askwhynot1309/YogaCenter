<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/x-icon" href="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png">
        <link rel="stylesheet" href="css/admin/admin.css">
        <link rel="stylesheet" href="css/admin/admin-user.css">
        <link rel="stylesheet" href="css/admin/admin-table.css">
        <link rel="stylesheet" href="css/admin/admin-course.css">
        <link rel="stylesheet" href="css/admin/admin-course-add.css">
        <title>Admin Dashboard</title>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3" style="padding: 0">
                    <c:import url="adminMenu.jsp"></c:import>
                    </div>
                    <div class="col-lg-9">
                        <h2 style="display: flex; justify-content: center; margin-bottom: 10px; font-family: monospace;font-weight: 700; margin-top: 20px; text-transform: uppercase">View booking</h2>
                    <c:set var="listOrder" value="${requestScope.listOrder}"/>
                    <c:set var="nulllist" value="${requestScope.nulllist}"/>
                    <c:if test="${listOrder == null}">
                        <p style="text-align: center"><c:out value="${nulllist}"/></p>
                    </c:if>
                    <c:if test="${listOrder != null && !listOrder.isEmpty()}">
                        <div class="tbl-header">
                            <table cellpadding="0" cellspacing="0" border="0">
                                <thead>
                                    <tr>
                                        <th style="width: 50px">No.</th>
                                        <th>Name</th>
                                        <th style="width: 150px">Order-date</th>
                                        <th style="width: 150px">Method</th>
                                        <th style="width: 450px">Status</th>
                                        <th>Detail</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="tbl-content" style="height: 500px">
                            <table cellpadding="0" cellspacing="0" border="0">
                                <tbody>
                                    <c:forEach var="order" items="${listOrder}" varStatus="loop">
                                        <tr>
                                            <td style="width: 50px">${loop.count}</td>
                                            <td>${order.name_account}</td>
                                            <td style="width: 150px">${order.dateorder}</td>
                                            <td style="width: 150px">
                                                <c:if test="${order.method == 0}">
                                                    Cash 
                                                </c:if>
                                                <c:if test="${order.method == 1}">
                                                    Banking 
                                                </c:if>
                                            </td>
                                            <td style="width: 450px">
                                                <form action="/YogaCenter/request" method="POST">
                                                    <c:if test="${order.status == 0}">
                                                        <p style="color: yellowgreen">Processing</p>
                                                    </c:if>
                                                    <c:if test="${order.status == 1}">
                                                        <p style="color: green">Completed</p>
                                                    </c:if>
                                                    <c:if test="${order.status == 2}">
                                                        <p style="color: red">Cancel</p>
                                                    </c:if>
                                                </form>
                                            </td>
                                            <td><a href="/YogaCenter/request?action=inf&option=infOrder&id=${order.id_order}" class="btn btn-primary">View more</a></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </body>
</html>
