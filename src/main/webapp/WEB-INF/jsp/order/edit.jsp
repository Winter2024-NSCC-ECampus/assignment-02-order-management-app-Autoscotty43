<%@ page import="jakarta.servlet.http.HttpServlet" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@ page import="jakarta.servlet.http.HttpServletResponse" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Order Status</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css">
</head>
<body>
    <jsp:include page="header.jsp" />
    <div class="container">
        <h2>Edit Order Status</h2>

        <form action="${pageContext.request.contextPath}/orders/edit/${order.id}" method="post">
            <label for="status">Order Status:</label>
            <select name="status" id="status" required>
                <option value="Pending" ${order.status == 'Pending' ? 'selected' : ''}>Pending</option>
                <option value="Shipped" ${order.status == 'Shipped' ? 'selected' : ''}>Shipped</option>
                <option value="Delivered" ${order.status == 'Delivered' ? 'selected' : ''}>Delivered</option>
                <option value="Cancelled" ${order.status == 'Cancelled' ? 'selected' : ''}>Cancelled</option>
            </select>

            <input type="submit" value="Update Status">
        </form>

        <a href="${pageContext.request.contextPath}/orders">Back to Order List</a>
    </div>
    <jsp:include page="footer.jsp" />
</body>
</html>