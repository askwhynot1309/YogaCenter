<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Course List</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
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
        </style>
    </head>
    <body>
        <c:import url="headerLogin.jsp"/>
        <c:set var="CourseList" value="${requestScope.CourseList}"></c:set>
        <c:set var="CourseLevel" value="${requestScope.CourseLevel}"></c:set>
        <c:if test="${ErrorMessage != null}">
            <div>${requestScope.ErrorMessage}</div>
        </c:if>
        <div class="container">
            <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3">
                <c:forEach var="course" items="${CourseList}">
                    <div class="col-md-4">
                        <div class="course-card-container">
                            <div class="course-card">
                                <img src="https://i.pinimg.com/originals/56/b3/3f/56b33f65326afe02aedf24361452a3db.jpg" alt="Course Image" class="course-image">
                                <div class="course-details">
                                    <h4 class="course-title">${course.name_course}</h4>
                                    <p><strong>Fee:</strong> ${course.fee_course}</p>
                                    <p><strong>Start Date:</strong> ${course.date_start}</p>
                                    <p><strong>Slots:</strong> ${course.slot}</p>
                                    <p><strong>Level:</strong> ${course.level}</p>
                                    <p class="course-description"><strong>Description:</strong> ${course.description}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
