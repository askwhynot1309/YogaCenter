<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Employee Management</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="icon" type="image/x-icon" href="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png">
        <link rel="stylesheet" href="css/admin/admin.css">
        <link rel="stylesheet" href="css/admin/admin-employee.css">
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
                <div class="col-lg-2" style="padding: 0">
                    <c:import url="adminMenu.jsp"/>
                </div>
                <div class="col-lg-10">
                    <h2 style="display: flex; justify-content: center; font-family: monospace;font-weight: 700; margin-top: 20px; text-transform: uppercase">
                        Manage Employee
                    </h2>
                    <div style="height: 150px">
                        <div style="display: flex; margin-left: 30%; margin-bottom: 2rem; margin-top: 2rem">
                            <form action="/YogaCenter/request" method="POST" class="form-search">
                                <div class="group">
                                    <svg class="icon-search" aria-hidden="true" viewBox="0 0 24 24"><g><path d="M21.53 20.47l-3.66-3.66C19.195 15.24 20 13.214 20 11c0-4.97-4.03-9-9-9s-9 4.03-9 9 4.03 9 9 9c2.215 0 4.24-.804 5.808-2.13l3.66 3.66c.147.146.34.22.53.22s.385-.073.53-.22c.295-.293.295-.767.002-1.06zM3.5 11c0-4.135 3.365-7.5 7.5-7.5s7.5 3.365 7.5 7.5-3.365 7.5-7.5 7.5-7.5-3.365-7.5-7.5z"></path></g></svg>
                                    <input placeholder="Search by Name Employee" type="text" name="txtsearch" value="${param.txtsearch}" class="input">
                                    <select name="choice" style="margin-left: 20px; margin-right: 20px">
                                        <option value="0"></option>
                                        <option value="1">Staff</option>
                                        <option value="2">Trainer</option>
                                    </select>
                                    <input name="option" value="searchEmployee" hidden="">
                                    <button name="action" value="search" class="btn-search">Search</button>
                                </div>
                            </form>
                        </div>
                        <button class="btn-add" style="float: right">
                            <span>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path fill="none" d="M0 0h24v24H0z"></path><path fill="currentColor" d="M11 11V5h2v6h6v2h-6v6h-2v-6H5v-2z"></path></svg><a href="/YogaCenter/AddNewEmployeeServlet">Create New Employee</a>
                            </span>
                        </button>
                    </div>
                    <c:set var="listEmployee" value="${requestScope.listEmployee}"/>
                    <c:set var="nulllist" value="${requestScope.nulllist}"/>
                    <c:if test="${listEmployee == null}">
                        <p style="text-align: center"><c:out value="${nulllist}"/></p>
                    </c:if>
                    <c:if test="${listEmployee != null && listEmployee.size() > 0}">
                        <div class="table-responsive" style="height: 480px; text-align: center">
                            <table class="table table-striped table-bordered">
                                <thead class="thead-dark">
                                    <tr>
                                        <th>No.</th>
                                        <th>Account</th>
                                        <th>Name</th>
                                        <th>Role</th>
                                        <th>Status</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody class="font">
                                    <c:forEach var="employee" items="${listEmployee}" varStatus="loop">
                                        <tr>
                                            <td>${loop.count}</td>
                                            <td>${employee.account}</td>
                                            <td>${employee.name}</td>
                                            <td>
                                                <c:if test="${employee.role == 0}">
                                                    Owner
                                                </c:if>
                                                <c:if test="${employee.role == 1}">
                                                    Staff
                                                </c:if>
                                                <c:if test="${employee.role == 2}">
                                                    Trainer
                                                </c:if>
                                            </td>
                                            <td>
                                                <c:if test="${employee.status == 0 && employee.role == 0}">
                                                    <form>
                                                        <span>Active</span>&ensp; <input type="radio" name="status" value="0" checked="">
                                                        <span>Unactive</span>&ensp; <input type="radio" name="status" value="1" disabled="">
                                                    </form>
                                                </c:if>
                                                <c:if test="${employee.status == 0 && (employee.role == 1 || employee.role == 2)}">
                                                    <form action="/YogaCenter/request" method="POST">
                                                        <span>Active</span>&ensp; <input type="radio" name="status" value="0" checked="">
                                                        <span>Unactive</span>&ensp; <input type="radio" name="status" value="1">
                                                        <input name="id" value="${employee.idaccount}" hidden="">
                                                        <input name="option" value="employeeChange" hidden="">
                                                        <button value="comfirm" name="action" class="btn-search">Change</button>
                                                    </form>
                                                </c:if>
                                                <c:if test="${employee.status == 1}">
                                                    <form action="/YogaCenter/request" method="POST">
                                                        <span>Active</span>&ensp; <input type="radio" name="status" value="0">
                                                        <span>Unactive</span>&ensp; <input type="radio" name="status" value="1" checked="">
                                                        <input name="id" value="${employee.idaccount}" hidden="">
                                                        <input name="option" value="employeeChange" hidden="">
                                                        <button value="comfirm" name="action" class="btn-search">Change</button>
                                                    </form>
                                                </c:if>
                                            </td>
                                            <td>
                                                <a href="/YogaCenter/request?action=inf&id=${employee.idaccount}&option=infEmployee" class="btn btn-primary">More information</a>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
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