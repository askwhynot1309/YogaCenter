<%-- 
    Document   : trainerInformation
    Created on : Jul 10, 2023, 1:47:44 PM
    Author     : ngmin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Employee Management</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="icon" type="image/x-icon" href="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png">
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
        <c:import url="header.jsp"></c:import>
            <div style="display: flex; justify-content: center;" class="container">
                <div class="col-lg-12">
                    <h2 style="display: flex; justify-content: center; margin-bottom: 100px; font-family: monospace;font-weight: 700; margin-top: 20px; text-transform: uppercase">Information of Employee</h2>
                <c:set var="informationEmployee" value="${requestScope.informationEmployee}"/>
                <c:if test="${informationEmployee != null}">
                    <div style="float: left; width: 600px">
                        <table class="table">
                            <tbody>
                                <tr>
                                    <td style="padding: 20px; font-weight: 700">Name : </td>
                                    <td style="padding: 20px">${informationEmployee.name}</td>
                                </tr>
                                <tr>
                                    <td style="padding: 20px; font-weight: 700">Email : </td>
                                    <td style="padding: 20px">${informationEmployee.email}</td>
                                </tr>
                                <tr>
                                    <td style="padding: 20px; font-weight: 700">Citizen Identity Card : </td>
                                    <td style="padding: 20px">${informationEmployee.cccd}</td>
                                </tr>
                                <tr>
                                    <td style="padding: 20px; font-weight: 700">Phone : </td>
                                    <td style="padding: 20px">${informationEmployee.phone}</td>
                                </tr>
                                <tr>
                                    <td style="padding: 20px; font-weight: 700">Address : </td>
                                    <td style="padding: 20px">${informationEmployee.address}</td>
                                </tr>
                                <tr>
                                    <td style="padding: 20px; font-weight: 700">Bio : </td>
                                    <td style="padding: 20px">${informationEmployee.cv}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div style="float: right; width: 350px; border: 5px solid black; padding: 10px">
                        <img src="img/${informationEmployee.image}" height="200px" width="200px" id="img" style="margin-left: 20%">
                    </div>
                </c:if>
            </div>
        </div>
    </body>
</html>