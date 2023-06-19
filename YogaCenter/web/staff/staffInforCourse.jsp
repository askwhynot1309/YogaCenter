<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="css/staff/staff.css">
    </head>

    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3" style="padding: 0; position: fixed">
                    <c:import url="staffMenu.jsp"></c:import>
                    </div>
                    <div class="col-lg-9" style="margin-left: 300px">
                        <h2 style="display: flex; justify-content: center; margin-bottom: 10px; font-family: monospace;font-weight: 700; margin-top: 20px; text-transform: uppercase">Information of course</h2>
                    <c:set var="informationCourse" value="${requestScope.informationCourse}"/>
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
                                    <p><span style="font-weight: 700; font-size: 18px">Fee of course : </span> ${informationCourse.fee_course} VNĐ</p>
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
