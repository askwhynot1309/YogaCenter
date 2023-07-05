<%-- 
    Document   : traineeViewNotification
    Created on : Jul 3, 2023, 12:30:16 PM
    Author     : ngmin
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="Object.Account"%>
<%@page import="Dao.UserDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="icon" type="image/x-icon" href="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png">
        <link rel="stylesheet" href="css/style.css"/>
        <title>Notification</title>
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
        <c:import url="header.jsp"></c:import>
        <c:set var="exist" value="${sessionScope.account}"/>
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
        <c:set var="notiList" value="${requestScope.notiList}"></c:set>
            <div class="container">
                <div class="row">
                    <div class="col-lg-9" style="padding: 0">
                        <h2>Notification</h2>
                    <c:if test="${!notiList.isEmpty()}">
                        <table>
                            <c:forEach var="noti" items="${requestScope.notiList}">
                                <tr>
                                    <th class="col-2">${noti.dateSend}:</th>
                                    <th><a href="/YogaCenter/request?action=classify&messID=${noti.messageID}">${noti.message}</a></th>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:if>
                    <c:if test="${notiList.isEmpty()}">
                        <h4>You aren't have any notification</h4>
                    </c:if>
                </div>
            </div>
        </div>
        <%--<c:import url="footer.html"></c:import>--%>
    </body>
</html>
