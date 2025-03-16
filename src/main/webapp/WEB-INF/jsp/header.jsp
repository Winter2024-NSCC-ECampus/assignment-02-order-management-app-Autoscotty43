<%@ page import="jakarta.servlet.http.HttpServlet" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@ page import="jakarta.servlet.http.HttpServletResponse" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<header>
    <h1>Order Management System</h1>
    <nav>
        <a href="${pageContext.request.contextPath}/home.jsp">Home</a>
        <a href="${pageContext.request.contextPath}/profile.jsp">Profile</a>
        <a href="${pageContext.request.contextPath}/order.jsp">Orders</a>
        <a href="${pageContext.request.contextPath}/logout.jsp">Logout</a>
    </nav>
</header>