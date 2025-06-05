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
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: Arial, sans-serif;
            }
            body {
                display: flex;
                height: 100vh;
                justify-content: space-between;
                align-items: center;
                background-color: #fff;
            }
            .left-side {
                width: 50%;
                height: 100%;
                background: url("image/OTP.png") no-repeat center center;
                background-size: contain;
            }
            .password-container {
                width: 40%;
                height: 70%;
                padding: 40px;
                display: flex;
                flex-direction: column;
                justify-content: center;
                background: white;
                border-radius: 20px;
                box-shadow: none;
            }
            .logo {
                text-align: center;
                margin-bottom: 20px;
            }
            .logo img {
                width: 110px;
            }
            .company-name {
                font-size: 18px;
                color: #E01111;
                font-weight: 700;
                margin-bottom: 30px;
                text-align: center;
            }
            .title {
                font-size: 30px;
                font-weight: 600;
                margin-bottom: 25px;
                color: #333;
                text-align: center;
            }
            label {
                font-size: 16px;
                font-weight: 500;
                margin-bottom: 6px;
                color: #333;
                display: block;
            }
            input[type="password"] {
                width: 100%;
                padding: 12px 16px;
                font-size: 18px;
                border: 1px solid #ccc;
                border-radius: 6px;
                margin-bottom: 20px;
                font-family: Arial, sans-serif;
                box-sizing: border-box;
            }
            button {
                width: 100%;
                background-color: #15166F;
                color: white;
                font-weight: 700;
                font-size: 18px;
                padding: 14px;
                border: none;
                border-radius: 6px;
                cursor: pointer;
            }
            button:hover {
                background-color: #0e126d;
            }
            .warning {
                display: flex;
                align-items: flex-start;
                gap: 10px;
                color: #C49C00;
                font-size: 14px;
                font-weight: 500;
                margin-top: 10px;
                padding-left: 6px;
            }
            .warning-icon {
                width: 24px;
                height: 24px;
                background: #FFF419;
                border-radius: 4px;
                position: relative;
                flex-shrink: 0;
            }
            .warning-icon::before {
                content: "!";
                color: #C49C00;
                font-weight: 900;
                font-size: 18px;
                position: absolute;
                top: 1px;
                left: 7px;
            }
            .footer {
                margin-top: 40px;
                font-size: 12px;
                color: #999;
                text-align: center;
            }
        </style>
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
