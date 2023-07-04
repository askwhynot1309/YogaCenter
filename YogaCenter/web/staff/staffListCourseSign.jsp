<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html style="overflow-y: scroll">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/x-icon" href="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png">
        <link rel="stylesheet" href="css/admin/admin-employee-add.css">
        <link rel="stylesheet" href="css/staff/staff-user.css"/>
        <link rel="stylesheet" href="css/staff/staff-viewbanking.css"/>
        <title>Buy Course</title>
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
                    <c:import url="staffMenu.jsp"/>
                </div>
                <div class="col-lg-9" style="margin-left: 300px">
                    <div id="overlay" class="overlay hidden"></div>
                    <a href="/YogaCenter/trainee" class="btn">
                        <svg height="16" width="16" xmlns="http://www.w3.org/2000/svg" version="1.1" viewBox="0 0 1024 1024"><path d="M874.690416 495.52477c0 11.2973-9.168824 20.466124-20.466124 20.466124l-604.773963 0 188.083679 188.083679c7.992021 7.992021 7.992021 20.947078 0 28.939099-4.001127 3.990894-9.240455 5.996574-14.46955 5.996574-5.239328 0-10.478655-1.995447-14.479783-5.996574l-223.00912-223.00912c-3.837398-3.837398-5.996574-9.046027-5.996574-14.46955 0-5.433756 2.159176-10.632151 5.996574-14.46955l223.019353-223.029586c7.992021-7.992021 20.957311-7.992021 28.949332 0 7.992021 8.002254 7.992021 20.957311 0 28.949332l-188.073446 188.073446 604.753497 0C865.521592 475.058646 874.690416 484.217237 874.690416 495.52477z"></path></svg>
                        <span>Back</span>
                    </a>
                    <h2 style="display: flex; justify-content: center; margin-bottom: 20px; font-family: monospace;font-weight: 700; margin-top: 20px; text-transform: uppercase">Yoga Center Course List</h2>
                    <div style="display: flex; margin-left: 30%; margin-bottom: 2rem; margin-top: 2rem ">
                        <c:set var="idaccount" value="${requestScope.key}"/>
                        <form action="/YogaCenter/request" method="POST" class="form-search">
                            <div class="group">
                                <svg class="icon-search" aria-hidden="true" viewBox="0 0 24 24"><g><path d="M21.53 20.47l-3.66-3.66C19.195 15.24 20 13.214 20 11c0-4.97-4.03-9-9-9s-9 4.03-9 9 4.03 9 9 9c2.215 0 4.24-.804 5.808-2.13l3.66 3.66c.147.146.34.22.53.22s.385-.073.53-.22c.295-.293.295-.767.002-1.06zM3.5 11c0-4.135 3.365-7.5 7.5-7.5s7.5 3.365 7.5 7.5-3.365 7.5-7.5 7.5-7.5-3.365-7.5-7.5z"></path></g></svg>
                                <input placeholder="Search by Name Course" type="text" name="txtsearch" value="${param.txtsearch}" class="input">
                                <input name="option" value="staffSearchCourseToSign" hidden="">
                                <c:if test="${idaccount != null}">
                                    <input name="key" value="${idaccount}" hidden="">
                                </c:if>
                                <c:set var="listLevel" value="${requestScope.listlevel}"/>
                                <c:if test="${listLevel != null && !listLevel.isEmpty()}">
                                    <select name="level" style="margin-left: 10px">
                                        <option value="0"></option>
                                        <c:forEach var="level" items="${listLevel}">
                                            <option value="${level.getIdLevel()}">${level.getLevel_Name()}</option>
                                        </c:forEach>
                                    </select>
                                </c:if>
                                <c:if test="${listLevel == null}">
                                    <select name="level">
                                        <option value="0"></option>
                                    </select>
                                </c:if>
                                <button name="action" value="search" class="btn-search" style="margin-left: 10px">Search</button>
                            </div>
                        </form>
                    </div>
                    <c:set var="listcourse" value="${requestScope.listcourse}"/>
                    <c:set var="nulllist" value="${requestScope.nonelist}"/>
                    <c:set var="listCourseAccountActive" value="${requestScope.listCourseAccountActive}"/>
                    <c:set var="currentdate" value="${requestScope.currentDate}"></c:set>
                    <c:if test="${listcourse == null}">
                        <p style="text-align: center"><c:out value="${nulllist}"/></p>
                    </c:if>
                    <c:if test="${listcourse != null}">
                        <div class="course">
                            <c:forEach var="course" items="${listcourse}">
                                <div style="border: 2px solid black; float: left; margin-left: 10px; padding: 10px; border-radius: 10px; width: 355px;height: 300px; margin-bottom: 10px; position: relative">
                                    <div>
                                        <form action="/YogaCenter/request" method="POST">
                                            <p style="font-size: 15px">${course.name_course}</p>
                                            <p>Fee of course : ${course.fee_course} VNĐ</p>
                                            <p>Level : ${course.name_level}</p>
                                            <p>Date-start : ${course.date_start}</p>
                                            <input name="id" value="${course.idCourse}" hidden="">
                                            <c:if test="${idaccount != null}">
                                                <input name="key" value="${idaccount}" hidden="">
                                            </c:if>
                                            <c:choose>
                                                <c:when test="${listCourseAccountActive == null && course.status == 0}">
                                                    <a class="btn-search open" style="left: 35%; position: absolute; bottom: 10px">Sign up</a>
                                                    <dialog class="message" id="message">
                                                        <h3 style="text-align: center; color: red">Payment</h3>
                                                        <p>Bank account number : 9775030435</p>
                                                        <p>Bank : Vietcombank</p>
                                                        <p>Name of account bank : Nguyễn Minh Nguyên</p>
                                                        <p>Method : <select name="method">
                                                                <option value="0">Cash</option>
                                                                <option value="1">Banking</option>
                                                            </select></p>
                                                        <div style="display: flex; align-items: center; justify-content: space-between">
                                                            <button class="btn btn-primary" name="action" value="ButtonSignCourse">Comfirm</button>
                                                            <a class="btn btn-primary btn-close">Close</a>
                                                        </div>
                                                    </dialog>
                                                </c:when>
                                                <c:when test="${currentdate.after(course.date_close) || currentdate.equals(course.date_close)}">
                                                    <div style="text-align: center">
                                                        <p style="color: red">The course has been closed.</p>
                                                    </div>
                                                </c:when>
                                                <c:when test="${listCourseAccountActive != null}">
                                                    <c:set var="courseBought" value="false" scope="page" />
                                                    <c:forEach var="coureactive" items="${listCourseAccountActive}">
                                                        <c:if test="${course.idCourse == coureactive.id_course}">
                                                            <c:set var="courseBought" value="true" scope="page" />
                                                        </c:if>
                                                    </c:forEach>
                                                    <c:choose>
                                                        <c:when test="${courseBought}">
                                                            <p style="text-align: center; color: red">You bought the course</p>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a class="btn-search open" style="left: 35%; position: absolute; bottom: 10px">Sign up</a>
                                                            <dialog class="message" id="message">
                                                                <h3 style="text-align: center; color: red">Payment</h3>
                                                                <p>Bank account number : 9775030435</p>
                                                                <p>Bank : Vietcombank</p>
                                                                <p>Name of account bank : Nguyễn Minh Nguyên</p>
                                                                <p>Method : <select name="method">
                                                                        <option value="0">Cash</option>
                                                                        <option value="1">Banking</option>
                                                                    </select></p>
                                                                <div style="display: flex; align-items: center; justify-content: space-between">
                                                                    <button class="btn btn-primary" name="action" value="ButtonSignCourse">Comfirm</button>
                                                                    <a class="btn btn-primary btn-close">Close</a>
                                                                </div>
                                                            </dialog>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:when>
                                            </c:choose>
                                        </form>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </body>
    <script>
        const message = document.querySelector("#message");
        const open = document.querySelector(".open");
        const close = document.querySelector(".btn-close");
        var overlay = document.getElementById("overlay");

        open.addEventListener("click", () => {
            message.showModal();
            overlay.classList.remove("hidden");
        });

        close.addEventListener("click", () => {
            message.setAttribute("closing", "");

            message.addEventListener(
                    "animationend",
                    () => {
                message.removeAttribute("closing");
                message.close();
            },
                    {once: true}
            );
            overlay.classList.add("hidden");
        });

    </script>
</html>
