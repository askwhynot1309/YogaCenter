<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Success - Yoga Center</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f4f4f4;
        }

        .container {
            max-width: 500px;
            margin: 0 auto;
            margin-top: 100px;
            background-color: #ffffff;
            padding: 40px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #008000;
            margin-bottom: 30px;
            font-size: 28px;
        }

        .success-message {
            text-align: center;
            color: #008000;
            margin-bottom: 30px;
            font-size: 24px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Registration Success</h2>
        <div class="success-message">
            Register complete!
            <br>
            Redirecting back to homepage in 5 seconds...
        </div>
    </div>

    <script>
        setTimeout(function(){
            window.location.href = "homepage.jsp";
        }, 5000);
    </script>
</body>
</html>
