<%@ page import="jakarta.servlet.http.HttpServlet" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@ page import="jakarta.servlet.http.HttpServletResponse" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css">
</head>
<body>
    <jsp:include page="header.jsp" />
    <div class="container">
        <h2>Welcome, ${sessionScope.user.firstName}!</h2>
        <p>Manage your orders and profile from here:</p>
        <ul>
            <li><a href="${pageContext.request.contextPath}/users/profile">View Profile</a></li>
            <li><a href="${pageContext.request.contextPath}/orders">Manage Orders</a></li>
            <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
        </ul>
    </div>
    <jsp:include page="footer.jsp" />
</body>
</html>