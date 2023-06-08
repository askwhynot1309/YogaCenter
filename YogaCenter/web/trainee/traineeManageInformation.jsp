
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <title>Manage Information</title>
        <link rel="stylesheet" href="css/trainee/trainee-inf.css"/>
        <link rel="stylesheet" href="css/style.css"/>
    </head>
    <c:import url="headerTrainee.jsp"/>
    <body>
        <c:set var="acc" value="${sessionScope.account}"/>
        <c:if test="${acc != null}">
            <div class="inforTable">
                <div class="container">
                    <div class="side-menu">
                        <div class="imageTrainee">
                            <div class="imageContent">Trainee</div>
                        </div>
                        <div class="fullnameTrainee">${acc.name}</div>
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
                            <form action="/YogaCenter/request" method="POST">
                                <div class="form-container">
                                    <div>
                                        <fieldset class="">
                                            <div class="">
                                                <label>Name :</label>
                                                <input type="text" name="txtFullname" value="${acc.name}">
                                            </div>
                                            <div class="">
                                                <label>Email :</label>
                                                <input type="email" name="txtEmail" value="${acc.email}" readonly="">
                                            </div>
                                            <div class="">
                                                <label>Phone :</label>
                                                <input type="tel" name="txtPhone" value="${acc.phone}" required="">
                                            </div>
                                            <div class="">
                                                <label>Address :</label>
                                                <input type="text" name="txtAddress" value="${acc.address}" required=""> 
                                            </div>
                                        </fieldset>
                                    </div>
                                    <div class="form-btn">
                                        <input name="txtAccountID" value="${acc.idaccount}" hidden="">
                                        <button type="submit" name="action" value="ChangeInformation">Change</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>       
        </c:if>
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
