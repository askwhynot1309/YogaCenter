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
                    <img src="https://i.pinimg.com/originals/56/b3/3f/56b33f65326afe02aedf24361452a3db.jpg" alt="">
                </div>

                <div class="inner-home">
                    <div class="inner-content">
                        <h1>Yoga class</h1>
                        <p>As a prestigious Yoga studio in Vietnam with more than 60,000 students to choose from.</p>
                        <a href="register.jsp">Register now</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="our-classes">

            <h1>Our classes</h1>

            <div class="main-class">
                <div class="inner-class">
                    <img src="https://th.bing.com/th/id/OIP.G2jgzWc8V31XSFTpSiy_2gHaE_?pid=ImgDet&rs=1" alt="">
                    <div class="class-content">
                        <h2>Newbie class</h2>
                        <p>You owe them a harsher pleasure than any of these pleasures</p>
                        <a href="register.jsp">register now</a>
                    </div>
                </div>

                <div class="inner-class">
                    <img src="https://th.bing.com/th/id/OIP.blWQYSfXrtizCN_SVPXoBwHaFj?pid=ImgDet&rs=1" alt="">
                    <div class="class-content">
                        <h2>Newbie class</h2>
                        <p>You owe them a harsher pleasure than any of these pleasures</p>
                        <a href="register.jsp">register now</a>
                    </div>
                </div>

                <div class="inner-class">
                    <img src="https://th.bing.com/th/id/R.03b4c91e95e86d967f43bdbafa929e57?rik=wo8ZKug8nMBWjg&pid=ImgRaw&r=0" alt="">
                    <div class="class-content">
                        <h2>Newbie class</h2>
                        <p>You owe them a harsher pleasure than any of these pleasures</p>
                        <a href="register.jsp">register now</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="our-instructor">
            <h1>Our instructor</h1>
            <div class="main-instructor">
                <div class="inner-instructor">
                    <div class="inner-content-instructor">
                        <h2>Best <br> Instructor</h2>
                        <p>The company itself is a very successful company. Rejecting, when not! 
                            It will happen that he who suffers the thing itself, the fault of the truth </p>
                        <a href="AboutUs.jsp">Read more</a>
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
                        <p>The company itself is a very successful company. Rejecting, when not! It will happen who
                            the thing itself, the fault of the truth </p>
                        <a href="AboutUs.jsp">Read more</a>
                    </div>

                </div>
            </div>
        </div>



        <div class="our-gallery">
            <h1>Gallery</h1>
            <div class="main-gallery">

            </div>
        </div>


        <div class="our-prices">
            <h1>Prices</h1>
            <div class="main-prices">
                <div class="inner-prices">
                    <h2>Newbie classes</h2>
                    <h3>Prices : $00.00/</h3>
                    <div class="price-icon">
                        <i class="fas fa-award"></i>
                    </div>
                    <a href="Register.jsp">Register now</a>
                </div>

                <div class="inner-prices">
                    <h2>Newbie classes</h2>
                    <h3>Prices : $00.00/</h3>
                    <div class="price-icon">
                        <i class="fas fa-award"></i>
                    </div>
                    <a href="Register.jsp">Register now</a>
                </div>

                <div class="inner-prices">
                    <h2>Newbie classes</h2>
                    <h3>Prices : $00.00/</h3>
                    <div class="price-icon">
                        <i class="fas fa-award"></i>
                    </div>
                    <a href="Register.jsp">Register now</a>
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
                    <img src="https://th.bing.com/th/id/R.5bc6a94ca0114ea56198bccc0a2b0d98?rik=eDteuVFFJ12iYg&pid=ImgRaw&r=0">
                </div>
            </div>
        </div>
        <script src="script.js"></script>
    </body>
</html>