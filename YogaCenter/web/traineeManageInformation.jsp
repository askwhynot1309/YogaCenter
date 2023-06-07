<%-- 
    Document   : traineeManageInformation
    Created on : Jun 6, 2023, 7:52:16 AM
    Author     : ngmin
--%>

<%@page import="Object.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
-->
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <title>Manage Information</title>
        <style>
            *{
                box-sizing: border-box;
                margin: 0;
                padding: 0;
            }
            .inforTable{
                padding: 10rem 12%;
            }
            .container{
                display: flex;
                padding: 2.4rem 2.4rem 4.8rem;
            }
            .side-menu{
                border: 1px solid #d1d7dc;
                border-right: 0;
                width: 21.6rem;
            }
            .imageTrainee{
                display: flex;
                justify-content: center;
                padding: 1.6rem;
            }
            .imageContent{
                font-size: 3.2rem!important;
                width: 12rem!important;
                height: 12rem!important;
                background: #1c1d1f;
                display: inline-flex;
                align-items: center;
                justify-content: center;
                border-radius: 50%;
                object-fit: cover;
                color: #fff;
                font-family: var(--font-stack-heading);
                font-weight: 700;
                line-height: 1.2;
                letter-spacing: -.02rem;
                font-size: 2.4rem;
                max-width: 36em;
            }
            .fullnameTrainee{
                text-align: center;
                padding: 0 1.6rem;
                font-family: var(--font-stack-heading);
                font-weight: 700;
                line-height: 1.2;
                letter-spacing: -.02rem;
                font-size: 1.6rem;
            }
            .unstyle-list{
                list-style: none;
                padding: 2.4rem 0;
                margin: 0;
                padding: 0;
                max-width: none;
                display: block;
                list-style-type: disc;
                font-size: x-large;
                font-weight: 400;
                max-width: 60rem;
            }
            .unstyle-list li{
                padding-left: 0;
                display: list-item;
                text-align: -webkit-match-parent;
                list-style: none;
            }

            .unstyle-list a{
                color: #1c1d1f;
                display: block;
                padding: .4rem 1.6rem;
            }

            .menu-item {
                padding: 10px;
                cursor: pointer;
            }

            .li-active {
                background-color: #333;
                color: #fff;
            }
            .main-content{
                border: 1px solid #d1d7dc;
                flex: 1;
                min-width: 1px;
            }
            .main-content-header{
                text-align: center;
                margin: 0 auto;
                max-width: 64.8rem;
                padding: 0 2.4rem;
                border-bottom: 1px solid #d1d7dc;
            }
            .main-content-header h1{
                font-family: var(--font-stack-heading);
                font-weight: 700;
                line-height: 1.2;
                letter-spacing: -.02rem;
                font-size: 2.4rem;
                max-width: 36em;
            }
            .main-content-header p{
                margin-top: .8rem;
                font-family: var(--font-stack-text);
                font-weight: 400;
                line-height: 1.4;
                font-size: 1.6rem;
                max-width: 60rem;
                display: block;
            }
            .content-body{
                min-height: 60rem;
                padding: 2.4rem 0;
            }
            .form-container{
                margin: 0 125px;
                max-width: 64.8rem;
                padding: 0 2.4rem;
            }
            input,select {
                color: #1c1d1f
            }

            input[type=search]::-webkit-search-cancel-button,input[type=search]::-webkit-search-decoration {
                -webkit-appearance: none
            }

            input[disabled],select[disabled],textarea[disabled] {
                cursor: not-allowed
            }
            input{
                height: 4.8rem;
                border: 1px solid #1c1d1f;
                border-radius: 0;
                -webkit-appearance: none;
                display: block;
                padding: 0 1.6rem;
                width: 100%;
                font-family: var(--font-stack-text);
                font-weight: 400;
                line-height: 1.4;
                font-size: 1.6rem;
                background-image: none;
            }
            .form-btn{
                text-align: center;
                margin-top: 3.2rem;
            }
            .form-btn button{
                background-color: #1c1d1f;
                color: #fff;
                height: 4.8rem;
                position: relative;
                align-items: center;
                border: none;
                cursor: pointer;
                display: inline-flex;
                min-width: 8rem;
                padding: 0 1.2rem;
                justify-content: center;
                user-select: none;
                -webkit-user-select: none;
                vertical-align: bottom;
                white-space: nowrap;
                font-family: var(--font-stack-heading);
                font-weight: 700;
                line-height: 1.2;
                letter-spacing: -.02rem;
                font-size: 1.6rem;
                background-image: none;
            }
        </style>
    </head>
    <body>
        <%
            Account account = (Account) session.getAttribute("account");
        %>
        <c:import url="headerTrainee.jsp"></c:import>

            <div class="inforTable">
                <div class="container">
                    <div class="side-menu">
                        <div class="imageTrainee">
                            <div class="imageContent">Trainee</div>
                        </div>
                        <div class="fullnameTrainee"><%= account.getName()%></div>
                    <div class="sidebar">
                        <ul class="unstyle-list">
                            <li>
                                <a href="/YogaCenter/request?action=TraineeManageInformation">Information</a>
                            </li>
                            <li>
                                <a href="#" onclick="selectMenuItem(event, this)">Item 2</a>
                            </li>
                            <li>
                                <a href="#" onclick="selectMenuItem(event, this)">Item 3</a>
                            </li>
                            <li>
                                <a href="#" onclick="selectMenuItem(event, this)">Item 4</a>
                            </li>
                        </ul>
                    </div>

                </div>
                <div class="main-content">
                    <div class="main-content-header">
                        <h1>Public Profile</h1>
                        <p>Information about your self</p>
                    </div>
                    <div class="content-body">
                        <form action="/YogaCenter/request">
                            <div class="form-container">
                                <div>
                                    <fieldset class="">
                                        <legend class="">General</legend>
                                        <input type="text" name="txtAccountID" value="<%= account.getIdaccount()%>" hidden="">
                                        <div class="">
                                            <label></label>
                                            <input type="text" name="txtFullname" value="<%= account.getName()%>">
                                        </div>
                                        <div class="">
                                            <label></label>
                                            <input type="email" name="txtEmail" value="<%= account.getEmail()%>" required="">
                                        </div>
                                        <div class="">
                                            <label></label>
                                            <input type="tel" name="txtPhone" value="<%= account.getPhone()%>" required="">
                                        </div>
                                        <div class="">
                                            <label></label>
                                            <input type="text" name="txtAddress" value="<%= account.getAddress()%>" required=""> 
                                        </div>
                                    </fieldset>
                                </div>
                                <div class="form-btn">
                                    <button type="submit" name="action" value="ChangeInformation">Change</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>       

        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
        <script>
                                    function selectMenuItem(event, item) {
                                        event.preventDefault(); // Prevent the default behavior of the anchor tag
                                        // Remove 'li-active' class from all <li> elements
                                        var listItems = document.querySelectorAll('.sidebar li');
                                        for (var i = 0; i < listItems.length; i++) {
                                            listItems[i].classList.remove('li-active');
                                        }

                                        // Add 'li-active' class to the parent <li> element of the clicked anchor tag
                                        item.parentNode.classList.add('li-active');

                                        // Reload the page
                                        window.location.reload();
                                    }



        </script>
    </body>
</html>
