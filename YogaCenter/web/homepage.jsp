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
                <div class="inner-class">
                    <div>
                        <img style="width: 80%; height: 250px; object-fit: cover" src="<%= course.getImg_course()%>" alt=""/>
                    </div>
                    <div class="class-content">
                        <h2><%= course.getLevel()%></h2>
                        <p><%= course.getDescription()%></p>
                        <%
                            if (account == null) {
                        %>
                        <a class="button" href="register.jsp">register now</a>
                        <%
                        } else {
                        %>
                        <a class="button" href="/YogaCenter/request?action=AddCourseToCart&cid=<%= course.getIdCourse()%>">Add to cart</a>
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
