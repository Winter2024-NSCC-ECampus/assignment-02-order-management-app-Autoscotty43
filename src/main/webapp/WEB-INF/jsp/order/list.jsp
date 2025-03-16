<%@ page import="jakarta.servlet.http.HttpServlet" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@ page import="jakarta.servlet.http.HttpServletResponse" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Order List</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css">
</head>
<body>
    <jsp:include page="header.jsp" />
    <div class="container">
        <h2>All Orders</h2>

        <table>
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>User</th>
                    <th>Product</th>
                    <th>Quantity</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="order" items="${orders}">
                    <tr>
                        <td>${order.id}</td>
                        <td>${order.user.name}</td>
                        <td>${order.product.name}</td>
                        <td>${order.quantity}</td>
                        <td>${order.status}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/orders/edit/${order.id}">Edit</a>
                            <a href="${pageContext.request.contextPath}/orders/cancel/${order.id}" onclick="return confirm('Are you sure?');">Cancel</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <a href="${pageContext.request.contextPath}/orders/create">Create New Order</a>
    </div>
    <jsp:include page="footer.jsp" />
</body>
</html>