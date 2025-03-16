<%@ page import="jakarta.servlet.http.HttpServlet" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@ page import="jakarta.servlet.http.HttpServletResponse" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Your Orders</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css">
</head>
<body>
    <jsp:include page="header.jsp" />
    <div class="container">
        <h2>Your Orders</h2>

        <table>
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Product</th>
                    <th>Quantity</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="order" items="${userOrders}">
                    <tr>
                        <td>${order.id}</td>
                        <td>${order.product.name}</td>
                        <td>${order.quantity}</td>
                        <td>${order.status}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/orders/view/${order.id}">View</a>
                            <a href="${pageContext.request.contextPath}/orders/cancel/${order.id}" onclick="return confirm('Are you sure you want to cancel this order?');">Cancel</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <a href="${pageContext.request.contextPath}/products">Browse Products</a>
    </div>
    <jsp:include page="footer.jsp" />
</body>
</html>