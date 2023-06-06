<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Admin Dashboard</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="css/admin.css">
    </head>

    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3">
                    <c:import url="adminMenu.jsp"></c:import>
                </div>
                <div class="col-lg-8">
                    <h2 style="display: flex; justify-content: center; margin-bottom: 10px; font-family: monospace;font-weight: 700; margin-top: 20px; text-transform: uppercase">Add new Employee</h2>
                    <h3 style="color: blue; margin-bottom: 10px; font-family: sans-serif;font-weight: 700; margin-top: 20px; text-transform: uppercase; background-color: #6fc5ff; padding: 20px">Add new Employee</h3>
                    <c:set var="addUnsuccess" value="${requestScope.addUnsuccess}"/>
                    <form action="/YogaCenter/request" method="POST">
                        <div style="margin-top: 10%">
                            <div style="display: flex; align-items: center; justify-content: space-between">
                                <p>Name of Employee : <input type="text" name="name" class="input-course" value="${param.name}"></p>
                                <p>Email : &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&emsp;<input type="text" name="email" class="input-course" value="${param.email}"></p>
                            </div>
                            <div style="display: flex; align-items: center; justify-content: space-between">
                                <p>Phone : &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;<input type="text" name="phone" class="input-course" value="${param.phone}"></p>
                                <p>Citizen Identity Card : <input type="number" name="cccd" class="input-course" value="${param.cccd}"></p>
                            </div>
                            <p>Address : <input type="text" name="address" class="input-course" value="${param.address}"></p>
                            <p>Account : <input type="text" name="account" class="input-course"></p>
                            <p>Password : <input type="password" name="password" class="input-course"></p>
                            <p>Role : &ensp;&ensp;&ensp;
                                <select name="role" id="select-box">
                                    <option value="1">Staff</option>
                                    <option value="2">Trainer</option>
                                </select>
                            </p>
                            <button name="action" value="ButtonAdd" class="btn-add">Add new Employee</button>
                        </div>
                    </form>
                </div>
                    <c:if test="${addUnsuccess != null}">
                        <script>
                            alert("Account has been exist. Please fill account again !");
                        </script>
                    </c:if>
                </body>
                <style>
                    html{
                        overflow-y: hidden;
                        height: 100vh;
                    }
                    p{
                        font-weight: 500
                    }
                    #select-box{
                        height: 30px;
                        overflow-y: auto;
                        width: 150px;
                        border-radius: 10px;
                    }
                    #select-box-option{
                        height: 30px;
                        overflow-y: auto;
                        width: 250px;
                        border-radius: 10px;
                    }
                    .input-course {
                        font-family: monospace;
                        width: 300px;
                        outline: none;
                        border: 1px solid #dadada;
                        padding: 5px;
                        border-radius: 5px;
                        background-color: #f3f7fe;
                        transition: .3s;
                        color: #3b82f6;
                    }

                    .input-course:focus {
                        border: 1px solid #3b82f6;
                        box-shadow: 0 0 0 4px #3b83f65f;
                    }
                    .btn-add {
                        margin-left: 40%;
                        --clr-font-main: hsla(0 0% 20% / 100);
                        --btn-bg-1: hsla(194 100% 69% / 1);
                        --btn-bg-2: hsla(217 100% 56% / 1);
                        --btn-bg-color: hsla(360 100% 100% / 1);
                        --radii: 0.5em;
                        cursor: pointer;
                        padding: 0.9em 1.4em;
                        min-width: 120px;
                        min-height: 44px;
                        font-size: var(--size, 1rem);
                        font-family: "Segoe UI", system-ui, sans-serif;
                        font-weight: 500;
                        transition: 0.8s;
                        background-size: 280% auto;
                        background-image: linear-gradient(325deg, var(--btn-bg-2) 0%, var(--btn-bg-1) 55%, var(--btn-bg-2) 90%);
                        border: none;
                        border-radius: var(--radii);
                        color: var(--btn-bg-color);
                        box-shadow: 0px 0px 20px rgba(71, 184, 255, 0.5), 0px 5px 5px -1px rgba(58, 125, 233, 0.25), inset 4px 4px 8px rgba(175, 230, 255, 0.5), inset -4px -4px 8px rgba(19, 95, 216, 0.35);
                    }

                    .btn-add:hover {
                        background-position: right top;
                    }
                    @media (prefers-reduced-motion: reduce) {
                        .btn-add {
                            transition: linear;
                        }
                    }
                </style>
                </html>
