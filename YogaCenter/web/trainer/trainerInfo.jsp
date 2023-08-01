<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="overflow-y: scroll">

    <head>
        <title>Trainer Information</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="icon" type="image/x-icon" href="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png">
        <link rel="stylesheet" href="css/admin/admin.css">
        <link rel="stylesheet" href="css/admin/admin-employee-add.css">
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
                <div class="col-lg-3" style="padding: 0; position: fixed">
                    <c:import url="trainerDashboard.jsp"></c:import>
                    </div>
                    <div class="col-lg-9" style="margin-left: 250px">
                        <h2 style="display: flex; justify-content: center; margin-bottom: 100px; font-family: monospace;font-weight: 700; margin-top: 20px; text-transform: uppercase">Trainer Details</h2>
                    <c:set var="user" value="${requestScope.trainer}"/>
                    <c:set var="ErrorMessage" value="${requestScope.ErrorMessage}"/>
                    <c:set var="ErrorMessagePhone" value="${requestScope.ErrorMessagePhone}"/>
                    <c:set var="Success" value="${requestScope.Success}"/>
                    <c:if test="${trainer != null}">
                        <form action="/YogaCenter/TrainerAddInfo" method="post" style="margin-bottom: 20px">
                            <div class="row">
                                <div style="width: 600px" class="col-md-8">
                                    <table class="table">
                                        <tbody>
                                        <tr>
                                            <td style="padding: 20px; font-weight: 700">Name :</td>
                                            <td style="padding: 20px">
                                                ${trainer.name}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 20px; font-weight: 700">Email :</td>
                                            <td style="padding: 20px">
                                                ${trainer.email}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 20px; font-weight: 700">Citizen Identity Card :</td>
                                            <td style="padding: 20px">
                                                ${trainer.cccd}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 20px; font-weight: 700">Phone :</td>
                                            <td style="padding: 20px">
                                                <input type="number" name="phone" value="${trainer.phone}">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 20px; font-weight: 700">Address :</td>
                                            <td style="padding: 20px">
                                                <input type="text" name="address" value="${trainer.address}" style="width: 300px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 20px; font-weight: 700">Account :</td>
                                            <td style="padding: 20px">
                                                ${trainer.account}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 20px; font-weight: 700">Bio :</td>
                                            <td style="padding: 20px">
                                                ${trainer.cv}
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div style="width: 330px; border: 5px solid black; padding: 10px; height: 300px" class="col-md-4">
                                    <img src="img/${trainer.image}" height="200px" width="200px" id="img" style="margin-left: 20%; margin-bottom: 10px">
                                    <input type="file" name="img" id="img-input">
                                    <input name="oldimg" value="${trainer.image}" hidden="">
                                </div>
                            </div>
                                    <input name="oldbio" value="${trainer.cv}" hidden="">
                            <div style="margin-bottom: 20px">
                                Bio : <textarea name="bio"></textarea>
                            </div>
                                    <input name="id" value="${trainer.idaccount}" hidden="">
                            <button style="margin-left: 40%" class="btn btn-primary" type="submit">Update</button>
                    </div>
                    </form>

                </c:if>

            </div>
        </div>
    </div>
    <script src="https://cdn.ckeditor.com/4.21.0/standard/ckeditor.js"></script>
    <script>
        CKEDITOR.replace('bio');
    </script>
</body>
<c:if test="${ErrorMessage != null}">
    <div class="notification">
        <div class="content">
            <div class="title">Error</div>
            <span>${ErrorMessage}</span>
        </div>
        <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
    </div>
    <script>
        let notification = document.querySelector('.notification');
        notification.timeOut = setTimeout(() => notification.remove(), 5000);
    </script>
</c:if>
<c:if test="${ErrorMessagePhone != null}">
    <div class="notification">
        <div class="content">
            <div class="title">Error</div>
            <span>${ErrorMessagePhone}</span>
        </div>
        <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
    </div>
    <script>
        let notification = document.querySelector('.notification');
        notification.timeOut = setTimeout(() => notification.remove(), 5000);
    </script>
</c:if>
<c:if test="${Success != null}">
    <div class="notification-success">
        <div class="content">
            <div class="title">Success</div>
            <span>${Success}</span>
        </div>
        <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
    </div>
    <script>
        let notification = document.querySelector('.notification-success');
        notification.timeOut = setTimeout(() => notification.remove(), 5000);
    </script>
</c:if>
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
