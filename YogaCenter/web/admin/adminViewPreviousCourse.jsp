<%-- 
    Document   : adminViewPreviousCourse
    Created on : Jun 19, 2023, 8:18:02 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css"/>
        <title>View course</title>
        <style>
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
        </style>
    </head>
    <body>
        <div class="container">
            <c:set var="information" value="${requestScope.information}"/>
            <div style="height: 40px; width: 100%; margin-top: 10px; margin-bottom: 10px">
                <a href="/YogaCenter/managecourse" class="btn">
                    <svg height="16" width="16" xmlns="http://www.w3.org/2000/svg" version="1.1" viewBox="0 0 1024 1024"><path d="M874.690416 495.52477c0 11.2973-9.168824 20.466124-20.466124 20.466124l-604.773963 0 188.083679 188.083679c7.992021 7.992021 7.992021 20.947078 0 28.939099-4.001127 3.990894-9.240455 5.996574-14.46955 5.996574-5.239328 0-10.478655-1.995447-14.479783-5.996574l-223.00912-223.00912c-3.837398-3.837398-5.996574-9.046027-5.996574-14.46955 0-5.433756 2.159176-10.632151 5.996574-14.46955l223.019353-223.029586c7.992021-7.992021 20.957311-7.992021 28.949332 0 7.992021 8.002254 7.992021 20.957311 0 28.949332l-188.073446 188.073446 604.753497 0C865.521592 475.058646 874.690416 484.217237 874.690416 495.52477z"></path></svg>
                    <span>Back</span>
                </a>

            </div>
            <article class="product">
                <h2>${information.name_course}</h2>
                <div class="row">
                    <div class="col-md-4 image-box">
                        <img src="img/${information.img_course}" alt="${information.name_course}" width="250" height="250"/>
                    </div>
                    <div class="col-md-8 box">
                        <h5><strong>Fee of course :</strong> ${information.fee_course} VNĐ</h5>
                        <h5><strong>Start-date of course :</strong> ${information.date_start}</h5>
                        <h5><strong>Slots of course :</strong> ${information.slot}</h5>
                        <h5><strong>Level of course :</strong> ${information.name_level}</h5>
                        <a class="cartBtn" href="#">
                            <svg class="cart" fill="white" viewBox="0 0 576 512" height="1em" xmlns="http://www.w3.org/2000/svg"><path d="M0 24C0 10.7 10.7 0 24 0H69.5c22 0 41.5 12.8 50.6 32h411c26.3 0 45.5 25 38.6 50.4l-41 152.3c-8.5 31.4-37 53.3-69.5 53.3H170.7l5.4 28.5c2.2 11.3 12.1 19.5 23.6 19.5H488c13.3 0 24 10.7 24 24s-10.7 24-24 24H199.7c-34.6 0-64.3-24.6-70.7-58.5L77.4 54.5c-.7-3.8-4-6.5-7.9-6.5H24C10.7 48 0 37.3 0 24zM128 464a48 48 0 1 1 96 0 48 48 0 1 1 -96 0zm336-48a48 48 0 1 1 0 96 48 48 0 1 1 0-96z"></path></svg>
                            Buy now
                        </a>
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
        </div>
    </body>
</html>
