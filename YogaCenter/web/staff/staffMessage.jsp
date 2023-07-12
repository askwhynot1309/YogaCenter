<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="icon" type="image/x-icon" href="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png">
        <link rel="stylesheet" href="css/admin/admin.css">
        <link rel="stylesheet" href="css/admin/admin-table.css">
        <link rel="stylesheet" href="css/admin/admin-employee-add.css">
        <link rel="stylesheet" href="css/admin/admin-course.css">
        <title>Message</title>
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
                        <h2 style="display: flex; justify-content: center; margin-bottom: 10px; font-family: monospace;font-weight: 700; margin-top: 20px; text-transform: uppercase">Notification message</h2>
                        <div style="height: 40px">
                            <button class="btn-add" style="float: right">
                                <span>
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path fill="none" d="M0 0h24v24H0z"></path><path fill="currentColor" d="M11 11V5h2v6h6v2h-6v6h-2v-6H5v-2z"></path></svg><a href="staffnewmessage" style="color: white"> New Message</a>
                                </span>
                            </button>
                        </div>
                        <div style="display: flex; margin-left: 30%; margin-bottom: 2rem; margin-top: 2rem; width: 300px">
                            <form action="/YogaCenter/request" method="POST" class="form-search">
                                <div class="group">
                                <input name="option" value="staffSearchMessage" hidden="">
                                <input name="date" type="date">
                                <button name="action" value="search" class="btn-search">Filter</button>
                            </div>
                        </form>
                    </div>
                    <c:set var="listMessage" value="${requestScope.listMessage}"/>
                    <c:set var="getAllAccount" value="${requestScope.getAllAccount}"/>
                    <c:if test="${listMessage.isEmpty()}">
                        <p style="text-align: center">Don't any message</p>
                    </c:if>
                    <c:if test="${listMessage != null && !listMessage.isEmpty() && getAllAccount != null && !getAllAccount.isEmpty()}">
                        <div class="tbl-header">
                            <table cellpadding="0" cellspacing="0" border="0">
                                <thead>
                                    <tr>
                                        <th style="width: 50px">No.</th>
                                        <th style="width: 250px">Name</th>
                                        <th style="width: 350px">Title</th>
                                        <th style="width: 150px">Date-send</th>
                                        <th style="width: 150px">Status</th>
                                        <th>Detail</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="tbl-content" style="height: 400px">
                            <table cellpadding="0" cellspacing="0" border="0">
                                <tbody>
                                    <c:forEach var="message" items="${listMessage}" varStatus="loop">
                                        <tr>
                                            <td style="width: 50px">${loop.count}</td>
                                            <td style="width: 250px">
                                                <c:forEach var="account" items="${getAllAccount}">
                                                    <c:if test="${account.idaccount == message.fromUserID}">
                                                        ${account.email}
                                                    </c:if>
                                                </c:forEach>
                                            </td>
                                            <td style="width: 350px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${message.title}</td>
                                            <td style="width: 150px">${message.dateSend}</td>
                                            <td style="width: 150px">
                                                <c:if test="${message.status == 0}">
                                                    <svg xmlns="http://www.w3.org/2000/svg" height="0.625em" viewBox="0 0 512 512" style="fill:#fa0000"><!--! Font Awesome Free 6.4.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{
                                                            width: 20px;
                                                            height: 20px
                                                        }</style><path d="M256 48a208 208 0 1 1 0 416 208 208 0 1 1 0-416zm0 464A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM175 175c-9.4 9.4-9.4 24.6 0 33.9l47 47-47 47c-9.4 9.4-9.4 24.6 0 33.9s24.6 9.4 33.9 0l47-47 47 47c9.4 9.4 24.6 9.4 33.9 0s9.4-24.6 0-33.9l-47-47 47-47c9.4-9.4 9.4-24.6 0-33.9s-24.6-9.4-33.9 0l-47 47-47-47c-9.4-9.4-24.6-9.4-33.9 0z"/></svg>
                                                    </c:if>
                                                    <c:if test="${message.status == 2}">
                                                    <svg xmlns="http://www.w3.org/2000/svg" height="0.625em" viewBox="0 0 448 512" style="fill:#73ff00"><!--! Font Awesome Free 6.4.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{
                                                            width: 20px;
                                                            height: 20px
                                                        }</style><path d="M438.6 105.4c12.5 12.5 12.5 32.8 0 45.3l-256 256c-12.5 12.5-32.8 12.5-45.3 0l-128-128c-12.5-12.5-12.5-32.8 0-45.3s32.8-12.5 45.3 0L160 338.7 393.4 105.4c12.5-12.5 32.8-12.5 45.3 0z"/></svg>
                                                    </c:if>
                                            </td>
                                            <td><a href="/YogaCenter/request?action=inf&option=staffdetailmessage&id=${message.messageID}" class="btn btn-primary">View message</a></td>
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
