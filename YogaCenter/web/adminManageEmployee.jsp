<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Admin Dashboard</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="admin.css">
    </head>

    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-2">
                    <div class="sidebar">
                        <h3>Admin Dashboard</h3>
                        <ul>
                            <li>
                                <a href="/YogaCenter/request?action=AdminDashBoard">
                                    <i class="fas fa-user icon"></i>
                                    Admin DashBoard
                                </a>
                            </li>
                            <li>
                                <a href="/YogaCenter/request?action=ManageEmployee">
                                    <i class="fas fa-user icon"></i>
                                    Manage Trainer
                                </a>
                            </li>
                            <li>
                                <a href="/YogaCenter/request?action=ManageSchedule">
                                    <i class="fas fa-calendar-alt icon"></i>
                                    Manage Schedule
                                </a>
                            </li>
                            <li>
                                <a href="/YogaCenter/request?action=ManageUser">
                                    <i class="fas fa-users icon"></i>
                                    Manage User
                                </a>
                            </li>
                            <li>
                                <a href="/YogaCenter/request?action=adminCourseList">
                                    <i class="fas fa-book icon"></i>
                                    Course List
                                </a>
                            </li>
                        </ul>
                        <div class="divider"></div>
                        <h4>Settings</h4>
                        <ul>
                            <li>
                                <a href="/YogaCenter/request?action=Logout">
                                    <i class="fas fa-sign-out-alt icon"></i>
                                    Logout
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-10">
                    <h2 style="display: flex; justify-content: center; font-family: monospace;font-weight: 700; margin-top: 20px; text-transform: uppercase">
                        Manage Trainer
                    </h2>
                    <div style="display: flex; margin-left: 30%; margin-bottom: 2rem; margin-top: 2rem">
                        <form action="/YogaCenter/request" method="POST" class="form-search">
                            <div class="group">
                                <svg class="icon-search" aria-hidden="true" viewBox="0 0 24 24"><g><path d="M21.53 20.47l-3.66-3.66C19.195 15.24 20 13.214 20 11c0-4.97-4.03-9-9-9s-9 4.03-9 9 4.03 9 9 9c2.215 0 4.24-.804 5.808-2.13l3.66 3.66c.147.146.34.22.53.22s.385-.073.53-.22c.295-.293.295-.767.002-1.06zM3.5 11c0-4.135 3.365-7.5 7.5-7.5s7.5 3.365 7.5 7.5-3.365 7.5-7.5 7.5-7.5-3.365-7.5-7.5z"></path></g></svg>
                                <input placeholder="Search by Name Employee" type="text" name="txtsearch" value="${param.txtsearch}" class="input">
                                <input name="option" value="searchEmployee" hidden="">
                                <button name="action" value="search" class="btn-search">Tìm kiếm</button>
                            </div>
                        </form>
                    </div>
                    <c:set var="listEmployee" value="${requestScope.listEmployee}"/>
                    <c:set var="nulllist" value="${requestScope.nulllist}"/>
                    <c:if test="${listEmployee == null}">
                        <p style="text-align: center"><c:out value="${nulllist}"/></p>
                    </c:if>
                    <c:if test="${listEmployee != null && listEmployee.size() > 0}">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered">
                                <thead class="thead-dark">
                                    <tr>
                                        <th>STT</th>
                                        <th>Tài khoản</th>
                                        <th>Tên</th>
                                        <th>Ảnh</th>
                                        <th>Vai trò</th>
                                        <th>Status</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody class="font">
                                    <c:forEach var="employee" items="${listEmployee}" varStatus="loop">
                                        <tr>
                                            <td>${loop.count}</td>
                                            <td>${employee.account}</td>
                                            <td>${employee.name}</td>
                                            <td>
                                                <c:if test="${not empty employee.image}">
                                                    <img src="img/${employee.image}" width="100px" height="100px"></td>
                                                </c:if>
                                            <td>
                                                <c:if test="${employee.role == 0}">
                                                    Owner
                                                </c:if>
                                                <c:if test="${employee.role == 1}">
                                                    Nhân viên
                                                </c:if>
                                                <c:if test="${employee.role == 2}">
                                                    Trainer
                                                </c:if>
                                            </td>
                                            <td>
                                                <c:if test="${employee.status == 0 && employee.role == 0}">
                                                    <form>
                                                        <span>Hoạt động</span>&ensp; <input type="radio" name="status" value="0" checked="">
                                                        <span>Không Hoạt động</span>&ensp; <input type="radio" name="status" value="1" disabled="">
                                                    </form>
                                                </c:if>
                                                <c:if test="${employee.status == 0 && (employee.role == 1 || employee.role == 2)}">
                                                    <form action="/YogaCenter/request" method="POST">
                                                        <span>Hoạt động</span>&ensp; <input type="radio" name="status" value="0" checked="">
                                                        <span>Không hoạt động</span>&ensp; <input type="radio" name="status" value="1">
                                                        <input name="id" value="${employee.idaccount}" hidden="">
                                                        <input name="option" value="employeeChange" hidden="">
                                                        <button value="comfirm" name="action" class="btn-search">Xác nhận</button>
                                                    </form>
                                                </c:if>
                                                <c:if test="${employee.status == 1}">
                                                    <form action="/YogaCenter/request" method="POST">
                                                        <span>Hoạt động</span>&ensp; <input type="radio" name="status" value="0">
                                                        <span>Không hoạt động</span>&ensp; <input type="radio" name="status" value="1" checked="">
                                                        <input name="id" value="${employee.idaccount}" hidden="">
                                                        <input name="option" value="employeeChange" hidden="">
                                                        <button value="comfirm" name="action" class="btn-search">Xác nhận</button>
                                                    </form>
                                                </c:if>
                                            </td>
                                            <td>
                                                <a href="/YogaCenter/request?action=inf&id=${employee.idaccount}&option=infEmployee" class="btn btn-primary">Thông tin chi tiết</a>
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

        <style>
            .form-search{
                width: 470px;
            }
            .group {
                display: flex;
                justify-content: space-between;
                line-height: 28px;
                align-items: center;
                position: relative;
                max-width: 470px;
            }

            .input {
                width: 350px;
                height: 40px;
                line-height: 28px;
                padding: 0 1rem;
                padding-left: 2.5rem;
                border: 2px solid transparent;
                border-radius: 8px;
                outline: none;
                background-color: #f3f3f4;
                color: #0d0c22;
                transition: .3s ease;
            }

            .input::placeholder {
                color: #9e9ea7;
            }

            .input:focus, input:hover {
                outline: none;
                border-color: rgba(234,76,137,0.4);
                background-color: #fff;
                box-shadow: 0 0 0 4px rgb(234 76 137 / 10%);
            }

            .icon-search {
                position: absolute;
                left: 1rem;
                fill: #9e9ea7;
                width: 1rem;
                height: 1rem;
            }
            .btn-search {
                width: 100px;
                height: 35px;
                appearance: button;
                background-color: #1899D6;
                border: solid transparent;
                border-radius: 16px;
                border-width: 0 0 4px;
                box-sizing: border-box;
                color: #FFFFFF;
                cursor: pointer;
                display: inline-block;
                font-size: 15px;
                font-weight: 500;
                letter-spacing: .8px;
                line-height: 20px;
                margin: 0;
                outline: none;
                overflow: visible;
                padding: 8px 10px;
                text-align: center;
                text-transform: uppercase;
                touch-action: manipulation;
                transform: translateZ(0);
                transition: filter .2s;
                user-select: none;
                -webkit-user-select: none;
                vertical-align: middle;
                white-space: nowrap;
            }

            .btn-search:after {
                background-clip: padding-box;
                background-color: #1CB0F6;
                border: solid transparent;
                border-radius: 16px;
                border-width: 0 0 4px;
                bottom: -4px;
                content: "";
                left: 0;
                position: absolute;
                right: 0;
                top: 0;
                z-index: -1;
            }

            .btn-search:main, button:focus {
                user-select: auto;
            }

            .btn-search:hover:not(:disabled) {
                filter: brightness(1.1);
            }

            .btn-search:disabled {
                cursor: auto;
            }

            .btn-search:active:after {
                border-width: 0 0 0px;
            }

            .btn-search:active {
                padding-bottom: 10px;
            }
        </style>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
    </body>
</html>