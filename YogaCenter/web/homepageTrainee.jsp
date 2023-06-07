<%-- 
    Document   : homepageTrainee
    Created on : Jun 5, 2023, 1:30:35 PM
    Author     : ngmin
--%>

<%@page import="Dao.UserDao"%>
<%@page import="Object.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
-->
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        
        <title>Homepage</title>
    </head>
    <body>  
        <c:import url="headerTrainee.jsp"></c:import>
        <!DOCTYPE html>
<html>
   
    <meta charset="UTF-8">
    <title>Danh sách khóa học</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        /* CSS để tùy chỉnh hiển thị */
        body {
            background-color: #8bdc74   ;
        }
css
Copy code
    .container {
        max-width: 800px;
        margin: 0 auto;
        padding: 20px;
    }

    .course-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
    }

    .course-card {
        background-color: #fff;
        padding: 20px;
        margin: 20px;
        border-radius: 5px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        cursor: move;
        transition: transform 0.3s ease;
        flex-basis: calc(25% - 40px);
        max-width: calc(25% - 40px);
        box-sizing: border-box;
    }

    .course-card:hover {
        transform: translateY(-5px);
    }

    .course-name {
        font-weight: bold;
        margin-bottom: 10px;
    }

    .course-description {
        display: none;
    }

    .course-card:hover .course-description {
        display: block;
    }

    .course-price {
        font-size: 16px;
        color: #666;
        margin-bottom: 5px;
    }

    .course-trainer {
        font-size: 14px;
        color: #888;
        margin-bottom: 10px;
    }

    .trainee-section {
        display: none;
        padding: 20px;
        background-color: #f5f5f5;
        border-radius: 5px;
        margin-top: 10px;
    }

    .show-trainee-section {
        display: block !important;
    }

    .add-to-cart-btn {
        background-color: #007bff;
        color: #fff;
        padding: 5px 10px;
        border: none;
        border-radius: 3px;
        cursor: pointer;
    }

    .add-to-cart-btn:hover {
        background-color: #0069d9;
    }
</style>
    
<body>
    <div class="container">
        <h1 style="color: #fff; text-align: center;">Danh sách khóa học</h1>
        <div class="course-container">
            <div class="course-card">
                <h3 class="course-name">Khóa học 1</h3>
                <p class="course-trainer"><a href="#" class="trainer-link">Trainer: John Doe</a></p>
                <p class="course-description">Mô tả khóa học 1</p>
                <p class="course-price">$100</p>
                <button class="add-to-cart-btn">Add to Cart</button>
                <div class="trainee-section">
                    <h4>Giới thiệu Trainee</h4>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vel massa nec ex auctor gravida. Donec auctor nisi vel luctus ullamcorper. Donec posuere lorem non sagittis aliquam.</p>
                </div>
            </div>
            <div class="course-card">
                <h3 class="course-name">Khóa học 2</h3>
                <p class="course-trainer"><a href="#" class="trainer-link">Trainer: Jane Smith</a></p>
                <p class="course-description">Mô tả khóa học 2</p>
                <p class="course-price">$150</p>
                <button class="add-to-cart-btn">Add to Cart</button>
                <div class="trainee-section">
                    <h4>Giới thiệu Trainee</h4>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vel massa nec ex auctor gravida. Donec auctor nisi vel luctus ullamcorper. Donec posuere lorem non sagittis aliquam.</p>
                </div>
            </div>
            <div class="course-card">
                <h3 class="course-name">Khóa học 3</h3>
                <p class="course-trainer"><a href="#" class="trainer-link">Trainer: Mark Johnson</a></p>
                <p class="course-description">Mô tả khóa học 3</p>
                <p class="course-price">$180</p>
                <button class="add-to-cart-btn">Add to Cart</button>
                <div class="trainee-section">
                    <h4>Giới thiệu Trainee</h4>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vel massa nec ex auctor gravida. Donec auctor nisi vel luctus ullamcorper. Donec posuere lorem non sagittis aliquam.</p>
                </div>
            </div>
            <div class="course-card">
                <h3 class="course-name">Khóa học 4</h3>
                <p class="course-trainer"><a href="#" class="trainer-link">Trainer: Sarah Wilson</a></p>
                <p class="course-description">Mô tả khóa học 4</p>
                <p class="course-price">$120</p>
                <button class="add-to-cart-btn">Add to Cart</button>
                <div class="trainee-section">
                    <h4>Giới thiệu Trainee</h4>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vel massa nec ex auctor gravida. Donec auctor nisi vel luctus ullamcorper. Donec posuere lorem non sagittis aliquam.</p>
                </div>
            </div>
            <div class="course-card">
                <h3 class="course-name">Khóa học 5</h3>
                <p class="course-trainer"><a href="#" class="trainer-link">Trainer: Michael Brown</a></p>
                <p class="course-description">Mô tả khóa học 5</p>
                <p class="course-price">$200</p>
                <button class="add-to-cart-btn">Add to Cart</button>
                <div class="trainee-section">
                    <h4>Giới thiệu Trainee</h4>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vel massa nec ex auctor gravida. Donec auctor nisi vel luctus ullamcorper. Donec posuere lorem non sagittis aliquam.</p>
                </div>
            </div>
            <div class="course-card">
                <h3 class="course-name">Khóa học 6</h3>
                <p class="course-trainer"><a href="#" class="trainer-link">Trainer: Emily Davis</a></p>
                <p class="course-description">Mô tả khóa học 6</p>
                <p class="course-price">$90</p>
                <button class="add-to-cart-btn">Add to Cart</button>
                <div class="trainee-section">
                    <h4>Giới thiệu Trainee</h4>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vel massa nec ex auctor gravida. Donec auctor nisi vel luctus ullamcorper. Donec posuere lorem non sagittis aliquam.</p>
                </div>
            </div>
        </div>
    </div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
    // JavaScript để xử lý sự kiện khi nhấp vào nút "Add to Cart"
    $(document).ready(function() {
        $('.add-to-cart-btn').click(function() {
            // Thực hiện các thao tác khi thêm vào giỏ hàng
            alert('Đã thêm khóa học vào giỏ hàng!');
        });

        // JavaScript để xử lý sự kiện khi nhấp vào liên kết "trainer"
        $('.trainer-link').click(function(e) {
            e.preventDefault();
            $(this).closest('.course-card').find('.trainee-section').toggleClass('show-trainee-section');
        });
    });
</script>
</body>
</html>
    </body>
</html>
