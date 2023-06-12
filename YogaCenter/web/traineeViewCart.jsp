<%@page import="Object.Account"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="Dao.CourseDao"%>
<%@page import="Object.Course"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="css/style.css"/>
    </head>
    <c:import url="header.jsp"/>
    <body>
        <div class="container" style="display: flex">
            <div class="col-lg-9">
                <%
                    int totalMoney = 0;
                    ArrayList<Course> courseList = CourseDao.getAllCourse();
                    Account account = (Account) session.getAttribute("account");
                %>
                <table style="width: 100%; border: 1px;">
                    <tr><td>Image</td><td>Price</td><td>Quantity</td></tr>
                    <%
                        HashMap<String, Integer> cart = (HashMap) session.getAttribute("cart");
                        if (cart != null) {
                            Set<String> courseID = cart.keySet();
                            for (String cID : courseID) {
                                double price = 0;
                                String imgPath = "";
                                for (Course course : courseList) {
                                    if (course.getIdCourse() == Integer.parseInt(cID)) {
                                        totalMoney += course.getFee_course().intValue();
                                        imgPath = course.getImg_course();
                                        price = course.getFee_course().doubleValue();
                                    }
                                }
                                int quantity = cart.get(cID);
                    %>
                    <form action="/YogaCenter/request" method="POST">
                        <input type="hidden" value="<%=cID%>" name="courseID">
                        <input type="hidden" name="accountID" value="<%=account.getIdaccount()%>">
                        <tr>

                            <td><img style="width: 100px;" src="<%=imgPath%>" class="plantimg"/></td>
                            <td><input type="hidden" value="<%=price%>" name="price"><%=price%></td>
                            <td><input type="number" value="<%=quantity%>" name="quantity"></td>
                        </tr>
                    </form>
                    <%
                        }
                    } else {
                    %>
                    <tr><td>Your cart is empty</td></tr>
                    <%
                        }
                    %>
                    <tr><td>Total money: <%=totalMoney%></td></tr>
                    <tr><td>Ship Date: N/A </td></tr>
                </table>
            </div>
            <div class="col-lg-3">
                <form action="/YogaCenter/request" method="POST">
                    <select name="method">
                        <option value="0">Cash</option>
                        <option value="1">Online banking</option>
                    </select>

                    <input type="submit" value="saveOrder" name="action">
                </form>
            </div>       
        </div>
    </body>
</html>
