<!-- feedback.jsp -->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Feedback Form </title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="icon" type="image/x-icon" href="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png">
        <style>
            body {
                background-color: #f8f8f8;
            }

            .container {
                margin: 100px auto;
                max-width: 60%;
                padding: 30px;
                background-color: #f8f8f8;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }


            .form-title {
                text-align: center;
                font-size: 24px;
                margin-bottom: 30px;
                color: #333333;
            }

            .form-group label {
                color: #333333;
                font-weight: bold;
                font-size: 18px;
            }

            .form-control {
                border-radius: 4px;
                font-size: 20px;
            }

            .submit-button {
                margin-top: 20px;
                text-align: center;
            }

            .submit-button button {
                background-color: #7fbf7f;
                color: #ffffff;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                font-size: 18px;
            }

            .submit-button button:hover {
                background-color: #6ca66c;
                font-size: 18px;
            }

            textarea.form-control {
                font-size: 16px;
                height: 160px; /* Set the desired height of the textarea */
                resize: vertical; /* Allow vertical resizing of the textarea */
            }
        </style>
    </head>
    <body>
        <div>
            <c:import url="header.jsp"/>
        </div>
        <div class="container">
            <h2 class="form-title">Feedback Form</h2>
            <form action="/YogaCenter/request" method="post">
                <c:set var="account" value="${sessionScope.account}"/>
                <c:if test="${account != null}">
                    <input type="email" name="txtemail" value="${account.email}" hidden="">
                </c:if>
                <c:if test="${account == null}">
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="text" class="form-control" id="txtname" name="txtname" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" class="form-control" id="txtemail" name="txtemail" required>
                    </div>
                </c:if>
                <div class="form-group">
                    <label for="feedback">Feedback:</label>
                    <textarea class="form-control" id="feedback" name="txtfeedback" required></textarea>
                </div>
                <div style="color: green">${requestScope.FeedbackMessage}</div>
                <div class="submit-button">
                    <button class="btn btn-block" name="action" value="Feedback">Submit</button>
                </div>
            </form>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>

</html>
