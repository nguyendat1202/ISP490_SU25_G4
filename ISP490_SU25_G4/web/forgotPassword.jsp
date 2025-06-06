<%-- 
    Document   : forgotPassword.jsp
    Created on : May 31, 2025, 12:32:12 PM
    Author     : NGUYEN MINH
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Quên mật khẩu</title>
        <link rel="stylesheet" type="text/css" href="css/forgotPassword.css" />
    </head>
    <body>

        <div class="left-side"></div>

        <div class="forgot-password-container">
            <div class="logo">
                <img src="image/logo.png" alt="Logo" />
            </div>
            <div class="company-name">DONG PHAT JOINT STOCK COMPANY</div>

            <form action="SendOTPServlet" method="post">
                <div class="form-group">
                    <input type="email" name="email" placeholder="Nhập email của bạn" required />
                </div>
                <button type="submit" class="send-otp-btn">Gửi mã xác nhận OTP</button>
            </form>
            <c:if test="${not empty error}">
                <p style="color:red">${error}</p>
            </c:if>
            <a href="login.jsp" class="back-login">Quay lại đăng nhập</a>

            <div class="footer">
                © 2025 DPCRM from ISP490_SU25_GR4
            </div>
        </div>

    </body>
</html>
