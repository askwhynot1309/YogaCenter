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
        <link rel="stylesheet" href="css/style.css"/>
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
        a{
            padding: 0 1vh;
        }
        .close{
            margin-left: auto;
            font-size: 0.7rem;
        }
        img{
            width: 3.5rem;
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
    </style>
    <c:import url="header.jsp"/>
    <body>
        <%
            HashMap<String, Integer> cart = (HashMap) session.getAttribute("cart");
            int totalMoney = 0;
            ArrayList<Course> courseList = CourseDao.getAllCourse();
        %>
        <div id="home" class="back">
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
                                            <img style="width: auto;" class="img-fluid" src="<%=imgPath%>">
                                        </div>
                                        <div class="col">
                                            <div class="row"><%= courseName%></div>    
                                        </div>
                                        <div class="col">
                                            <%= price%> VNÐ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
                            <div class="back-to-shop"><a href="homepage.jsp">&leftarrow;</a><span class="text-muted">Back to shop</span></div>
                        </div>
                        <div class="col-md-4 summary">
                            <div><h5><b>Summary</b></h5></div>
                            <hr>
                            <div class="row">
                                <div class="col" style="padding-left:1px;"> ITEMS <span id="checkoutQuantity"></span></div>
                                <div class="col text-right"><span id="checkoutPrice"><%= totalMoney%>.000</span> VNĐ</div>
                            </div>
                            <form action="/YogaCenter/request" method="POST">
                                <p>PAYMENT METHOD</p>
                                <select name="method">
                                    <option class="text-muted" value="0">CASH</option>
                                    <option class="text-muted" value="1">BANK TRANSFER</option>
                                </select>

                                <div class="row" style="border-top: 1px solid rgba(0,0,0,.1); padding: 2vh 0;">
                                    <div class="col">TOTAL PRICE</div>
                                    <div class="col text-right"><span id="checkoutPriceMore"><%= totalMoney%>.000</span> VNĐ</div>
                                </div>
                                <button type="submit" value="saveOrder" name="action" class="btn">CHECKOUT</button>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>



        <script src="js/script.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
    </body>
</html>
