<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Admin Dashboard</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="icon" type="image/x-icon" href="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png">
        <link rel="stylesheet" href="css/admin/admin.css">
        <link rel="stylesheet" href="css/admin/admin-user.css">
        <link rel="stylesheet" href="css/admin/admin-table.css">
    </head>

    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-2" style="padding: 0">
                    <c:import url="adminMenu.jsp"></c:import>
                    </div>
                    <div class="col-lg-10">
                        <h2 style="display: flex; justify-content: center; font-family: monospace;font-weight: 700; margin-top: 20px; text-transform: uppercase">
                            Manage User
                        </h2>
                        <div style="display: flex; margin-left: 30%; margin-bottom: 2rem; margin-top: 2rem">
                            <form action="/YogaCenter/request" method="POST" class="form-search">
                                <div class="group">
                                    <svg class="icon-search" aria-hidden="true" viewBox="0 0 24 24"><g><path d="M21.53 20.47l-3.66-3.66C19.195 15.24 20 13.214 20 11c0-4.97-4.03-9-9-9s-9 4.03-9 9 4.03 9 9 9c2.215 0 4.24-.804 5.808-2.13l3.66 3.66c.147.146.34.22.53.22s.385-.073.53-.22c.295-.293.295-.767.002-1.06zM3.5 11c0-4.135 3.365-7.5 7.5-7.5s7.5 3.365 7.5 7.5-3.365 7.5-7.5 7.5-7.5-3.365-7.5-7.5z"></path></g></svg>
                                    <input placeholder="Search by ..." type="text" name="txtsearch" value="${param.txtsearch}" class="input">
                                <select name="choice" style="margin-left: 20px; margin-right: 20px">
                                    <option value="1">Name</option>
                                    <option value="2">Email</option>
                                    <option value="2">Phone</option>
                                </select>
                                <input name="option" value="searchUser" hidden="">
                                <button name="action" value="search" class="btn-search">Search</button>
                            </div>
                        </form>
                    </div>
                    <c:set var="listUser" value="${requestScope.listUser}"/>
                    <c:set var="nulllist" value="${requestScope.nulllist}"/>
                    <c:if test="${listUser == null}">
                        <p style="text-align: center"><c:out value="${nulllist}"/></p>
                    </c:if>
                    <c:if test="${listUser != null && !listUser.isEmpty()}">
                        <div class="tbl-header">
                            <table cellpadding="0" cellspacing="0" border="0">
                                <thead>
                                    <tr>
                                        <th style="width: 50px">No.</th>
                                        <th>Email</th>
                                        <th>Name</th>
                                        <th style="width: 100px">Phone</th>
                                        <th>Address</th>
                                        <th style="width: 300px">Status</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="tbl-content" style="height: 400px">
                            <table cellpadding="0" cellspacing="0" border="0">
                                <tbody>
                                    <c:forEach var="user" items="${listUser}" varStatus="loop">
                                        <tr>
                                            <td style="width: 50px">${loop.count}</td>
                                            <td>${user.email}</td>
                                            <td>${user.name}</td>
                                            <td style="width: 100px">${user.phone}</td>
                                            <td>${user.address}</td>
                                            <td style="width: 300px">
                                                <c:if test="${user.status == 0}">
                                                    <form action="/YogaCenter/request" method="POST">
                                                        <span>Active</span>&ensp; <input type="radio" name="status" value="0" checked="">
                                                        <span>Unactive</span>&ensp; <input type="radio" name="status" value="1">
                                                        <input name="id" value="${user.idaccount}" hidden="">
                                                        <input name="option" value="userChange" hidden="">
                                                        <button value="comfirm" name="action" class="btn-search">Change</button>
                                                    </form>
                                                </c:if>
                                                <c:if test="${user.status == 1}">
                                                    <form action="/YogaCenter/request" method="POST">
                                                        <span>Active</span>&ensp; <input type="radio" name="status" value="0">
                                                        <span>Unactive</span>&ensp; <input type="radio" name="status" value="1" checked="">
                                                        <input name="id" value="${user.idaccount}" hidden="">
                                                        <input name="option" value="userChange" hidden="">
                                                        <button value="comfirm" name="action" class="btn-search">Change</button>
                                                    </form>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
    </body>
    <script>
        $(window).on("load resize ", function () {
            var scrollWidth = $('.tbl-content').width() - $('.tbl-content table').width();
            $('.tbl-header').css({'padding-right': scrollWidth});
        }).resize();
    </script>
</html>