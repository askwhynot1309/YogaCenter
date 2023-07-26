<%-- 
    Document   : aboutUs
    Created on : Jun 10, 2023, 4:50:17 PM
    Author     : quyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>About Us - Yoga Center</title>
        <link rel="icon" type="image/x-icon" href="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f8f9fa;
            }

            .container {
                max-width: 80%;
                margin: 0 auto;
                padding: 20px;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            .submit-contain-header .small-text {
                font-style: normal;
                font-weight: unset;
                font-size: 16px;
                line-height: 24px;
            }

            .section-content {
                font-size: 20px;
            }
        </style>
    </head>
    <body>
        <div style="margin-bottom: 10px;"><c:import url="header.jsp"></c:import></div>


            <div class="container">
                <div class="banner-contain" style="margin-bottom: 30px;">
                    <div class="item">
                        <div class="submit-contain-header">
                            <div class="submit-header-content">
                                <p class="text-center" style="font-size: 70px;">ABOUT US</p>
                                <h3 class="text-center"><span style="font-size: 40px; color: var(--mainclr);">"AT THE YOGA CENTER, OUR TOP PRIORITY IS TO BRING HEALTH,HAPPINESS AND HOPE TO EVERYONE "</span></h3>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="mt-5">
                    <div class="mb-5 text-center">
                        <div style="font-size: 40px; color: #3eb489">YOGA CENTER - WHERE YOU BELONG</div>
                    </div>

                    <div class="d-flex row justify-content-center mb-2">
                        <div class="col-md-8">
                            <h2 class="section-title">Our Origin</h2>
                            <p class="section-content">Yoga Center was founded in 2005 with a vision to promote health, well-being, and mindfulness through the practice of yoga. Our journey began with a small studio space and a dedicated group of passionate instructors.</p>
                            <p class="section-content">Over the years, we have grown into a thriving community with multiple locations across the city. Our mission remains unchanged - to create a welcoming and inclusive environment where people of all ages and fitness levels can discover the transformative power of yoga.</p>
                            <p class="section-content">We believe in the holistic benefits of yoga, not just for physical fitness but also for mental and emotional well-being. Through our expertly designed classes and personalized guidance, we strive to empower individuals to lead healthier and happier lives.</p>
                            <p class="section-content">Join us on this journey of self-discovery, inner peace, and personal growth. Experience the harmony of mind, body, and soul at Yoga Center.</p>  
                        </div>
                        <div class="col-md-3">
                            <img src="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png" style="max-width: 100%; height: auto;">
                        </div>
                    </div>


                    <div class="mb-5 text-center">
                        <div style="font-size: 40px; color: #3eb489">YOGA CENTER CURRENTLY HAVE</div>
                    </div>
                    <div class="row justify-content-between flex-wrap mb-5 text-center"> 
                        <div class="col-md-4">
                            <div>
                                <div style="font-size: 60px;">2</div>
                                <div style="font-size: 40px;">Centers</div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div style="font-size: 60px;">${requestScope.customerCount}</div>
                        <div style="font-size: 40px;">Customers</div>
                    </div>
                    <div class="col-md-4">
                        <div>
                            <div style="font-size: 60px;">${requestScope.employeeCount}</div>
                            <div style="font-size: 40px;">Employees</div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="justify-content-center align-items-center">
                <div class="text-center">
                    <p style="font-size: 40px; color: #3eb489">MEET OUR TRAINER</p>
                </div>
                <div class="row justify-content-center">
                    <c:forEach items="${requestScope.listTrainer}" var="trainer" varStatus="status">
                        <c:if test="${status.index < 3}">
                            <div class="col-md-3 border ml-5" >
                                <div class="mb-4" >
                                    <div class="card-body align-items-center">
                                        <div class="mb-5">
                                            <c:if test="${not empty trainer.image}">
                                                <img src="img/${trainer.image}" style="width: 250px; height: 250px;">
                                            </c:if>
                                            <c:if test="${empty trainer.image}">
                                                <img src="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png" style="width: 250px; height: 250px;">
                                            </c:if>
                                        </div>

                                        <div>
                                            <h4 class="text-center mb-1">${trainer.name}</h4>
                                            <div class="text-center mt-5">
                                                <p class="text-center"><strong>${trainer.cv}</strong></p>                                       
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>

            <div>
                <h4></h4>
            </div>


            <div style="margin-top: 200px;">

            </div>
        </div>        
        <c:import url="footer.html"/>
    </body>
</html>

