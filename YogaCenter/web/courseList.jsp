<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Course List</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="icon" type="image/x-icon" href="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png">
        <link rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="css/admin/admin-course-add.css">
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
                height: auto;
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
                width: 100%;
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
            .cartBtn {
                width: 155px;
                height: 50px;
                border: none;
                border-radius: 0px;
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
                width: 100%;
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
        </style>
    </head>
    <body>
        <c:import url="header.jsp"/>
        <c:set var="CourseList" value="${requestScope.CourseList}"></c:set>
        <c:set var="CourseLevel" value="${requestScope.CourseLevel}"></c:set>
        <c:set var="addsuccess" value="${requestScope.addsuccess}"></c:set>
        <c:set var="ErrorMessage" value="${requestScope.ErrorMessage}"></c:set>
        <c:set var="user" value="${sessionScope.account}"/>
        <c:set var="listCourseAccountActive" value="${requestScope.listCourseAccountActive}"/>
        <div class="container">
            <div style="width: 100%; padding: 10px; background: #009879; margin-bottom: 20px">
                <h3 style="text-transform: uppercase">courses in YogaCenter</h3>
            </div>
            <c:if test="${CourseList == null}">
                <h3 style="text-align: center; margin-bottom: 300px"><c:out value="${ErrorMessage}"/></h3>
            </c:if>
            <c:if test="${CourseList.size() > 0}">
                <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3">
                    <c:forEach var="course" items="${CourseList}">
                        <div class="col-md-4">
                            <div class="course-card-container">
                                <div class="course-card" style="height: 480px; position: relative">
                                    <img src="img/${course.img_course}" alt="Course Image" class="course-image">
                                    <div class="course-details">
                                        <h4 class="course-title">${course.name_course}</h4>
                                        <p><strong>Fee:</strong> ${course.fee_course}</p>
                                        <p><strong>Start Date:</strong> ${course.date_start}</p>
                                        <p><strong>Level:</strong> ${course.name_level}</p>
                                        <c:if test="${user != null && course.status == 0}">
                                            <div style="position: absolute; bottom: 10px; width: 90%">
                                                <div style="margin-bottom: 10px">
                                                    <a class="cartBtn" href="/YogaCenter/request?action=AddCourseToCart&cid=${course.idCourse}">
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
                                        <c:if test="${user != null && course.status == 1}">
                                            <div style="position: absolute; bottom: 10px; width: 90%">
                                                <div style="text-align: center">
                                                    <p style="color: red">The course has been closed.</p>
                                                </div>
                                                <a class="fancy" href="/YogaCenter/request?action=inf&option=viewmore&id=${course.idCourse}">
                                                    <span class="top-key"></span>
                                                    <span class="text">View more</span>
                                                    <span class="bottom-key-1"></span>
                                                    <span class="bottom-key-2"></span>
                                                </a>
                                            </div>
                                        </c:if>
                                        <c:if test="${listCourseAccountActive != null && user != null}">
                                            <div style="position: absolute; bottom: 10px; width: 90%">
                                                <c:forEach var="coureactive" items="${listCourseAccountActive}">
                                                    <c:if test="${course.idCourse == coureactive.id_course}">
                                                        <p style="text-align: center; color: red">You bought course</p>
                                                    </c:if>
                                                </c:forEach>
                                                <a class="fancy" href="/YogaCenter/request?action=inf&option=viewmore&id=${course.idCourse}">
                                                    <span class="top-key"></span>
                                                    <span class="text">View more</span>
                                                    <span class="bottom-key-1"></span>
                                                    <span class="bottom-key-2"></span>
                                                </a>
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
                                                <button class="cssbuttons-io-button">Register now
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
        <c:if test="${addsuccess != null}">
            <div class="notification-success" style="z-index: 1000">
                <div class="content">
                    <div class="title">Success</div>
                    <span>Add to cart a course successfully.</span>
                </div>
            </div>
            <script>
                let notification = document.querySelector('.notification-success');
                notification.timeOut = setTimeout(() => notification.remove(), 2000);
            </script>
        </c:if>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
    <c:import url="footer.html"/>
</html>
