<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Admin Dashboard</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="css/admin/admin.css">
        <link rel="stylesheet" href="css/admin/admin-employee-add.css">
    </head>

    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3">
                    <c:import url="adminMenu.jsp"></c:import>
                    </div>
                    <div class="col-lg-8">
                        <h2 style="display: flex; justify-content: center; margin-bottom: 10px; font-family: monospace;font-weight: 700; margin-top: 20px; text-transform: uppercase">Add new Employee</h2>
                        <h3 style="color: blue; margin-bottom: 10px; font-family: sans-serif;font-weight: 700; margin-top: 20px; text-transform: uppercase; background-color: #6fc5ff; padding: 20px">Add new Employee</h3>
                    <c:set var="addUnsuccess" value="${requestScope.addUnsuccess}"/>
                    <c:set var="addSuccess" value="${requestScope.addSuccess}"/>
                    <form action="/YogaCenter/request" method="POST">
                        <div style="margin-top: 10%">
                            <div style="display: flex; align-items: center; justify-content: space-between">
                                <p>Name of Employee : <input type="text" name="name" class="input-course" value="${param.name}" required=""></p>
                                <p>Email : &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&emsp;<input type="text" name="email" class="input-course" value="${param.email}" required=""></p>
                            </div>
                            <div style="display: flex; align-items: center; justify-content: space-between">
                                <p>Phone : &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;<input type="text" name="phone" class="input-course" value="${param.phone}" required=""></p>
                                <p>Citizen Identity Card : <input type="number" name="cccd" class="input-course" value="${param.cccd}" required=""></p>
                            </div>
                            <p>Address : <input type="text" name="address" class="input-course" value="${param.address}" required=""></p>
                            <p>Account : <input type="text" name="account" class="input-course" required=""></p>
                            <p>Password : <input type="password" name="password" class="input-course" required=""></p>
                            <p>Role : &ensp;&ensp;&ensp;
                                <select name="role" id="select-box">
                                    <option value="1">Staff</option>
                                    <option value="2">Trainer</option>
                                </select>
                            </p>
                            <button name="action" value="ButtonAdd" class="btn-add">Add new Employee</button>
                        </div>
                    </form>
                </div>

                <c:if test="${addUnsuccess != null}">
                    <div class="notification">
                        <div class="content">
                            <div class="title">Error</div>
                            <span>Account already exists. Please fill in the account details again!</span>
                        </div>
                        <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
                    </div>
                    <script>
                        let notification = document.querySelector('.notification');
                        notification.timeOut = setTimeout(() => notification.remove(), 5000);
                    </script>
                </c:if>
                <c:if test="${addSuccess != null}">
                    <div class="notification-success">
                        <div class="content">
                            <div class="title">Success</div>
                            <span>Add new employee successfully !</span>
                        </div>
                        <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
                    </div>
                    <script>
                        let notification = document.querySelector('.notification-success');
                        notification.timeOut = setTimeout(() => notification.remove(), 5000);
                    </script>
                </c:if>
                </body>
                </html>
