<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="icon" type="image/x-icon" href="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png">
        <link rel="stylesheet" href="css/staff/staff.css">
        <title>Course Management</title>
        <style>
            .overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                z-index: 9999;
            }
            .message {
                box-shadow: var(--shadow-2), 0 0 0 100vw rgb(0 0 0 / 0.5);
                background: #fff;
                color: #222;
                border: 0;
                border-radius: 0.25rem;
                position: fixed;
                top: 50%;
                left: 50%;
                border-radius: 20px;
                transform: translate(-50%, -50%);
                padding: 20px;
                z-index: 10000;
            }

            .message::backdrop {
                background: rgb(0 0 0 / 0.5);
                opacity: 0;
            }
        </style>
    </head>

    <body>
        <c:set var="exist" value="${sessionScope.Staff}"/>
        <c:if test="${exist == null}">
            <div id="overlay" class="overlay"></div>
            <div class="message" id="message">
                <h3 style="text-align: center; color: red">Message</h3>
                <p>Your session is timeout. Back to login page to login again!</p>
                <div style=" text-align: center">
                    <a class="btn btn-primary" href="login.jsp">Login</a>
                </div>
            </div>
        </c:if>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3" style="padding: 0; position: fixed">
                    <c:import url="staffMenu.jsp"></c:import>
                    </div>
                    <div class="col-lg-9" style="margin-left: 300px">
                        <a href="/YogaCenter/listcourse" class="btn">
                            <svg height="16" width="16" xmlns="http://www.w3.org/2000/svg" version="1.1" viewBox="0 0 1024 1024"><path d="M874.690416 495.52477c0 11.2973-9.168824 20.466124-20.466124 20.466124l-604.773963 0 188.083679 188.083679c7.992021 7.992021 7.992021 20.947078 0 28.939099-4.001127 3.990894-9.240455 5.996574-14.46955 5.996574-5.239328 0-10.478655-1.995447-14.479783-5.996574l-223.00912-223.00912c-3.837398-3.837398-5.996574-9.046027-5.996574-14.46955 0-5.433756 2.159176-10.632151 5.996574-14.46955l223.019353-223.029586c7.992021-7.992021 20.957311-7.992021 28.949332 0 7.992021 8.002254 7.992021 20.957311 0 28.949332l-188.073446 188.073446 604.753497 0C865.521592 475.058646 874.690416 484.217237 874.690416 495.52477z"></path></svg>
                            <span>Back</span>
                        </a>
                        <h2 style="display: flex; justify-content: center; margin-bottom: 10px; font-family: monospace;font-weight: 700; margin-top: 20px; text-transform: uppercase">Information of course</h2>
                    <c:set var="informationCourse" value="${requestScope.informationCourse}"/>
                    <c:set var="stringPrice" value="${requestScope.stringPrice}"/>
                    <c:set var="expired" value="${requestScope.expired}"/>
                    <c:set var="success" value="${requestScope.success}"/>
                    <c:if test="${informationCourse != null}">
                        <div style="height: 100vh; padding: 20px; margin-top: 1rem">
                            <div style="float: left; height: 270px">
                                <div style="width: 270px; border: 5px solid black; padding: 5px; height: 270px ">
                                    <img src="img/${informationCourse.img_course}" height="250px" width="250px"><br><br>
                                </div>
                            </div>
                            <div style="float: right; width: 700px">
                                <div style="height: 270px">
                                    <h4><span style="font-weight: 700">Name of course : </span><span style="font-size: 20px">${informationCourse.name_course}</span></h4>
                                    <p><span style="font-weight: 700; font-size: 18px">Fee of course : </span> ${stringPrice}.000 VNĐ</p>
                                    <p><span style="font-weight: 700; font-size: 18px">Start-date of course : </span>${informationCourse.date_start}</p>
                                    <p><span style="font-weight: 700; font-size: 18px">Slots : </span>${informationCourse.slot} slots</p>
                                </div>
                            </div>
                            <div style="float: left; width: 100%; margin-top: 20px; margin-bottom: 20px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); padding: 20px">
                                <h5><strong>Objective</strong></h5>
                                <p style="font-size: 15px">${informationCourse.learnt}</p>
                            </div>
                            <div style="float: left; width: 100%; margin-top: 20px; margin-bottom: 20px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); padding: 20px">
                                <h5><strong>Summary</strong></h5>
                                <p style="font-size: 15px">${informationCourse.summary}</p>
                            </div>
                            <div style="float: left; margin-top: 20px">
                                <p><span style="font-weight: 700; font-size: 18px">Detail of course : </span></p>
                                ${informationCourse.description}
                            </div>
                        </div>
                    </c:if>
                </div>
                </body>
                </html>
