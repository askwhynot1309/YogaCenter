<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Admin Dashboard</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="icon" type="image/x-icon" href="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png">
        <link rel="stylesheet" href="css/admin/admin.css">
        <style>
            .btn {
                display: flex;
                height: 3em;
                width: 100px;
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

            .btn:hover > svg {
                font-size: 1.2em;
                transform: translateX(-5px);
            }

            .btn:hover {
                box-shadow: 9px 9px 33px #d1d1d1, -9px -9px 33px #ffffff;
                transform: translateY(-2px);
            }
            .btn a{
                text-decoration: none;
            }
        </style>
    </head>

    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3" style="padding: 0">
                    <c:import url="adminMenu.jsp"/>
                </div>
                <div class="col-lg-9">
                    <div style="height: 40px; width: 100%; margin-top: 10px; margin-bottom: 10px">
                            <a href="/YogaCenter/schedule" class="btn">
                                <svg height="16" width="16" xmlns="http://www.w3.org/2000/svg" version="1.1" viewBox="0 0 1024 1024"><path d="M874.690416 495.52477c0 11.2973-9.168824 20.466124-20.466124 20.466124l-604.773963 0 188.083679 188.083679c7.992021 7.992021 7.992021 20.947078 0 28.939099-4.001127 3.990894-9.240455 5.996574-14.46955 5.996574-5.239328 0-10.478655-1.995447-14.479783-5.996574l-223.00912-223.00912c-3.837398-3.837398-5.996574-9.046027-5.996574-14.46955 0-5.433756 2.159176-10.632151 5.996574-14.46955l223.019353-223.029586c7.992021-7.992021 20.957311-7.992021 28.949332 0 7.992021 8.002254 7.992021 20.957311 0 28.949332l-188.073446 188.073446 604.753497 0C865.521592 475.058646 874.690416 484.217237 874.690416 495.52477z"></path></svg>
                                <span>Back</span>
                            </a>
                        </div>
                    <h2 style="display: flex; justify-content: center; margin-bottom: 50px; font-family: monospace;font-weight: 700; margin-top: 20px; text-transform: uppercase">Class Information</h2>
                    <c:set var="ListTrainee" value="${requestScope.ListTrainee}"/>
                    <c:set var="inforClass" value="${requestScope.InforClass}"/>
                    <c:if test="${InforClass != null}">
                        <table class="table">
                            <tbody>
                                <tr>
                                    <td style="padding: 20px; font-weight: 700">Course Name : </td>
                                    <td style="padding: 20px">${inforClass.course}</td>
                                </tr>
                                <tr>
                                    <td style="padding: 20px; font-weight: 700">Room : </td>
                                    <td style="padding: 20px">${inforClass.class_name}</td>
                                </tr>
                                <tr>
                                    <td style="padding: 20px; font-weight: 700">Time : </td>
                                    <td style="padding: 20px">
                                        <c:if test="${inforClass.time == 1}">
                                            9h - 11h
                                        </c:if>
                                        <c:if test="${inforClass.time == 2}">
                                            13h - 15h
                                        </c:if>
                                        <c:if test="${inforClass.time == 3}">
                                            16h - 18h
                                        </c:if>
                                        <c:if test="${inforClass.time == 4}">
                                            19h - 21h
                                        </c:if>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 20px; font-weight: 700">Trainer : </td>
                                    <td style="padding: 20px">${inforClass.account}</td>
                                </tr>
                                <tr>
                                    <td style="padding: 20px; font-weight: 700">Date : </td>
                                    <td style="padding: 20px">${inforClass.date}</td>
                                </tr>
                            </tbody>
                        </table>
                    </c:if>
                    <h3 style="display: flex; margin-bottom: 20px; font-family: monospace;font-weight: 700; margin-top: 30px; text-transform: uppercase; background-color: #3b83f65f; color: #0071e2; padding: 10px">Trainees of the course</h3>
                    <c:if test="${ListTrainee == null}">
                        <p style="text-align: center; font-weight: 700">Do not have any trainees that learn this course !</p>
                    </c:if>
                    <c:if test="${ListTrainee != null}">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Image</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Phone</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="trainee" items="${ListTrainee}" varStatus="loop">
                                    <tr>
                                        <td>${loop.count}</td>
                                        <td>
                                            <c:if test="${not empty trainee.image}">
                                                <img src="img/${trainee.image}" width="100px" height="100px">
                                            </c:if>
                                        </td>
                                        <td>${trainee.name}</td>
                                        <td>${trainee.email}</td>
                                        <td>${trainee.phone}</td>
                                    </tr>   
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                </div>
            </div>
        </div>
    </body>
</html>