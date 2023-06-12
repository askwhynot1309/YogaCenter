<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/login.css">
        <link rel="stylesheet" href ="css/login-success.css">
        <link rel="stylesheet" href="fontawesome-free-5.15.3-web/css/all.min.css">
        <title>Login</title>
    </head>
    <c:import url="header.jsp"/> 
    <body>
        <div class="login">
            <div class="login-form">
                <h1 class="signin-heading">Sign In</h1>
                <div class="inner-form" style="width: 100%">
                    <form action="/YogaCenter/request" method="POST" class="display: flex; justify-content: center; align-items: center">
                        <div class="form-control">
                            <input type="text" name="account" required="">
                            <label>
                                <span style="transition-delay:0ms">A</span><span style="transition-delay:50ms">c</span><span style="transition-delay:100ms">c</span><span style="transition-delay:150ms">o</span><span style="transition-delay:200ms">u</span><span style="transition-delay:250ms">n</span><span style="transition-delay:300ms">t</span>
                            </label>
                        </div>
                        <div class="form-control">
                            <input type="password" name="password" required="">
                            <label>
                                <span style="transition-delay:0ms">P</span><span style="transition-delay:50ms">a</span><span style="transition-delay:100ms">s</span><span style="transition-delay:150ms">s</span><span style="transition-delay:200ms">w</span><span style="transition-delay:250ms">o</span><span style="transition-delay:300ms">r</span><span style="transition-delay:350ms">d</span>
                            </label>
                        </div>
                        <button name="action" value="Login">
                            Sign in
                            <div class="arrow-wrapper">
                                <div class="arrow"></div>
                            </div>
                        </button>
                    </form>
                </div>
                <c:set var="Loginfail" value="${requestScope.Loginfail}"/>
                <c:set var="successMessage" value="${requestScope.successMessage}"/>
                <c:if test="${Loginfail != null}">
                    <div style="text-align: center; margin-top: 50px; font-size: 14px"><p style="color: red"><c:out value="${Loginfail}"/></p></div>
                    </c:if>
                    <c:set var="LoginLimited" value="${requestScope.LoginLimited}"/>
                    <c:if test="${LoginLimited != null}">
                    <div style="text-align: center; margin-top: 50px; font-size: 14px"><p style="color: red"><c:out value="${LoginLimited}"/></p></div>
                    </c:if>
                <div style="font-size: 14px; display: flex; justify-content: center; align-items: center; margin-top: 10px">
                    <a href="forgetPassword.jsp">Forget password ?</a>
                </div>

                <div class="signin-or"><span>or</span></div>

                <div class="google-btn">
                    <div class="google-icon-wrapper">
                        <img class="google-icon" src="https://upload.wikimedia.org/wikipedia/commons/5/53/Google_%22G%22_Logo.svg"/>
                    </div>
                    <div class="btn-text"><b><a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/YogaCenter/LoginGoogle&response_type=code
                                                &client_id=770844928975-77pd0lq2vg2adjg6s2hb0r6kn5fevu58.apps.googleusercontent.com&approval_prompt=force">Sign in with google</a></b></div>
                </div>
                <div style="font-size: 14px; display: flex; justify-content: center; align-items: center; margin-top: 10px">
                    <p>New to know Yoga Center ? <span><a href="register.jsp">Sign up</a></span></p>
                </div>
            </div>
        </div>
    </body>
    <c:if test="${successMessage != null}">
            <div class="notification-success">
                <div class="content">
                    <div class="title">Success</div>
                    <span>Password reset successful!</span>
                </div>
                <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
            </div>
            <script>
                let notification = document.querySelector('.notification-success');
                notification.timeOut = setTimeout(() => notification.remove(), 5000);
            </script>
        </c:if>
</html>
