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
        <title>Management Booking</title>
        <style>
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
        <c:set var="exist" value="${sessionScope.Staff}"/>
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
                    <c:import url="staffMenu.jsp"></c:import>
                    </div>
                    <div class="col-lg-9">
                        <h2 style="display: flex; justify-content: center; margin-bottom: 10px; font-family: monospace;font-weight: 700; margin-top: 20px; text-transform: uppercase">View booking</h2>
                        <div style="display: flex; margin-left: 30%; margin-bottom: 2rem; margin-top: 2rem">
                            <form action="/YogaCenter/request" method="POST" class="form-search">
                                <div class="group">
                                    <svg class="icon-search" aria-hidden="true" viewBox="0 0 24 24"><g><path d="M21.53 20.47l-3.66-3.66C19.195 15.24 20 13.214 20 11c0-4.97-4.03-9-9-9s-9 4.03-9 9 4.03 9 9 9c2.215 0 4.24-.804 5.808-2.13l3.66 3.66c.147.146.34.22.53.22s.385-.073.53-.22c.295-.293.295-.767.002-1.06zM3.5 11c0-4.135 3.365-7.5 7.5-7.5s7.5 3.365 7.5 7.5-3.365 7.5-7.5 7.5-7.5-3.365-7.5-7.5z"></path></g></svg>
                                    <input placeholder="Search email order" type="text" name="txtsearch" value="${param.txtsearch}" class="input">
                                <input name="option" value="staffSearchOrder" hidden="">
                                <input name="date" type="date" style="margin-left: 20px">
                                <button name="action" value="search" class="btn-search" style="margin-left: 20px">Search</button>
                            </div>
                        </form>
                    </div>
                    <c:set var="listOrder" value="${requestScope.listOrder}"/>
                    <c:set var="nulllist" value="${requestScope.nulllist}"/>
                    <c:if test="${listOrder.size() == 0}">
                        <p style="text-align: center"><c:out value="${nulllist}"/></p>
                    </c:if>
                    <c:if test="${listOrder != null && !listOrder.isEmpty()}">
                        <div class="tbl-header">
                            <table cellpadding="0" cellspacing="0" border="0">
                                <thead>
                                    <tr>
                                        <th style="width: 150px">Order Code</th>
                                        <th style="width: 200px">Name</th>
                                        <th style="width: 150px">Order-date</th>
                                        <th style="width: 150px">Method</th>
                                        <th style="width: 300px">Status</th>
                                        <th>Detail</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="tbl-content" style="height: 450px">
                            <table cellpadding="0" cellspacing="0" border="0">
                                <tbody>
                                    <c:forEach var="order" items="${listOrder}" varStatus="loop">
                                        <tr>
                                            <td style="width: 150px">ORD${order.id_order}</td>
                                            <td style="width: 200px">${order.name_account}</td>
                                            <td style="width: 150px">${order.dateorder}</td>
                                            <td style="width: 150px">
                                                <c:if test="${order.method == 0}">
                                                    Cash 
                                                </c:if>
                                                <c:if test="${order.method == 1}">
                                                    Banking 
                                                </c:if>
                                                <c:if test="${order.method == 2}">
                                                    Account money
                                                </c:if>
                                            </td>
                                            <td style="width: 300px">
                                                <form action="/YogaCenter/request" method="POST">
                                                    <c:if test="${order.status == 0}">
                                                        <select name="status">
                                                            <option value="2">Cancel</option>
                                                            <option value="0" selected="">Processing</option>
                                                            <option value="1">Completed</option>
                                                        </select>
                                                        <input name="option" value="orderChange" hidden="">
                                                        <input name="id" value="${order.id_order}" hidden="">
                                                        <button name="action" value="comfirm" class="btn-search">Change</button>
                                                    </c:if>
                                                    <c:if test="${order.status == 1}">
                                                        <select name="status">
                                                            <option value="2" disabled="">Cancel</option>
                                                            <option value="0" disabled="">Processing</option>
                                                            <option value="1" selected="">Completed</option>
                                                        </select>
                                                        <input name="option" value="orderChange" hidden="">
                                                        <input name="id" value="${order.id_order}" hidden="">
                                                        <button name="action" value="comfirm" class="btn-search">Change</button>
                                                    </c:if>
                                                    <c:if test="${order.status == 2}">
                                                        <select name="status">
                                                            <option value="2" selected="">Cancel</option>
                                                            <option value="0" disabled="">Processing</option>
                                                            <option value="1">Completed</option>
                                                        </select>
                                                        <input name="option" value="orderChange" hidden="">
                                                        <input name="id" value="${order.id_order}" hidden="">
                                                        <button name="action" value="comfirm" class="btn-search">Change</button>
                                                    </c:if>
                                                </form>
                                            </td>
                                            <td><a href="/YogaCenter/request?action=inf&option=staffinfOrder&id=${order.id_order}" class="btn btn-primary">View more</a></td>
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
