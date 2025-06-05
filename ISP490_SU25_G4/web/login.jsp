<%-- 
    Document   : login
    Created on : May 29, 2025, 10:48:23 AM
    Author     : NGUYEN MINH
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Đăng nhập - CRM Đồng Phát</title>
        <style>
            body {
                font-family: Roboto, sans-serif;
                margin: 0;
                padding: 0;
                background: white;
            }
            .container {
                display: flex;
                height: 100vh;
            }
            .left {
                flex: 1;
                background: url('img/a.jpg') no-repeat center center;
                background-size: fit;
            }
            .right {
                width: 500px;
                padding: 40px;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
            }
            .form-box {
                width: 70%;
                background: rgba(255, 255, 255, 0.9);
                border: 1px solid #CDCDCD;
                border-radius: 8px;
                padding: 20px 40px;
            }
            .form-box h2 {
                text-align: center;
                margin-bottom: 30px;
            }
            .input-group {
                margin-bottom: 20px;
            }
            .input-group input {
                width: 100%;
                padding: 10px 12px;
                font-size: 16px;
                border: 1px solid #CDCDCD;
                border-radius: 4px;
            }
            .btn {
                width: 100%;
                padding: 10px;
                background-color: #15166F;
                color: white;
                border: none;
                font-weight: bold;
                border-radius: 8px;
                cursor: pointer;
            }
            .or-divider {
                text-align: center;
                margin: 20px 0;
                position: relative;
            }
            .or-divider:before,
            .or-divider:after {
                content: '';
                position: absolute;
                top: 50%;
                width: 40%;
                height: 1px;
                background: #CDCDCD;
            }
            .or-divider:before {
                left: 0;
            }
            .or-divider:after {
                right: 0;
            }
            .or-divider span {
                background: white;
                padding: 0 10px;
                color: #737373;
                font-weight: 700;
                font-size: 13px;
                text-transform: uppercase;
            }
            .footer {
                margin-top: 30px;
                font-size: 12px;
                color: #737373;
                text-align: center;
            }
            .register-link {
                margin-top: 20px;
                text-align: center;
            }
            .register-link a {
                color: #15166F;
                font-weight: bold;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="left"></div>
            <div class="right">
                <form class="form-box" action="LoginController" method="post">
                    <img src="img/b_1.jpg" alt="Logo" width="220" style="display:block; margin:0 auto 0px;">
                    <div class="input-group">
                        <input type="email" name="email" placeholder="Email" required>
                    </div>
                    <div class="input-group">
                        <input type="password" name="password" placeholder="Mật khẩu" required>
                    </div>
                    <c:if test="${not empty error}">
                        <p style="color:red">${error}</p>
                    </c:if>
                    <button type="submit" class="btn">Đăng nhập</button>

                    <div class="or-divider"><span>Hoặc</span></div>
                    <div class="register-link">
                        <a href="forgotPassword.jsp">Quên mật khẩu</a>
                    </div>
                    <div class="register-link">
                        Bạn chưa có tài khoản? <a href="register.jsp">Đăng ký</a>
                    </div>
                </form>
                <div class="footer">
                    © 2025 DPCRM from ISP490_SU25_GR4
                </div>
            </div>
        </div>
    </body>
</html>
