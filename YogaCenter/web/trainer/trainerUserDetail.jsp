<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Admin Dashboard</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="css/admin/admin.css">
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
        <c:set var="exist" value="${sessionScope.Trainer}"/>
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
                    <c:import url="trainerDashboard.jsp"></c:import>
                    </div>
                    <div class="col-lg-9">
                        <h2 style="display: flex; justify-content: center; margin-bottom: 100px; font-family: monospace;font-weight: 700; margin-top: 20px; text-transform: uppercase">User Details</h2>
                    <c:set var="user" value="${requestScope.user}"/>
                    <c:if test="${user != null}">
                        <div style="float: left; width: 600px">
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <td style="padding: 20px; font-weight: 700">Name : </td>
                                        <td style="padding: 20px">${user.name}</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 20px; font-weight: 700">Email : </td>
                                        <td style="padding: 20px">${user.email}</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 20px; font-weight: 700">Citizen Identity Card : </td>
                                        <td style="padding: 20px">${user.cccd}</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 20px; font-weight: 700">Phone : </td>
                                        <td style="padding: 20px">${user.phone}</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 20px; font-weight: 700">Address : </td>
                                        <td style="padding: 20px">${user.address}</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 20px; font-weight: 700">Account : </td>
                                        <td style="padding: 20px">${user.account}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div style="float: right; width: 350px; border: 5px solid black; padding: 10px">
                            <img src="${user.image}" height="200px" width="200px" id="img" style="margin-left: 20%">
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </body>
</html>
