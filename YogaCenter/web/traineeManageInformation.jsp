
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="icon" type="image/x-icon" href="img/_54148c2a-3c22-49b9-89f8-4e57d07bc7b1.png">
        <title>Manage Information</title>
        <link rel="stylesheet" href="css/trainee/trainee-inf.css"/>
        <link rel="stylesheet" href="css/style.css"/>
    </head>
    <c:import url="header.jsp"/>
    <body>
        <c:set var="acc" value="${requestScope.acc}"/>
        <c:if test="${acc != null}">
            <div class="inforTable">
                <div class="container">
                    <div class="side-menu">
                        <div style="display: flex;flex-direction: column; justify-items: center; align-content: center">
                            <img src="img/${acc.image}" width="100%" height="300px" alt="avatar"/>
                            <div class="fullnameTrainee">${acc.name}</div>
                        </div>
                        <div class="sidebar">
                            <ul class="unstyle-list">
                                <li>
                                    <a href="/YogaCenter/information">Information</a>
                                </li>
                                <li>
                                    <a href="/YogaCenter/yourcourse">Your course</a>
                                </li>
                                <li>
                                    <a href="/YogaCenter/classbooking">View schedule</a>
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
                                        <fieldset class="" style="padding: 10px">
                                            <legend class="" style="padding: 10px">General</legend>
                                            <p>Amount : ${acc.amount} VNĐ</p>
                                            <input type="text" name="txtAccountID" value="${acc.idaccount}" hidden="">
                                            <div class="" style="padding: 10px">
                                                <label>Name :</label>
                                                <input type="text" name="txtFullname" value="${acc.name}">
                                            </div>
                                            <div class="" style="padding: 10px">
                                                <label>Email :</label>
                                                <input type="email" name="txtEmail" value="${acc.email}" required="">
                                            </div>
                                            <div class="" style="padding: 10px">
                                                <label>Phone :</label>
                                                <input type="tel" name="txtPhone" value="${acc.phone}" required="">
                                            </div>
                                            <div class="" style="padding: 10px">
                                                <label>Address :</label>
                                                <input type="text" name="txtAddress" value="${acc.address}" required=""> 
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
    <c:import url="footer.html"/>
</html>
