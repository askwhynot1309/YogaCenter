<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Admin Dashboard</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="icon" type="image/x-icon" href="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png">
        <link rel="stylesheet" href="css/admin/admin.css">
        <link rel="stylesheet" href="css/admin/admin-employee-add.css">
    </head>

    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3" style="padding: 0">
                    <c:import url="adminMenu.jsp"/>
                </div>
                <div class="col-lg-9">
                    <c:set var="message" value="${message}"/>
                </div>
            </div>
        </div>
                <c:if test="${message != null}">
                    <div class="notification-success" style="height: 100px">
                        <div class="content">
                            <div class="title">Notification</div>
                            <span>There is a course to create a class, you need to create a class now!!!!</span>
                        </div>
                        <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
                    </div>
                    <script>
                        let notification = document.querySelector('.notification-success');
                        notification.timeOut = setTimeout(() => notification.remove(), 5000);
                    </script>
                </c:if>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
    </body>

</html>