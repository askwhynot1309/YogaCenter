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
                        <a href="register.jsp">Register now</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="our-classes">
            <a href="/YogaCenter/course"><h1>Our class</h1></a>
            <div class="main-class">
                <%
                    Account account = (Account) session.getAttribute("account");
                    ArrayList<Course> courseList = CourseDao.getAllCourse();
                    Collections.shuffle(courseList); // Shuffle the courseList randomly
                    int count = 0; // Counter to track the number of displayed courses
                    for (Course course : courseList) {
                        if (count < 3) { // Display only the first three courses
                            count++;
                %>
                <div class="inner-class" style="height: 450px; position: relative">
                    <div>
                        <img style="width: 80%; height: 250px; object-fit: cover" src="img/<%= course.getImg_course()%>" alt=""/>
                    </div>
                    <div class="class-content" style="margin-top: 20px">
                        <h4>Name of course : <%= course.getName_course()%></h4>
                        <h4 style="margin-bottom: 20px">Level : <%= course.getName_level()%></h4>
                        <%
                            if (account == null && course.getLevel() == 1) {
                        %>
                        <div style="position: absolute; bottom: 0; width: 100%">
                        <a class="fancy" href="/YogaCenter/request?action=inf&option=viewmore&id=<%= course.getIdCourse()%>">
                            <span class="top-key"></span>
                            <span class="text">View more</span>
                            <span class="bottom-key-1"></span>
                            <span class="bottom-key-2"></span>
                        </a>
                        </div>
                        <%
                        } else {
                        %>
                        <div style="position: absolute; bottom: 0; width: 100%">
                        <a class="fancy" href="/YogaCenter/request?action=inf&option=viewmore&id=<%= course.getIdCourse()%>">
                            <span class="top-key"></span>
                            <span class="text">View more</span>
                            <span class="bottom-key-1"></span>
                            <span class="bottom-key-2"></span>
                        </a>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
                <%
                        }
                    }
                %>
            </div>
        </div>


        <div class="our-instructor">
            <h1>OUR INSTRUCTOR</h1>
            <div class="main-instructor">
                <div class="inner-instructor">
                    <div class="inner-content-instructor">
                        <h2>BEST <br> INSTRUCTOR</h2>
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
                        <h2>NEW<br> EXPERIENCE</h2>
                        <p>The company itself is a very successful company. Rejecting, when not! It will happen who
                            the thing itself, the fault of the truth </p>
                        <a href="homepage/aboutUs.jsp">Read more</a>
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


        <div class="our-prices">
            <h1>PRICES</h1>
            <div class="main-prices">
                <div class="inner-prices">
                    <h2>Newbie classes</h2>
                    <h3>Prices : $00.00/</h3>
                    <div class="price-icon">
                        <i class="fas fa-award"></i>
                    </div>
                    <a href="register.jsp">Register now</a>
                </div>

                <div class="inner-prices">
                    <h2>Newbie classes</h2>
                    <h3>Prices : $00.00/</h3>
                    <div class="price-icon">
                        <i class="fas fa-award"></i>
                    </div>
                    <a href="register.jsp">Register now</a>
                </div>

                <div class="inner-prices">
                    <h2>Newbie classes</h2>
                    <h3>Prices : $00.00/</h3>
                    <div class="price-icon">
                        <i class="fas fa-award"></i>
                    </div>
                    <a href="register.jsp">Register now</a>
                </div>
            </div>
        </div>


        <div class="contact-us">
            <!--        <div class="main-contact">
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
                    </div>-->
        </div>

        <script src="js/script.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>    
    </body>
    <c:import url="footer.html"/>
</html>
