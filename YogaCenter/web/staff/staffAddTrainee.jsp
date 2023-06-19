<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Staff Dashboard</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="css/admin/admin.css">
        <link rel="stylesheet" href="css/admin/admin-employee-add.css">
    </head>

    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3" style="padding: 0">
                    <c:import url="staffMenu.jsp"></c:import>
                    </div>
                    <div class="col-lg-8">
                        <h2 style="display: flex; justify-content: center; margin-bottom: 10px; font-family: monospace;font-weight: 700; margin-top: 20px; text-transform: uppercase">Add new Trainee</h2>
                        <h3 style="color: blue; margin-bottom: 10px; font-family: sans-serif;font-weight: 700; margin-top: 20px; text-transform: uppercase; background-color: #6fc5ff; padding: 20px">Add new Trainee</h3>
                    <c:set var="phoneUnsuccess" value="${requestScope.phoneUnsuccess}"/>
                    <c:set var="addSuccess" value="${requestScope.addSuccess}"/>
                    <c:set var="cccdUnsuccess" value="${requestScope.cccdUnsuccess}"/>
                    <c:set var="emailUnsuccess" value="${requestScope.emailUnsuccess}"/>
                    <form action="/YogaCenter/request" method="POST">
                        <div style="margin-top: 15%;border: 2px solid gray; padding: 10px">
                            <h3 style="display: flex; justify-content: center; margin-bottom: 20px; text-transform: uppercase">Information of trainee</h3>
                            <div style="display: flex; align-items: center; justify-content: space-between">
                                <p>Name of Trainee : <input type="text" name="name" class="input-course" value="${param.name}" required=""></p>
                                <p>Email : &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&emsp;<input type="text" name="email" class="input-course" value="${param.email}"></p>
                            </div>
                            <div style="display: flex; align-items: center; justify-content: space-between">
                                <p>Phone : &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;<input type="text" name="phone" class="input-course" value="${param.phone}" required=""></p>
                                <p>Citizen Identity Card : <input type="number" name="cccd" class="input-course" value="${param.cccd}" required=""></p>
                            </div>
                                <p>Address : &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&emsp;<input type="text" name="address" class="input-course" value="${param.address}" required=""></p><br>
                            <button name="action" value="ButtonAddTrainee" class="btn-add">Add new Trainee</button>
                        </div>
                    </form>
                </div>

                <c:if test="${phoneUnsuccess != null}">
                    <div class="notification">
                        <div class="content">
                            <div class="title">Error</div>
                            <span>Phone already exists. Please fill in the phone details again!</span>
                        </div>
                        <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
                    </div>
                    <script>
                        let notification = document.querySelector('.notification');
                        notification.timeOut = setTimeout(() => notification.remove(), 5000);
                    </script>
                </c:if>
                    <c:if test="${cccdUnsuccess != null}">
                    <div class="notification">
                        <div class="content">
                            <div class="title">Error</div>
                            <span>CCCD already exists. Please fill in the CCCD details again!</span>
                        </div>
                        <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
                    </div>
                    <script>
                        let notification = document.querySelector('.notification');
                        notification.timeOut = setTimeout(() => notification.remove(), 5000);
                    </script>
                </c:if>
                    <c:if test="${emailUnsuccess != null}">
                    <div class="notification">
                        <div class="content">
                            <div class="title">Error</div>
                            <span>Email already exists. Please fill in the email details again!</span>
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
                            <span>Add new trainee successfully !</span>
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
