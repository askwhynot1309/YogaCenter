<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Admin Dashboard</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link rel="stylesheet" href="admin.css">
    </head>

    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3">
                    <div class="sidebar">
                        <h3>Admin Dashboard</h3>
                        <ul>
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
                <div class="col-lg-9">
                    <h2 style="display: flex; justify-content: center">
                        Manage Trainer
                    </h2>
                    <div style="display: flex; float: right; margin-bottom: 10px;">
                        <form action="/request" method="POST">
                            <input type="text" name="txtUsername" value="" />
                            <input name="option" value="searchEmployee" hidden="">
                            <input type="submit" name="action" value="Tìm kiếm"/>
                        </form>
                    </div>
                    <c:set var="listEmployee" value="${requestScope.listEmployee}"/>
                    <c:if test="${listEmployee != null && listEmployee.size() > 0}">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered">
                                <thead class="thead-dark">
                                    <tr>
                                        <th>STT</th>
                                        <th>Tài khoản</th>
                                        <th>Mật khẩu</th>
                                        <th>Tên</th>
                                        <th>CCCD</th>
                                        <th>Điện thoại</th>
                                        <th>Địa chỉ</th>
                                        <th>Ảnh</th>
                                        <th>Vai trò</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="employee" items="${listEmployee}" varStatus="loop">
                                        <tr>
                                            <td>${loop.count}</td>
                                            <td>${employee.account}</td>
                                            <td>${employee.password}</td>
                                            <td>${employee.name}</td>
                                            <td>${employee.cccd}</td>
                                            <td>${employee.phone}</td>
                                            <td>${employee.address}</td>
                                            <td><<img src="img/${employee.image}" width="100px" height="100px"></td>
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
                                                <c:if test="${employee.status == 0}">
                                                    <span>Hoạt động</span> <input type="radio" name="status" value="0" checked="">
                                                    <span>Không Hoạt động</span> <input type="radio" name="status" value="1">
                                                    <input name="id" value="${employee.idaccount}" hidden="">
                                                </c:if>
                                                <c:if test="${employee.status == 1}">
                                                    <span>Hoạt động</span> <input type="radio" name="status" value="0">
                                                    <span>Không Hoạt động</span> <input type="radio" name="status" value="1" checked="">
                                                    <input name="id" value="${employee.idaccount}" hidden="">
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
  $(document).ready(function() {
    $('input[name="status"]').change(function() {
      var statusValue = $(this).val();
      var idValue = $('input[name="id"]').val();
      var url = '/status';
      $.ajax({
            url: url,
            method: 'POST',
            data: {
                status: status,
                id: employeeId
            },
            success: function(response) {
                alert("Thay đổi trạng thái thành công!");
            },
            error: function(xhr, status, error) {
                alert("Đã xảy ra lỗi khi thay đổi trạng thái!");
            }
        });
    });
</script>
</html>