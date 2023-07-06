<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Employee Management</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="icon" type="image/x-icon" href="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png">
        <link rel="stylesheet" href="css/admin/admin.css">
        <link rel="stylesheet" href="css/admin/admin-employee-add.css">
        <style>
            .btn {
                display: flex;
                height: 3em;
                width: 100px;
                align-items: center;
                justify-content: center;
                background-color: #eeeeee4b;
                border-radius: 3px;
                letter-spacing: 1px;
                transition: all 0.2s linear;
                cursor: pointer;
                border: none;
                background: #fff;
            }

            .btn > svg {
                margin-right: 5px;
                margin-left: 5px;
                font-size: 20px;
                transition: all 0.4s ease-in;
            }

            .btn:hover > svg {
                font-size: 1.2em;
                transform: translateX(-5px);
            }

            .btn:hover {
                box-shadow: 9px 9px 33px #d1d1d1, -9px -9px 33px #ffffff;
                transform: translateY(-2px);
            }
            .btn a{
                text-decoration: none;
            }
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
        <c:set var="exist" value="${sessionScope.Admin}"/>
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
                    <c:import url="adminMenu.jsp"></c:import>
                    </div>
                    <div class="col-lg-8">
                        <div style="height: 40px; width: 100%; margin-top: 10px; margin-bottom: 10px">
                            <a href="/YogaCenter/employee" class="btn">
                                <svg height="16" width="16" xmlns="http://www.w3.org/2000/svg" version="1.1" viewBox="0 0 1024 1024"><path d="M874.690416 495.52477c0 11.2973-9.168824 20.466124-20.466124 20.466124l-604.773963 0 188.083679 188.083679c7.992021 7.992021 7.992021 20.947078 0 28.939099-4.001127 3.990894-9.240455 5.996574-14.46955 5.996574-5.239328 0-10.478655-1.995447-14.479783-5.996574l-223.00912-223.00912c-3.837398-3.837398-5.996574-9.046027-5.996574-14.46955 0-5.433756 2.159176-10.632151 5.996574-14.46955l223.019353-223.029586c7.992021-7.992021 20.957311-7.992021 28.949332 0 7.992021 8.002254 7.992021 20.957311 0 28.949332l-188.073446 188.073446 604.753497 0C865.521592 475.058646 874.690416 484.217237 874.690416 495.52477z"></path></svg>
                                <span>Back</span>
                            </a>
                        </div>
                        <h2 style="display: flex; justify-content: center; margin-bottom: 10px; font-family: monospace;font-weight: 700; margin-top: 20px; text-transform: uppercase">Add new Employee</h2>
                        <h3 style="color: blue; margin-bottom: 10px; font-family: sans-serif;font-weight: 700; margin-top: 20px; text-transform: uppercase; background-color: #6fc5ff; padding: 20px">Add new Employee</h3>
                    <c:set var="addUnsuccess" value="${requestScope.addUnsuccess}"/>
                    <c:set var="addSuccess" value="${requestScope.addSuccess}"/>
                    <c:set var="CCCDUnsuccess" value="${requestScope.CCCDUnsuccess}"/>
                    <c:set var="EmailUnsuccess" value="${requestScope.EmailUnsuccess}"/>
                    <c:set var="PhoneUnsuccess" value="${requestScope.PhoneUnsuccess}"/>
                    <c:set var="Invalid" value="${requestScope.Invalid}"/>
                    <c:set var="InvalidPhone" value="${requestScope.InvalidPhone}"/>
                    <c:set var="InvalidCCCD" value="${requestScope.InvalidCCCD}"/>
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
                            <div style="display: flex; align-items: center; justify-content: space-between">
                                <div>
                                    <p>Address : <input type="text" name="address" class="input-course" value="${param.address}" required=""></p>
                                    <p>Account : <input type="text" name="account" class="input-course" required=""></p>
                                    <p>Password : <input type="password" name="password" class="input-course" required=""></p>
                                    <p>Role : &ensp;&ensp;&ensp;
                                        <select name="role" id="select-box">
                                            <option value="1">Staff</option>
                                            <option value="2">Trainer</option>
                                        </select>
                                    </p>
                                </div>
                                <div style="width: 350px; border: 5px solid black; padding: 10px">
                                    <img src="" height="200px" width="200px" id="img" style="margin-left: 20%"><br><br>
                                    <input type="file" name="img" id="img-input">
                                </div>
                            </div>
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
                <c:if test="${PhoneUnsuccess != null}">
                    <div class="notification">
                        <div class="content">
                            <div class="title">Error</div>
                            <span>Phone already exists with role. Please fill again!</span>
                        </div>
                        <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
                    </div>
                    <script>
                        let notification = document.querySelector('.notification');
                        notification.timeOut = setTimeout(() => notification.remove(), 5000);
                    </script>
                </c:if>
                <c:if test="${InvalidPhone != null}">
                    <div class="notification">
                        <div class="content">
                            <div class="title">Error</div>
                            <span>Phone is invalid. Please fill again!</span>
                        </div>
                        <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
                    </div>
                    <script>
                        let notification = document.querySelector('.notification');
                        notification.timeOut = setTimeout(() => notification.remove(), 5000);
                    </script>
                </c:if>
                <c:if test="${EmailUnsuccess != null}">
                    <div class="notification">
                        <div class="content">
                            <div class="title">Error</div>
                            <span>Email already exists with role. Please fill again!</span>
                        </div>
                        <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
                    </div>
                    <script>
                        let notification = document.querySelector('.notification');
                        notification.timeOut = setTimeout(() => notification.remove(), 5000);
                    </script>
                </c:if>
                <c:if test="${CCCDUnsuccess != null}">
                    <div class="notification">
                        <div class="content">
                            <div class="title">Error</div>
                            <span>CCCD already exists. Please fill again!</span>
                        </div>
                        <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
                    </div>
                    <script>
                        let notification = document.querySelector('.notification');
                        notification.timeOut = setTimeout(() => notification.remove(), 5000);
                    </script>
                </c:if>
                <c:if test="${InvalidCCCD != null}">
                    <div class="notification">
                        <div class="content">
                            <div class="title">Error</div>
                            <span>CCCD is invalid. Please fill again!</span>
                        </div>
                        <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
                    </div>
                    <script>
                        let notification = document.querySelector('.notification');
                        notification.timeOut = setTimeout(() => notification.remove(), 5000);
                    </script>
                </c:if>
                <c:if test="${Invalid != null}">
                    <div class="notification">
                        <div class="content">
                            <div class="title">Error</div>
                            <span>Email is invalid. Please fill again!</span>
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
                <script>
                    const inputFile = document.getElementById('img-input');
                    const image = document.getElementById('img');
                    inputFile.addEventListener('change', function () {
                        if (inputFile.files && inputFile.files[0]) {
                            const reader = new FileReader();
                            reader.onload = function (e) {
                                image.src = e.target.result;
                            };
                            reader.readAsDataURL(inputFile.files[0]);
                        }
                    });
                </script>
                </html>
