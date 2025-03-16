<%@ page import="jakarta.servlet.http.HttpServlet" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@ page import="jakarta.servlet.http.HttpServletResponse" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css">
</head>
<body>
    <jsp:include page="header.jsp" />
    <div class="container">
        <h2>Create an Account</h2>

        <form action="${pageContext.request.contextPath}/users/register" method="post">
            <label for="firstName">First Name:</label>
            <input type="text" name="firstName" id="firstName" required>

            <label for="lastName">Last Name:</label>
            <input type="text" name="lastName" id="lastName" required>

            <label for="email">Email:</label>
            <input type="email" name="email" id="email" required>

            <label for="password">Password:</label>
            <input type="password" name="password" id="password" required>

            <input type="submit" value="Register">
        </form>

        <p>Already have an account? <a href="${pageContext.request.contextPath}/login.jsp">Login here</a></p>
    </div>
    <jsp:include page="footer.jsp" />
</body>
</html>