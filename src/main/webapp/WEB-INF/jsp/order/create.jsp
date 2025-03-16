<%@ page import="jakarta.servlet.http.HttpServlet" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@ page import="jakarta.servlet.http.HttpServletResponse" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create New Order</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css">
</head>
<body>
    <jsp:include page="header.jsp" />
    <div class="container">
        <h2>Create New Order</h2>

        <form action="${pageContext.request.contextPath}/orders/create" method="post">
            <label for="userId">User ID:</label>
            <input type="number" name="userId" id="userId" required>

            <label for="productId">Product:</label>
            <select name="productId" id="productId" required>
                <c:forEach var="product" items="${products}">
                    <option value="${product.id}">${product.name}</option>
                </c:forEach>
            </select>

            <label for="quantity">Quantity:</label>
            <input type="number" name="quantity" id="quantity" required>

            <input type="submit" value="Create Order">
        </form>

        <a href="${pageContext.request.contextPath}/orders">Back to Order List</a>
    </div>
    <jsp:include page="footer.jsp" />
</body>
</html>