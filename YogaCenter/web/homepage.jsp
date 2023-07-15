<%@page import="Object.Account"%>
<%@page import="Object.Course"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dao.CourseDao"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Collections" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="icon" type="image/x-icon" href="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png">
        <link rel="stylesheet" href="css/style.css"/>
        <title>Homepage</title>
        <style>
            .fancy {
                background-color: transparent;
                border: 2px solid #000;
                border-radius: 20px;
                box-sizing: border-box;
                color: #fff;
                cursor: pointer;
                display: inline-block;
                float: right;
                font-weight: 700;
                letter-spacing: 0.05em;
                margin: 0;
                outline: none;
                overflow: visible;
                padding: 1.25em 2em;
                position: relative;
                text-align: center;
                text-decoration: none;
                text-transform: none;
                transition: all 0.3s ease-in-out;
                user-select: none;
                font-size: 13px;
                width: 100%;
                margin-bottom: 20px;
            }

            .fancy::before {
                content: " ";
                width: 1.5625rem;
                height: 2px;
                background: #0071e2;
                top: 50%;
                left: 1.5em;
                position: absolute;
                transform: translateY(-50%);
                transform-origin: center;
                transition: background 0.3s linear, width 0.3s linear;
            }

            .fancy .text {
                font-size: 1.125em;
                line-height: 1.33333em;
                padding-left: 2em;
                display: block;
                text-align: left;
                transition: all 0.3s ease-in-out;
                text-transform: uppercase;
                text-decoration: none;
                color: black;
            }

            .fancy .top-key {
                height: 2px;
                width: 1.5625rem;
                top: -2px;
                left: 0.625rem;
                position: absolute;
                background: #e8e8e8;
                transition: width 0.5s ease-out, left 0.3s ease-out;
            }

            .fancy .bottom-key-1 {
                height: 2px;
                width: 1.5625rem;
                right: 1.875rem;
                bottom: -2px;
                position: absolute;
                background: #e8e8e8;
                transition: width 0.5s ease-out, right 0.3s ease-out;
            }

            .fancy .bottom-key-2 {
                height: 2px;
                width: 0.625rem;
                right: 0.625rem;
                bottom: -2px;
                position: absolute;
                background: #e8e8e8;
                transition: width 0.5s ease-out, right 0.3s ease-out;
            }

            .fancy:hover {
                color: white;
                background: #00FF00;
            }

            .fancy:hover::before {
                width: 0.9375rem;
                background: white;
            }

            .fancy:hover .text {
                color: white;
                padding-left: 1.5em;
            }

            .fancy:hover .top-key {
                left: -2px;
                width: 0px;
            }

            .fancy:hover .bottom-key-1,
            .fancy:hover .bottom-key-2 {
                right: 0;
                width: 0;
            }
            .slider{
                width: 1300px;
                max-width: 100vw;
                height: 650px;
                position: relative;
                margin: auto;
                overflow: hidden;
                margin-bottom: 50px;
            }
            .slider .list{
                position: absolute;
                width: max-content;
                height: 100%;
                left: 0;
                top: 0;
                display: flex;
                transition: 1s;
            }
            .slider .list .item{
                width: 1300px;
                max-width: 100vw;
                height: 100%;
                object-fit: cover;
            }
            .slider .buttons{
                position: absolute;
                top: 45%;
                left: 1%;
                width: 98%;
                display: flex;
                justify-content: space-between;
            }
            .slider .buttons button{
                width: 30px;
                height: 30px;
                border-radius: 50%;
                background-color: #fff5;
                color: black;
                border: none;
                font-family: monospace;
                font-weight: bold;
            }
            @media screen and (max-width: 768px){
                .slider{
                    height: 400px;
                }
            }
        </style>
    </head>
    <c:import url="header.jsp"/>
    <body>
        <c:set var="account" value="${sessionScope.account}"/>
        <div style="padding-top: 0px;" id="home" class="back">
            <div class="mian-home">
                <div class="inner-home">
                    <img src="https://i.pinimg.com/originals/56/b3/3f/56b33f65326afe02aedf24361452a3db.jpg" alt="">
                </div>

                <div class="inner-home">
                    <div class="inner-content">
                        <h1>Yoga class</h1>
                        <p>As a prestigious Yoga studio in Vietnam with more than 60,000 students to choose from.</p>
                        <c:if test="${account == null}">
                        <a href="register.jsp">Register now</a>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
        <c:set var="list4Course" value="${requestScope.list4Course}"/>
        <c:set var="ramdomCourse" value="${requestScope.ramdomCourse}"/>
        <c:if test="${list4Course != null}">
            <div class="slider">
                <div class="list">
                    <c:forEach var="course" items="${list4Course}">
                        <div style="background-image: url('img/${course.img_course}'); background-size: 1300px 650px; background-repeat: no-repeat; opacity: 0.8" class="item">
                            <div style="margin-top: 350px; color: white; padding: 20px; width: 600px; background-color: rgba(0, 0, 0, 0.61); backdrop-filter: blur(5px); height: 270px">
                                <h5><strong>${course.name_course}</strong></h5>
                                <p>${course.summary}</p>
                                <a class="fancy" href="/YogaCenter/request?action=inf&option=viewmore&id=${course.idCourse}" style="width: 200px; float: left" >
                                    <span class="top-key"></span>
                                    <span class="text">View more</span>
                                    <span class="bottom-key-1"></span>
                                    <span class="bottom-key-2"></span>
                                </a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="buttons">
                    <button id="prev"><</button>
                    <button id="next">></button>
                </div>
            </div>
        </c:if>
        <c:if test="${ramdomCourse != null}">
            <div class="our-classes">
                <h1 style="font-weight: 700; text-transform: uppercase">Top Courses Booking</h1>
                <div class="main-class">
                    <c:forEach var="topcourse" items="${ramdomCourse}">
                    <div class="inner-class" style="height: 450px; width: 400px; position: relative">
                        <div>
                            <img style="width: 80%; height: 250px; object-fit: cover" src="img/${topcourse.img_course}" alt=""/>
                        </div>
                        <div class="class-content" style="margin-top: 20px; text-align: left">
                            <h4 style="margin-left: 30px">${topcourse.name_course}</h4>
                            <h4 style="margin-bottom: 20px; margin-left: 30px">Level : ${topcourse.name_level}</h4>
                            <div style="position: absolute; bottom: 0; width: 100%">
                                <a class="fancy" href="/YogaCenter/request?action=inf&option=viewmore&id=${topcourse.idCourse}">
                                    <span class="top-key"></span>
                                    <span class="text">View more</span>
                                    <span class="bottom-key-1"></span>
                                    <span class="bottom-key-2"></span>
                                </a>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </div>
        </c:if>


        <div class="our-instructor">
            <h1>OUR INSTRUCTOR</h1>
            <div class="main-instructor">
                <div class="inner-instructor">
                    <div class="inner-content-instructor">
                        <h2>BEST <br> INSTRUCTOR</h2>
                        <p>The company itself is a very successful company. Rejecting, when not! 
                            It will happen that he who suffers the thing itself, the fault of the truth </p>
                        <a href="/YogaCenter/about">Read more</a>
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
                        <h2>NEW<br> EXPERIENCE</h2>
                        <p>The company itself is a very successful company. Rejecting, when not! It will happen who
                            the thing itself, the fault of the truth </p>
                        <a href="/YogaCenter/about">Read more</a>
                    </div>

                </div>
            </div>
        </div>



        <div class="our-gallery">
            <h1>GALLERY</h1>
            <div class="main-gallery">
                <img src="img/download.jpg" alt="alt"/>
            </div>
        </div>

        <script src="js/script.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>    
    </body>
    <c:import url="footer.html"/>
    <script>
        let slider = document.querySelector('.slider .list');
        let items = document.querySelectorAll('.slider .list .item');
        let next = document.getElementById('next');
        let prev = document.getElementById('prev');
        let dots = document.querySelectorAll('.slider .dots li');

        let lengthItems = items.length - 1;
        let active = 0;
        next.onclick = function () {
            active = active + 1 <= lengthItems ? active + 1 : 0;
            reloadSlider();
        }
        prev.onclick = function () {
            active = active - 1 >= 0 ? active - 1 : lengthItems;
            reloadSlider();
        }
        let refreshInterval = setInterval(() => {
            next.click()
        }, 8000);
        function reloadSlider() {
            slider.style.left = -items[active].offsetLeft + 'px';
            // 
            let last_active_dot = document.querySelector('.slider .dots li.active');
            last_active_dot.classList.remove('active');
            dots[active].classList.add('active');

            clearInterval(refreshInterval);
            refreshInterval = setInterval(() => {
                next.click()
            }, 8000);


        }

        dots.forEach((li, key) => {
            li.addEventListener('click', () => {
                active = key;
                reloadSlider();
            })
        })
        window.onresize = function (event) {
            reloadSlider();
        };

    </script>
</html>
