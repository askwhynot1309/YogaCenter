<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Course</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="icon" type="image/x-icon" href="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png">
        <link rel="stylesheet" href="css/style.css"/>
        <style>
            .container {
                margin-top: 1.5rem;
            }
            .course-card {
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                padding: 1.5rem;
                height: 100%;
                display: flex;
                flex-direction: column;
                box-sizing: border-box;
            }
            .course-card-container {
                margin-bottom: 1.5rem;
            }
            .course-card .course-image {
                max-width: 100%;
                object-fit: cover;
            }
            .course-card .course-details {
                padding-top: 1rem;
            }
            .course-card .course-details h4 {
                margin-top: 0;
            }
            .course-card .course-details p {
                margin-bottom: 0.5rem;
            }
            .course-img {
                width: 100%;
                height: auto;
                object-fit: cover;
            }

            .course-title {
                font-size: 18px;
                font-weight: bold;
                margin-top: 10px;
                margin-bottom: 5px;
            }

            .course-description {
                font-size: 14px;
                /*                overflow: hidden;
                                white-space: nowrap;*/
            }
            .box h5{
                margin-bottom: 30px;
            }

            .cartBtn {
                width: 155px;
                height: 50px;
                border: none;
                border-radius: 20px;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 7px;
                color: white;
                font-weight: 500;
                position: relative;
                background-color: rgb(29, 29, 29);
                box-shadow: 0 20px 30px -7px rgba(27, 27, 27, 0.219);
                transition: all 0.3s ease-in-out;
                cursor: pointer;
                overflow: hidden;
            }

            .cart {
                z-index: 2;
            }

            .cartBtn:active {
                transform: scale(0.96);
            }

            .cartBtn:hover .cart {
                animation: slide-in-left 1s cubic-bezier(0.250, 0.460, 0.450, 0.940) both;
                text-decoration: none;
            }

            @keyframes slide-in-left {
                0% {
                    transform: translateX(-10px);
                    opacity: 0;
                }

                100% {
                    transform: translateX(0);
                    opacity: 1;
                }
            }
            .cssbuttons-io-button {
                background: #000;
                color: white;
                font-family: inherit;
                padding: 0.35em;
                padding-left: 1.2em;
                font-size: 17px;
                font-weight: 500;
                border-radius: 0.9em;
                border: none;
                letter-spacing: 0.05em;
                display: flex;
                align-items: center;
                box-shadow: inset 0 0 1.6em -0.6em #714da6;
                overflow: hidden;
                position: relative;
                height: 2.8em;
                padding-right: 3.3em;
            }

            .cssbuttons-io-button .icon {
                background: white;
                margin-left: 1em;
                position: absolute;
                display: flex;
                align-items: center;
                justify-content: center;
                height: 2.2em;
                width: 2.2em;
                border-radius: 0.7em;
                box-shadow: 0.1em 0.1em 0.6em 0.2em #7b52b9;
                right: 0.3em;
                transition: all 0.3s;
            }

            .cssbuttons-io-button:hover .icon {
                width: calc(100% - 0.6em);
            }

            .cssbuttons-io-button .icon svg {
                width: 1.1em;
                transition: transform 0.3s;
                color: #7b52b9;
            }

            .cssbuttons-io-button:hover .icon svg {
                transform: translateX(0.1em);
            }

            .cssbuttons-io-button:active .icon {
                transform: scale(0.95);
            }
            .btn {
                display: flex;
                height: 3em;
                width: 150px;
                align-items: center;
                justify-content: center;
                background-color: #eeeeee4b;
                border-radius: 3px;
                letter-spacing: 1px;
                transition: all 0.2s linear;
                cursor: pointer;
                border: none;
                background: #fff;
            }

            .btn > svg {
                margin-right: 5px;
                margin-left: 5px;
                font-size: 20px;
                transition: all 0.4s ease-in;
            }

            .btn a{
                text-decoration: none;
            }
            .fancy {
                background-color: transparent;
                border: 2px solid #000;
                border-radius: 0;
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
                text-decoration: none;
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
    <body>
        <c:import url="header.jsp"/>
        <div style="height: 40px; width: 100%; margin-top: 10px; margin-bottom: 10px">
            <a href="/YogaCenter/course" class="btn">
                <svg height="16" width="16" xmlns="http://www.w3.org/2000/svg" version="1.1" viewBox="0 0 1024 1024"><path d="M874.690416 495.52477c0 11.2973-9.168824 20.466124-20.466124 20.466124l-604.773963 0 188.083679 188.083679c7.992021 7.992021 7.992021 20.947078 0 28.939099-4.001127 3.990894-9.240455 5.996574-14.46955 5.996574-5.239328 0-10.478655-1.995447-14.479783-5.996574l-223.00912-223.00912c-3.837398-3.837398-5.996574-9.046027-5.996574-14.46955 0-5.433756 2.159176-10.632151 5.996574-14.46955l223.019353-223.029586c7.992021-7.992021 20.957311-7.992021 28.949332 0 7.992021 8.002254 7.992021 20.957311 0 28.949332l-188.073446 188.073446 604.753497 0C865.521592 475.058646 874.690416 484.217237 874.690416 495.52477z"></path></svg>
                <span>View all course</span>
            </a>
        </div>
        <div class="container">
            <c:set var="information" value="${requestScope.information}"/>
            <c:set var="top3Course" value="${requestScope.top3Course}"/>
            <c:set var="currentdate" value="${requestScope.currentDate}"></c:set>
            <c:set var="user" value="${sessionScope.account}"/>
            <c:set var="listCourseAccountActive" value="${requestScope.listCourseAccountActive}"/>
            <article class="product">
                <h2 style="margin-bottom: 20px">${information.name_course}</h2>
                <div class="row">
                    <div class="col-md-5 image-box">
                        <img src="img/${information.img_course}" alt="${information.name_course}" width="400" height="300"/>
                    </div>
                    <div class="col-md-7 box">
                        <h5><strong>Fee of course :</strong> ${information.fee_course} VNĐ</h5>
                        <h5><strong>Start-date of course :</strong> ${information.date_start}</h5>
                        <h5><strong>Slots of course :</strong> ${information.slot}</h5>
                        <h5><strong>Level of course :</strong> ${information.name_level}</h5>
                        <h5><strong>Time :</strong>
                            <c:if test="${information.idtime == 1}">
                                9h - 11h
                            </c:if>
                            <c:if test="${information.idtime == 2}">
                                13h - 15h
                            </c:if>
                            <c:if test="${information.idtime == 3}">
                                16h - 18h
                            </c:if>
                            <c:if test="${information.idtime == 4}">
                                19h - 21h
                            </c:if>
                        </h5>
                        <h5><strong>Time slot :</strong>
                            <c:if test="${information.choice == 1}">
                                Monday - Wednesday - Friday 
                            </c:if>
                            <c:if test="${information.choice == 2}">
                                Tuesday - Thursday - Saturday 
                            </c:if>
                            <c:if test="${information.choice == 3}">
                                Sunday
                            </c:if>

                        </h5>

                        <c:choose>
                            <c:when test="${listCourseAccountActive == null && user != null && information.status == 0}">
                                <div style="margin-bottom: 10px">
                                    <a class="cartBtn" href="/YogaCenter/request?action=AddCourseToCart&cid=${information.idCourse}">
                                        <svg class="cart" fill="white" viewBox="0 0 576 512" height="1em" xmlns="http://www.w3.org/2000/svg"><path d="M0 24C0 10.7 10.7 0 24 0H69.5c22 0 41.5 12.8 50.6 32h411c26.3 0 45.5 25 38.6 50.4l-41 152.3c-8.5 31.4-37 53.3-69.5 53.3H170.7l5.4 28.5c2.2 11.3 12.1 19.5 23.6 19.5H488c13.3 0 24 10.7 24 24s-10.7 24-24 24H199.7c-34.6 0-64.3-24.6-70.7-58.5L77.4 54.5c-.7-3.8-4-6.5-7.9-6.5H24C10.7 48 0 37.3 0 24zM128 464a48 48 0 1 1 96 0 48 48 0 1 1 -96 0zm336-48a48 48 0 1 1 0 96 48 48 0 1 1 0-96z"></path></svg>
                                        Buy now
                                    </a>
                                </div>
                            </c:when>
                            <c:when test="${user != null && (currentdate.after(information.date_close) || currentdate.equals(information.date_close))}">
                                <div style="text-align: center">
                                    <p style="color: red">The course has been closed.</p>
                                </div>
                            </c:when>
                            <c:when test="${listCourseAccountActive != null && user != null}">
                                <c:set var="courseBought" value="false" scope="page" />
                                <c:forEach var="coureactive" items="${listCourseAccountActive}">
                                    <c:if test="${information.idCourse == coureactive.id_course}">
                                        <c:set var="courseBought" value="true" scope="page" />
                                    </c:if>
                                </c:forEach>
                                <c:choose>
                                    <c:when test="${courseBought}">
                                        <p style="text-align: center; color: red">You bought the course</p>
                                    </c:when>
                                    <c:otherwise>
                                        <div style="margin-bottom: 10px">
                                            <a class="cartBtn" href="/YogaCenter/request?action=AddCourseToCart&cid=${information.idCourse}">
                                                <svg class="cart" fill="white" viewBox="0 0 576 512" height="1em" xmlns="http://www.w3.org/2000/svg"><path d="M0 24C0 10.7 10.7 0 24 0H69.5c22 0 41.5 12.8 50.6 32h411c26.3 0 45.5 25 38.6 50.4l-41 152.3c-8.5 31.4-37 53.3-69.5 53.3H170.7l5.4 28.5c2.2 11.3 12.1 19.5 23.6 19.5H488c13.3 0 24 10.7 24 24s-10.7 24-24 24H199.7c-34.6 0-64.3-24.6-70.7-58.5L77.4 54.5c-.7-3.8-4-6.5-7.9-6.5H24C10.7 48 0 37.3 0 24zM128 464a48 48 0 1 1 96 0 48 48 0 1 1 -96 0zm336-48a48 48 0 1 1 0 96 48 48 0 1 1 0-96z"></path></svg>
                                                Buy now
                                            </a>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </c:when>
                            <c:when test="${user == null && information.status == 0}">
                                <button class="cssbuttons-io-button">Register now
                                    <a  href="register.jsp" class="icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path fill="none" d="M0 0h24v24H0z"></path><path fill="currentColor" d="M16.172 11l-5.364-5.364 1.414-1.414L20 12l-7.778 7.778-1.414-1.414L16.172 13H4v-2z"></path></svg>
                                    </a>
                                </button>
                            </c:when>
                            <c:otherwise>
                                <p style="color: red">This course was closed.</p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <div style="width: 100%; margin-top: 20px; margin-bottom: 20px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); padding: 20px">
                    <h5><strong>Objective</strong></h5>
                    <p style="font-size: 15px">${information.learnt}</p>
                </div>
                <div style="width: 100%; margin-top: 20px; margin-bottom: 20px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); padding: 20px">
                    <h5><strong>Summary</strong></h5>
                    <p style="font-size: 15px">${information.summary}</p>
                </div>
                <div style="margin-bottom: 50px">
                    <h5><strong>Information detail</strong></h5>
                    <p>${information.description}</p>
                </div>
            </article>
            <div style="width: 100%; padding: 10px; background: #009879; margin-bottom: 20px">
                <h3 style="text-transform: uppercase">courses you may know</h3>
            </div>
            <div>
                <c:if test="${top3Course != null}">
                    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3">
                        <c:forEach var="course" items="${top3Course}">
                            <div class="col-md-4">
                                <div class="course-card-container">
                                    <div class="course-card" style="height: 480px; position: relative">
                                        <img src="img/${course.img_course}" alt="Course Image" class="course-image" height="175px" width="310px">
                                        <div class="course-details">
                                            <h4 class="course-title">${course.name_course}</h4>
                                            <p><strong>Fee:</strong> ${course.fee_course}</p>
                                            <p><strong>Start Date:</strong> ${course.date_start}</p>
                                            <p><strong>Level:</strong> ${course.name_level}</p>
                                            <c:if test="${user != null && course.status == 1}">
                                                <div style="position: absolute; bottom: 10px; width: 90%">
                                                    <div style="margin-bottom: 10px">
                                                        <a class="cartBtn" href="/YogaCenter/request?action=AddCourseToCart&cid=${course.idCourse}" style="width: 100%">
                                                            <svg class="cart" fill="white" viewBox="0 0 576 512" height="1em" xmlns="http://www.w3.org/2000/svg"><path d="M0 24C0 10.7 10.7 0 24 0H69.5c22 0 41.5 12.8 50.6 32h411c26.3 0 45.5 25 38.6 50.4l-41 152.3c-8.5 31.4-37 53.3-69.5 53.3H170.7l5.4 28.5c2.2 11.3 12.1 19.5 23.6 19.5H488c13.3 0 24 10.7 24 24s-10.7 24-24 24H199.7c-34.6 0-64.3-24.6-70.7-58.5L77.4 54.5c-.7-3.8-4-6.5-7.9-6.5H24C10.7 48 0 37.3 0 24zM128 464a48 48 0 1 1 96 0 48 48 0 1 1 -96 0zm336-48a48 48 0 1 1 0 96 48 48 0 1 1 0-96z"></path></svg>
                                                            ADD TO CART
                                                        </a>
                                                    </div>
                                                    <div>
                                                        <a class="fancy" href="/YogaCenter/request?action=inf&option=viewmore&id=${course.idCourse}">
                                                            <span class="top-key"></span>
                                                            <span class="text">View more</span>
                                                            <span class="bottom-key-1"></span>
                                                            <span class="bottom-key-2"></span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <c:if test="${user == null}">
                                                <div style="position: absolute; bottom: 10px; width: 90%">
                                                    <a class="fancy" href="/YogaCenter/request?action=inf&option=viewmore&id=${course.idCourse}">
                                                        <span class="top-key"></span>
                                                        <span class="text">View more</span>
                                                        <span class="bottom-key-1"></span>
                                                        <span class="bottom-key-2"></span>
                                                    </a>
                                                    <button class="cssbuttons-io-button" style="width: 100%">Register now
                                                        <a  href="register.jsp" class="icon">
                                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path fill="none" d="M0 0h24v24H0z"></path><path fill="currentColor" d="M16.172 11l-5.364-5.364 1.414-1.414L20 12l-7.778 7.778-1.414-1.414L16.172 13H4v-2z"></path></svg>
                                                        </a>
                                                    </button>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>
            </div>
        </div>
    </body>
    <c:import url="footer.html"/>
</html>
