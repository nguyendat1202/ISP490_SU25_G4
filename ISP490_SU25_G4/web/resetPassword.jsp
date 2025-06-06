<%-- 
    Document   : resetPassword
    Created on : May 31, 2025, 12:47:31 PM
    Author     : NGUYEN MINH
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Đặt lại mật khẩu</title>
        <link rel="stylesheet" type="text/css" href="css/resetPassword.css" />
    </head>
    <body>

        <div class="left-side"></div>

        <div class="reset-container">
            <div class="logo">
                <img src="image/logo.png" alt="Logo" />
            </div>
            <div class="company-name">DONG PHAT JOINT STOCK COMPANY</div>

            <h2>Đặt lại mật khẩu</h2>

            <form action="ResetPasswordController" method="post">
                <label for="newPassword">Mật khẩu mới</label>
                <input type="password" id="newPassword" name="newPassword" placeholder="Nhập mật khẩu mới" required />

                <label for="confirmPassword">Nhập lại mật khẩu</label>
                <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Nhập lại mật khẩu" required />
                <c:if test="${not empty error}">
                    <p style="color:red">${error}</p>
                </c:if>
                <button type="submit" >Tiếp tục</button>
                
            </form>

            <div class="password-requirements">
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