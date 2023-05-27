<%-- 
    Document   : homepage
    Created on : May 26, 2023, 8:54:23 AM
    Author     : ngmin
--%>

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
        <link rel="stylesheet" href="fontawesome-free-5.15.3-web/css/all.min.css">
        <title>Homepage</title>
    </head>
    <body>
        <c:import url="header.html"></c:import>


        <div id="home" class="back">
            <div class="mian-home">
                <div class="inner-home">
                    <img src="images/for bg.png" alt="">
                </div>

                <div class="inner-home">
                    <div class="inner-content">
                        <h1>Yoga class</h1>
                        <p>Là một phòng tập Yoga uy tín ở Việt Nam có hơn 60.000 học viên lựa chọn.</p>
                        <a href="#">Register now</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="our-classes">

            <h1>our classes</h1>

            <div class="main-class">
                <div class="inner-class">
                    <img src="images/class1.png" alt="">
                    <div class="class-content">
                        <h2>newbie class</h2>
                        <p>Lt. At, illum veniam. Earum debitis asperiores voluptatem ut nemo harum voluptatibus</p>
                        <a href="#">register now</a>
                    </div>
                </div>

                <div class="inner-class">
                    <img src="images/class1.png" alt="">
                    <div class="class-content">
                        <h2>newbie class</h2>
                        <p>Lt. At, illum veniam. Earum debitis asperiores voluptatem ut nemo harum voluptatibus</p>
                        <a href="#">register now</a>
                    </div>
                </div>

                <div class="inner-class">
                    <img src="images/class1.png" alt="">
                    <div class="class-content">
                        <h2>newbie class</h2>
                        <p>Lt. At, illum veniam. Earum debitis asperiores voluptatem ut nemo harum voluptatibus</p>
                        <a href="#">register now</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="our-instructor">
            <h1>Our instructor</h1>
            <div class="main-instructor">
                <div class="inner-instructor">
                    <div class="inner-content-instructor">
                        <h2>best <br> Instructor</h2>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis, cum non! Eveniet qui
                            doloribus rem ipsa, veritatis culpa </p>
                        <a href="#">Read more</a>
                    </div>

                </div>

                <div class="inner-instructor">
                    <img src="images/Instructer.png" alt="">
                </div>
            </div>
        </div>

        <div class="our-instructor">
            <div class="main-instructor">

                <div class="inner-instructor">
                    <img src="images/new experience.png" alt="">
                </div>

                <div class="inner-instructor">
                    <div class="inner-content-instructor">
                        <h2>New<br> Experience</h2>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis, cum non! Eveniet qui
                            doloribus rem ipsa, veritatis culpa </p>
                        <a href="#">Read more</a>
                    </div>

                </div>
            </div>
        </div>



        <div class="our-gallery">
            <h1>gallery</h1>
            <div class="main-gallery">

            </div>
        </div>


        <div class="our-prices">
            <h1>prices</h1>
            <div class="main-prices">
                <div class="inner-prices">
                    <h2>Newbie classes</h2>
                    <h3>prices : $00.00/</h3>
                    <div class="price-icon">
                        <i class="fas fa-award"></i>
                    </div>
                    <a href="#">Register now</a>
                </div>

                <div class="inner-prices">
                    <h2>Newbie classes</h2>
                    <h3>prices : $00.00/</h3>
                    <div class="price-icon">
                        <i class="fas fa-award"></i>
                    </div>
                    <a href="#">Register now</a>
                </div>

                <div class="inner-prices">
                    <h2>Newbie classes</h2>
                    <h3>prices : $00.00/</h3>
                    <div class="price-icon">
                        <i class="fas fa-award"></i>
                    </div>
                    <a href="#">Register now</a>
                </div>
            </div>
        </div>


        <!-- contact us -->

        <div class="contact-us">
            <div class="main-contact">
                <div class="inner-contact">
                    <h1>Contact us</h1>
                    <div class="inner-form-contact">
                        <input type="text" placeholder="your name">
                        <input type="tel" placeholder="your phone">
                        <textarea name="" id="" cols="30" rows="10"></textarea>
                    </div>
                </div>

                <div class="inner-contact">
                    <img src="images/Instructer.png" alt="">
                </div>
            </div>
        </div>
        <script src="script.js"></script>
    </body>
</html>
