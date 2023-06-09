<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Admin Dashboard</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="css/admin/admin.css">
        <link rel="stylesheet" href="css/admin/admin-course.css">
        <link rel="stylesheet" href="css/admin/admin-course-add.css">
    </head>

    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3" style="padding: 0">
                    <c:import url="adminMenu.jsp"></c:import>
                    </div>
                    <div class="col-lg-9">
                        <h2 style="display: flex; justify-content: center; margin-bottom: 20px; font-family: monospace;font-weight: 700; margin-top: 20px; text-transform: uppercase">Yoga Center Course List</h2>
                        <div style="display: flex; margin-left: 30%; margin-bottom: 2rem; margin-top: 2rem">
                            <form action="/YogaCenter/request" method="POST" class="form-search">
                                <div class="group">
                                    <svg class="icon-search" aria-hidden="true" viewBox="0 0 24 24"><g><path d="M21.53 20.47l-3.66-3.66C19.195 15.24 20 13.214 20 11c0-4.97-4.03-9-9-9s-9 4.03-9 9 4.03 9 9 9c2.215 0 4.24-.804 5.808-2.13l3.66 3.66c.147.146.34.22.53.22s.385-.073.53-.22c.295-.293.295-.767.002-1.06zM3.5 11c0-4.135 3.365-7.5 7.5-7.5s7.5 3.365 7.5 7.5-3.365 7.5-7.5 7.5-7.5-3.365-7.5-7.5z"></path></g></svg>
                                    <input placeholder="Search by Name Course" type="text" name="txtsearch" value="${param.txtsearch}" class="input">
                                <input name="option" value="searchCourse" hidden="">
                                <c:set var="listLevel" value="${requestScope.listLevel}"/>
                                <c:if test="${listLevel != null && !listLevel.isEmpty()}">
                                    <select name="level">
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
                                <button name="action" value="search" class="btn-search">Search</button>
                            </div>
                        </form>
                    </div>
                    <button class="button" id="addCourseButton">
                        <span class="button__text">Add New Course</span>
                        <span class="button__icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" viewBox="0 0 24 24" stroke-width="2" stroke-linejoin="round" stroke-linecap="round" stroke="currentColor" height="24" fill="none" class="svg"><line y2="19" y1="5" x2="12" x1="12"></line><line y2="12" y1="12" x2="19" x1="5"></line></svg></span>
                    </button>
                    <c:set var="listCourse" value="${requestScope.listCourse}"/>
                    <c:set var="nulllist" value="${requestScope.nulllist}"/>
                    <c:set var="blank" value="${requestScope.blank}"/>
                    <c:set var="expired" value="${requestScope.expired}"/>
                    <c:set var="success" value="${requestScope.success}"/>
                    <c:set var="errorDate" value="${requestScope.errorDate}"/>
                    <c:set var="theSameName" value="${requestScope.theSameName}"/>
                    <c:if test="${listCourse == null}">
                        <p style="text-align: center"><c:out value="${nulllist}"/></p>
                    </c:if>
                    <div id="overlay" class="overlay hidden"></div>

                    <div id="courseForm" class="hidden">
                        <div id="closeButton" style="display: flex; float: right; cursor: pointer; width: 30px;height: 30px">&#10006;</div>
                        <div style="display: block; width: 700px">
                            <h3 style="text-align: center;margin-top: 30px">New course</h3>
                            <form action="/YogaCenter/request" method="POST" enctype="multipart/form-data">
                                <div style="display: flex; align-items: center; justify-content: space-between">
                                    <p>Name of course : <input type="text" name="course_name" value="${param.course_name}" required="" class="input-course"></p>
                                    <p>Fee of course : <input type="number" name="course_fee" value="${param.course_fee}" required="" class="input-course"></p>
                                </div>
                                <div style="display: flex; align-items: center; justify-content: space-between">
                                    <p>Start-date of course : <input type="date" name="course_start" value="${param.course_start}" required="" class="input-course"></p>
                                    <p>Slots : <input type="number" name="slot" value="${param.slot}" required="" class="input-course"></p>
                                </div>
                                <p>Image : <input type="file" name="course_img"></p>
                                <p>Detail of course :</p><textarea name="course_description" value="${param.course_description}" class="input-description"></textarea>
                                <c:if test="${listLevel != null && !listLevel.isEmpty()}">
                                    <p style="margin-top: 10px">Level : <select name="level" class="input-course">
                                            <option value="0"></option>
                                            <c:forEach var="level" items="${listLevel}">
                                                <option value="${level.getIdLevel()}">${level.getLevel_Name()}</option>
                                            </c:forEach>
                                        </select></p>
                                    </c:if>
                                    <c:if test="${listLevel == null}">
                                    <p>Level : <select name="level">
                                            <option value="0"></option>
                                        </select></p>
                                    </c:if>
                                <input name="course_status" value="0" hidden="">
                                <button name="action" value="Add" class="btn-add">Thêm</button>
                            </form>
                        </div>
                        <br>
                    </div>
                    <c:if test="${listCourse != null && !listCourse.isEmpty()}">
                        <div style="height: 450px">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>Name of course</th>
                                        <th>Fee of course</th>
                                        <th>Status of course</th>
                                        <th>Detail of course</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="course" items="${listCourse}" varStatus="loop">
                                        <tr>
                                            <td>${loop.count}</td>
                                            <td>${course.name_course}</td>
                                            <td>${course.fee_course} VNĐ</td>
                                            <td>
                                                <c:if test="${course.status == 0}">
                                                    <form action="/YogaCenter/request" method="POST">
                                                        <span>Active</span>&ensp; <input type="radio" name="status" value="0" checked="">
                                                        <span>Unactive</span>&ensp; <input type="radio" name="status" value="1">
                                                        <input name="id" value="${course.idCourse}" hidden="">
                                                        <input name="date" value="${course.date_start}" hidden="">
                                                        <input name="option" value="courseChange" hidden="">
                                                        <button value="comfirm" name="action" class="btn-search">Change</button>
                                                    </form>
                                                </c:if>
                                                <c:if test="${course.status == 1}">
                                                    <form action="/YogaCenter/request" method="POST">
                                                        <span>Active</span>&ensp; <input type="radio" name="status" value="0">
                                                        <span>Unactive</span>&ensp; <input type="radio" name="status" value="1" checked="">
                                                        <input name="id" value="${course.idCourse}" hidden="">
                                                        <input name="date" value="${course.date_start}" hidden="">
                                                        <input name="option" value="courseChange" hidden="">
                                                        <button value="comfirm" name="action" class="btn-search">Change</button>
                                                    </form>
                                                </c:if>
                                            </td>
                                            <td><a href="/YogaCenter/request?action=inf&id=${course.idCourse}&option=infCourse" class="btn btn-primary">More information</a></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="pagination">
                            <ul>
                                <li><a href="#" class="prev">Trước</a></li>
                                <li><a href="#" class="page active">1</a></li>
                                <li><a href="#" class="next">Sau</a></li>
                            </ul>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>

        <c:if test="${blank != null}">
            <div class="notification">
                <div class="content">
                    <div class="title">Error</div>
                    <span>Please select a level for the course.</span>
                </div>
                <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
            </div>
            <script>
                let notification = document.querySelector('.notification');
                notification.timeOut = setTimeout(() => notification.remove(), 5000);
            </script>
        </c:if> 
            <c:if test="${theSameName != null}">
            <div class="notification">
                <div class="content">
                    <div class="title">Error</div>
                    <span>Name of course has been existed !</span>
                </div>
                <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
            </div>
            <script>
                let notification = document.querySelector('.notification');
                notification.timeOut = setTimeout(() => notification.remove(), 5000);
            </script>
        </c:if> 
        <c:if test="${errorDate != null}">
            <div class="notification-date">
                <div class="content">
                    <div class="title">Error</div>
                    <span>Datestart of course was expired. Please edit date-start of course before set active.</span>
                </div>
                <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
            </div>
            <script>
                let notification = document.querySelector('.notification-date');
                notification.timeOut = setTimeout(() => notification.remove(), 5000);
            </script>
        </c:if> 

        <c:if test="${expired != null}">
            <div class="notification">
                <div class="content">
                    <div class="title">Error</div>
                    <span>The start date is over.</span>
                </div>
                <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
            </div>
            <script>
                let notification = document.querySelector('.notification');
                notification.timeOut = setTimeout(() => notification.remove(), 5000);
            </script>
        </c:if>

        <c:if test="${success != null}">
            <div class="notification-success">
                <div class="content">
                    <div class="title">Success</div>
                    <span>Create a new successful course.</span>
                </div>
                <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
            </div>
            <script>
                let notification = document.querySelector('.notification-success');
                notification.timeOut = setTimeout(() => notification.remove(), 5000);
            </script>
        </c:if>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
        <script type="text/javascript" <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
        <script src="https://cdn.ckeditor.com/4.21.0/standard/ckeditor.js"></script>
        <script>
                CKEDITOR.replace('course_description');
        </script>
    </body>
    <script>
        const productTable = document.querySelector('.table');
        const pagination = document.querySelector('.pagination ul');
        const page = document.querySelector('.pagination ul li:nth-child(2)');

        const productsPerPage = 6;
        let currentPage = 1;

        function displayProducts() {
            const startIndex = (currentPage - 1) * productsPerPage;
            const endIndex = startIndex + productsPerPage;
            const products = Array.from(productTable.tBodies[0].rows);

            products.forEach((product, index) => {
                if (index >= startIndex && index < endIndex) {
                    product.style.display = 'table-row';
                } else {
                    product.style.display = 'none';
                }
            });
        }

        function createPagination() {
            const products = Array.from(productTable.tBodies[0].rows);
            const pageCount = Math.ceil(products.length / productsPerPage);

            for (let i = 2; i <= pageCount; i++) {
                const li = document.createElement('li');
                const link = document.createElement('a');
                link.href = '#';
                link.textContent = i;
                link.classList.add('page');
                if (i === currentPage) {
                    link.classList.add('active');
                }
                li.appendChild(link);
                pagination.insertBefore(li, pagination.lastElementChild);
            }
        }

        createPagination();
        displayProducts();

        pagination.addEventListener('click', e => {
            e.preventDefault();
            if (e.target.classList.contains('page')) {
                currentPage = parseInt(e.target.textContent);
                displayProducts();
                const currentLink = pagination.querySelector('.active');
                currentLink.classList.remove('active');
                e.target.classList.add('active');
            } else if (e.target.classList.contains('prev')) {
                if (currentPage > 1) {
                    currentPage--;
                    displayProducts();
                    const currentLink = pagination.querySelector('.active');
                    currentLink.classList.remove('active');
                    const prevLink = currentLink.parentNode.previousElementSibling.querySelector('a');
                    prevLink.classList.add('active');
                }
            } else if (e.target.classList.contains('next')) {
                const products = Array.from(productTable.tBodies[0].rows);
                const pageCount = Math.ceil(products.length / productsPerPage);
                if (currentPage < pageCount) {
                    currentPage++;
                    displayProducts();
                    const currentLink = pagination.querySelector('.active');
                    currentLink.classList.remove('active');
                    const nextLink = currentLink.parentNode.nextElementSibling.querySelector('a');
                    nextLink.classList.add('active');
                }
            }
        });
    </script>

    <script>
        var addCourseButton = document.getElementById("addCourseButton");
        var courseForm = document.getElementById("courseForm");
        var closeButton = document.getElementById("closeButton");
        var overlay = document.getElementById("overlay");

        addCourseButton.addEventListener("click", function () {
            courseForm.classList.remove("hidden");
            overlay.classList.remove("hidden");
        });

        closeButton.addEventListener("click", function () {
            courseForm.classList.add("hidden");
            overlay.classList.add("hidden");
        });

        overlay.addEventListener("click", function () {
            courseForm.classList.add("hidden");
            overlay.classList.add("hidden");
        });
    </script>

</html>