<%-- 
    Document   : password
    Created on : May 29, 2025, 10:48:23 AM
    Author     : NGUYEN MINH
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Tạo mật khẩu</title>
        <link rel="stylesheet" type="text/css" href="css/password.css" />
    </head>
    <body>
        <div class="left-side"></div>

        <div class="password-container">
            <div class="logo">
                <img src="image/logo.png" alt="Logo" />
            </div>
            <div class="company-name">DONG PHAT JOINT STOCK COMPANY</div>
            <div class="title">Tạo mật khẩu</div>
            <form action="CreatePasswordController" method="post">
                <label for="password">Nhập mật khẩu</label>
                <input id="password" type="password" name="password" placeholder="Nhập mật khẩu" required />
                <label for="confirmPassword">Nhập lại mật khẩu</label>
                <input id="confirmPassword" type="password" name="confirmPassword" placeholder="Nhập lại mật khẩu" required />
                <c:if test="${not empty error}">
                    <p style="color:red">${error}</p>
                </c:if>
                <button type="submit">Tiếp tục</button>
            </form>
            <div class="warning">
                <div class="warning-icon"></div>
                <div>
                    - Tối thiểu 8 ký tự<br/>
                    - Có chữ hoa, chữ thường và số
                </div>
            </div>
            <div class="footer">© 2025 DPCRM from ISP490_SU25_GR4</div>
        </div>
    </body>
</html>
