<!-- feedback.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Feedback Form - Yoga Center</title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
        <c:import url="header.html" />

        <div class="container">
            <h2 class="form-title">Feedback Form</h2>
            <form action="SubmitFeedbackServlet" method="post">
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" class="form-control" id="txtname" name="txtname" required>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" class="form-control" id="txtemail" name="txtemail" required>
                </div>
                <div class="form-group">
                    <label for="feedback">Feedback:</label>
                    <textarea class="form-control" id="feedback" name="txtfeedback" required></textarea>
                </div>
                <div style="color: green">${requestScope.FeedbackMessage}</div>
                <div class="submit-button">
                    <button type="submit" class="btn btn-block">Submit</button>
                </div>
            </form>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>

</html>
