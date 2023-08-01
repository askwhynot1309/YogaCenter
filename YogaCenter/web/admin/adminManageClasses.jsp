<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Class Management</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="icon" type="image/x-icon" href="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png">
        <link rel="stylesheet" href="css/admin/admin.css">
        <link rel="stylesheet" href="css/admin/admin-course.css">
        <link rel="stylesheet" href="css/admin/admin-course-add.css">
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
            .feedbackForm {
                position: fixed;
                top: 50%;
                left: 50%;
                border-radius: 20px;
                transform: translate(-50%, -50%);
                background-color: white;
                padding: 20px;
                z-index: 10000;
            }
            #roomForm {
                position: fixed;
                top: 50%;
                left: 50%;
                border-radius: 20px;
                transform: translate(-50%, -50%);
                background-color: white;
                padding: 20px;
                z-index: 10000;
            }
        </style>
    </head>

    <body>
        <c:set var="exist" value="${sessionScope.Admin}"/>
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
                <div class="col-lg-3" style="padding: 0">
                    <c:import url="adminMenu.jsp"></c:import>
                    </div>
                    <div class="col-lg-9">
                        <h2 style="display: flex; justify-content: center; margin-bottom: 20px; font-family: monospace;font-weight: 700; margin-top: 20px; text-transform: uppercase">Manage Class</h2>
                    <c:set var="listClass" value="${requestScope.listClass}"/>
                    <c:if test="${listClass.size() == 0}">
                        <p style="text-align: center">There are no courses available to schedule Trainee</p>
                    </c:if>
                    <c:if test="${listClass.size() > 0 && !listClass.isEmpty()}">
                        <div style="height: 500px">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th style="width: 500px">Name of course</th>
                                        <th>Start of course</th>
                                    </tr>
                                </thead>
                                <tbody>
                                        <c:forEach var="course" items="${listClass}" varStatus="loop">
                                            <tr>
                                                <td>${loop.count}</td>
                                                <td style="width: 500px">${course.course}</td>
                                                <td>${course.date}</td>
                                                <td>
                                                    <a href="/YogaCenter/request?action=inf&id=${course.id_course}&option=viewCourseTosign" class="btn btn-primary">More information</a>
                                                </td>
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
        <c:if test="${wrong != null}">
            <div class="notification">
                <div class="content">
                    <div class="title">Error</div>
                    <span>The course must start before three weeks.</span>
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
        <c:if test="${noimage != null}">
            <div class="notification">
                <div class="content">
                    <div class="title">Error</div>
                    <span>Image of course does not empty !</span>
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
                CKEDITOR.replace('course_summary');
                CKEDITOR.replace('course_object');
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

</html>