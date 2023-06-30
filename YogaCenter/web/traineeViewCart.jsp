<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="Object.Account"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="Dao.CourseDao"%>
<%@page import="Object.Course"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="icon" type="image/x-icon" href="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png">
        <link rel="stylesheet" href="css/style.css"/>
        <title>View cart</title>
    </head>
    <style>
        .title{
            margin-bottom: 5vh;
        }
        .card{
            margin: auto;
            /*max-width: 950px;*/
            width: 90%;
            box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            border-radius: 1rem;
            border: transparent;
        }
        @media(max-width:767px){
            .card{
                margin: 3vh auto;
            }
        }
        .cart{
            background-color: #fff;
            padding: 4vh 5vh;
            border-bottom-left-radius: 1rem;
            border-top-left-radius: 1rem;
        }
        @media(max-width:767px){
            .cart{
                padding: 4vh;
                border-bottom-left-radius: unset;
                border-top-right-radius: 1rem;
            }
        }
        .summary{
            background-color: #ddd;
            border-top-right-radius: 1rem;
            border-bottom-right-radius: 1rem;
            padding: 4vh;
            color: rgb(65, 65, 65);
        }
        @media(max-width:767px){
            .summary{
                border-top-right-radius: unset;
                border-bottom-left-radius: 1rem;
            }
        }
        .summary .col-2{
            padding: 0;
        }
        .summary .col-10
        {
            padding: 0;
        }
        .row{
            margin: 0;
        }
        .title b{
            font-size: 1.5rem;
        }
        .main{
            margin: 0;
            padding: 4vh 0;
            width: 100%;
        }
        .col-2, .col{
            padding: 0 1vh;
        }
        .close{
            margin-left: auto;
            font-size: 0.7rem;
        }
        .back-to-shop{
            margin-top: 4.5rem;
        }
        h5{
            margin-top: 4vh;
        }
        hr{
            margin-top: 1.25rem;
        }
        form{
            padding: 2vh 0;
        }
        select{
            border: 1px solid rgba(0, 0, 0, 0.137);
            padding: 1.5vh 1vh;
            margin-bottom: 4vh;
            outline: none;
            width: 100%;
            background-color: rgb(247, 247, 247);
        }
        input{
            border: 1px solid rgba(0, 0, 0, 0.137);
            padding: 1vh;
            margin-bottom: 4vh;
            outline: none;
            width: 100%;
            background-color: rgb(247, 247, 247);
        }
        input:focus::-webkit-input-placeholder
        {
            color:transparent;
        }
        .btn{
            background-color: #000;
            border-color: #000;
            color: white;
            width: 100%;
            font-size: 0.7rem;
            margin-top: 4vh;
            padding: 1vh;
            border-radius: 0;
        }
        .btn:focus{
            box-shadow: none;
            outline: none;
            box-shadow: none;
            color: white;
            -webkit-box-shadow: none;
            -webkit-user-select: none;
            transition: none;
        }
        .btn:hover{
            color: white;
        }
        a{
            color: black;
        }
        a:hover{
            color: black;
            text-decoration: none;
        }
        #code{
            background-image: linear-gradient(to left, rgba(255, 255, 255, 0.253) , rgba(255, 255, 255, 0.185)), url("https://img.icons8.com/small/16/000000/long-arrow-right.png");
            background-repeat: no-repeat;
            background-position-x: 95%;
            background-position-y: center;
        }
        .hidden {
            display: none;
        }

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

        .message[closing] {
            animation: slide-up 1000ms forwards, fade-out 500ms forwards;
        }

        @keyframes fade-out {
            0% {
                opacity: 1;
            }
            100% {
                opacity: 0;
            }
        }

        @keyframes slide-up {
            0% {
                transform: translateY(100%);
            }
            100% {
                transform: translateY(0%);
            }
        }

        /* extra styling */

        .message {
            width: 400px;

            & > * {
                margin: 0 0 0.5rem 0;
            }
        }
    </style>
    <body>
        <c:import url="header.jsp"/>
        <%
            HashMap<String, Integer> cart = (HashMap) session.getAttribute("cart");
            int totalMoney = 0;
            ArrayList<Course> courseList = CourseDao.getAllCourse();
            NumberFormat nf = NumberFormat.getInstance(new Locale("vi", "VN"));
        %>
        <div style="padding: 3rem 7%;" id="home" class="back">
            <div class="mian-home">
                <div class="card">
                    <div class="row">
                        <div class="col-md-8 cart">
                            <div class="title">
                                <div class="row">
                                    <div class="col"><h4><b>Yoga Classes Cart</b></h4></div>
                                    <div class="col align-self-center text-right text-muted"><span id='headCounts'></span> items</div>
                                </div>
                            </div>   
                            <div id="theItems">
                                <%
                                    if (cart != null) {
                                        Set<String> courseID = cart.keySet();
                                        for (String cID : courseID) {
                                            double price = 0;
                                            String imgPath = "";
                                            String courseName = "";
                                            for (Course course : courseList) {
                                                if (course.getIdCourse() == Integer.parseInt(cID)) {
                                                    totalMoney += course.getFee_course().intValue();
                                                    imgPath = course.getImg_course();
                                                    price = course.getFee_course().doubleValue();
                                                    courseName = course.getName_course();
                                                }
                                            }
                                %>
                                <form>
                                    <div class="row border-top border-bottom">
                                        <div class="row main align-items-center">
                                            <div class="col-2">
                                                <img style="width: 50px; height: " class="img-fluid" src="img/<%=imgPath%>">
                                            </div>
                                            <div class="col">
                                                <div class="row"><%= courseName%></div>    
                                            </div>
                                            <div class="col">
                                                <%= nf.format(price)%>.000 VNÐ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <a href="/YogaCenter/request?action=DeleteCartItems&courseID=<%=cID%>" style="cursor: pointer" class="close">✕</a>
                                            </div>
                                        </div>
                                    </div>
                                </form>

                                <%
                                        }
                                    }
                                %>

                            </div>
                            <div class="back-to-shop"><a href="/YogaCenter/course" style="padding: 0 1vh">&leftarrow;</a><span class="text-muted">Back to shop</span></div>
                        </div>
                        <div class="col-md-4 summary">
                            <div><h5><b>Summary</b></h5></div>
                            <hr>
                            <div class="row">
                                <div class="col" style="padding-left:1px;"> ITEMS <span id="checkoutQuantity"></span></div>
                                <div class="col text-right"><span id="checkoutPrice"><%= nf.format(totalMoney)%>.000</span> VNĐ</div>
                            </div>
                            <form action="/YogaCenter/request" method="POST">
                                <p>PAYMENT METHOD</p>
                                <select name="method">
                                    <option class="text-muted" value="0">CASH</option>
                                    <option class="text-muted" value="1">BANK TRANSFER</option>
                                    <option class="text-muted" value="2">YOUR ACCOUNT MONEY</option>
                                </select>

                                <div class="row" style="border-top: 1px solid rgba(0,0,0,.1); padding: 2vh 0;">
                                    <div class="col">TOTAL PRICE</div>
                                    <div class="col text-right"><span id="checkoutPriceMore"><%= nf.format(totalMoney)%>.000</span> VNĐ</div>
                                </div>
                                <input name="total" value="<%= totalMoney%>" hidden="">
                                <button type="submit" value="saveOrder" name="action" class="btn">CHECKOUT</button>
                            </form>
                        </div>
                    </div>
                    <c:set var="message" value="${requestScope.message}"/>
                    <c:if test="${message != null}">
                        <div id="overlay" class="overlay"></div>
                        <div class="message" id="message" style="width: 400px">
                            <h3 style="text-align: center; color: blue">Message</h3>
                            <p>There is not enough money in your account right now. Please choose a payment method to pay the rest.</p>
                            <p>Amount to be paid : ${message} VNĐ</p>
                            <div>
                                <form method="POST" action="/YogaCenter/request">
                                    PAYMENT METHOD : <select name="method">
                                        <option class="text-muted" value="0">CASH</option>
                                        <option class="text-muted" value="1">BANK TRANSFER</option>
                                    </select><br>
                                    <input name="total" value="${message}" hidden="">
                                    <div style="display: flex; align-items: center; justify-content: space-between">
                                        <button class="btn btn-primary" name="action" value="Ok" style="width: 75px">Comfirm</button>
                                        <button class="btn btn-primary btn-close" style="width: 75px">Close</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>

        <script>
            const modal = document.querySelector("#message");
            const closeModal = document.querySelector(".btn-close");

            closeModal.addEventListener("click", () => {
                modal.setAttribute("closing", "");

                modal.addEventListener(
                        "animationend",
                        () => {
                    modal.removeAttribute("closing");
                    modal.close();
                },
                        {once: true}
                );
                modal.classList.add("hidden");
                overlay.classList.add("hidden");
            });

        </script>

        <script src="js/script.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
    </body>
    <c:import url="footer.html"/>
</html>