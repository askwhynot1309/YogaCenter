<%-- 
    Document   : staffManageTrainee
    Created on : Jun 7, 2023, 3:13:02 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/staff/staff-user.css"/>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-2">
                    <c:import url="trainerDashboard.jsp"></c:import>
                    </div>
                    <div class="col-lg-10">
                        <h2 style="display: flex; justify-content: center; font-family: monospace;font-weight: 700; margin-top: 20px; text-transform: uppercase">
                            Manage Trainee
                        </h2>
                        <div style="display: flex; margin-left: 30%; margin-bottom: 2rem; margin-top: 2rem">
                            <form action="/YogaCenter/request" method="POST" class="form-search">
                                <div class="group">
                                    <svg class="icon-search" aria-hidden="true" viewBox="0 0 24 24"><g><path d="M21.53 20.47l-3.66-3.66C19.195 15.24 20 13.214 20 11c0-4.97-4.03-9-9-9s-9 4.03-9 9 4.03 9 9 9c2.215 0 4.24-.804 5.808-2.13l3.66 3.66c.147.146.34.22.53.22s.385-.073.53-.22c.295-.293.295-.767.002-1.06zM3.5 11c0-4.135 3.365-7.5 7.5-7.5s7.5 3.365 7.5 7.5-3.365 7.5-7.5 7.5-7.5-3.365-7.5-7.5z"></path></g></svg>
                                    <input placeholder="Search by Name User" type="text" name="txtsearch" value="${param.txtsearch}" class="input">
                                <select name="choice" style="margin-left: 20px; margin-right: 20px">
                                    <option value="0"></option>
                                    <option value="1">Name</option>
                                    <option value="2">Email</option>
                                    <option value="2">Phone</option>
                                </select>
                                <input name="option" value="TrainerSearchTrainee" hidden="">
                                <button name="action" value="search" class="btn-search">Search</button>
                            </div>
                        </form>
                    </div>
                    <c:set var="listUser" value="${requestScope.listUser}"/>
                    <c:set var="nulllist" value="${requestScope.nulllist}"/>
                    <c:if test="${listUser == null}">
                        <p style="text-align: center"><c:out value="${nulllist}"/></p>
                    </c:if>
                    <c:if test="${listUser != null && !listUser.isEmpty()}">
                        <div class="table-responsive" style="height: 550px">
                            <table class="table table-striped table-bordered" style="text-align: center">
                                <thead class="thead-dark">
                                    <tr>
                                        <th>No.</th>
                                        <th>Email</th>
                                        <th>Name</th>
                                        <th>Phone</th>
                                        <th>Address</th>
                                        <th>Details</th>
                                    </tr>
                                </thead>
                                <tbody class="font">
                                    <c:forEach var="user" items="${listUser}" varStatus="loop">
                                        <tr>
                                            <td>${loop.count}</td>
                                            <td>${user.email}</td>
                                            <td>${user.name}</td>
                                            <td>${user.phone}</td>
                                            <td>${user.address}</td>
                                            <td style="width: 75px;height: 75px">
                                                <a href="/YogaCenter/request?action=inf&id=${user.idaccount}&option=trainerUserDetail" class="btn btn-primary">Details</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="pagination">
                            <ul>
                                <li><a href="#" class="prev">Before</a></li>
                                <li><a href="#" class="page active">1</a></li>
                                <li><a href="#" class="next">After</a></li>
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

</body>
</html>
