<%-- 
    Document   : register
    Created on : May 29, 2025, 10:48:23 AM
    Author     : NGUYEN MINH
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Đăng ký tài khoản DPCMR</title>
        <style>
            body {
                margin: 0;
                font-family: Roboto, sans-serif;
                background: white;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
            }
            .main-container {
                display: flex;
                justify-content: center;
                align-items: center;
                width: 100%;
                max-width: 1200px;
                gap: 60px;
                padding: 40px 20px;
            }
            .illustration {
                flex: 1;
                text-align: center;
            }
            .illustration img {
                max-width: 100%;
                height: auto;
            }
            .form-container {
                width: 400px;
            }
            .form-box {
                background: #FFC931;
                border-radius: 20px;
                padding: 40px;
                box-shadow: 0 12px 24px rgba(0, 0, 0, 0.07);
            }
            .form-box h2 {
                font-size: 24px;
                text-align: center;
                margin-bottom: 30px;
                color: #151515;
            }
            label {
                display: block;
                margin-bottom: 6px;
                font-size: 16px;
            }
            input[type="email"] {
                width: 100%;
                height: 42px;
                border: 1px solid #0154C8;
                border-radius: 8px;
                padding: 0 12px;
                font-size: 16px;
                margin-bottom: 15px;
            }
            .checkbox {
                font-size: 13px;
                color: #828B95;
                margin-bottom: 20px;
            }
            .checkbox input {
                margin-right: 8px;
            }
            .btn {
                width: 100%;
                height: 48px;
                background-color: #15166F;
                color: white;
                font-weight: 600;
                font-size: 16px;
                border: none;
                border-radius: 8px;
                cursor: pointer;
            }
            .footer {
                text-align: center;
                font-size: 12px;
                color: #737373;
                margin-top: 15px;
            }
            .footer a {
                color: #151515;
                text-decoration: underline;
            }
            .login-link {
                margin-top: 20px;
                background: #FFC931;
                padding: 12px 0;
                text-align: center;
                border-radius: 12px;
                font-size: 14px;
            }
            .login-link a {
                color: #151515;
                font-weight: bold;
                text-decoration: none;
            }
        </style>
    </head>
    <body>

        <div class="main-container">
            <div class="illustration">
                <img src="img/register.jpg" alt="CRM Illustration">
            </div>
            <div class="form-container">
                <div class="form-box">
                    <h2>Tạo tài khoản DPCMR</h2>
                    <form method="post" action="RegisterController">
                        <label for="email">Địa chỉ email của bạn</label>
                        <input type="email" id="email" name="email" placeholder="name@gmail.com" required>

                        <div class="checkbox">
                            <input type="checkbox" id="subscribe" name="subscribe" required>
                            <label for="subscribe" style="display:inline" >Tôi đồng ý nhận thông tin cập nhật sản phẩm, ưu đãi đặc biệt và tin tức qua email</label>
                        </div>
                        <c:if test="${not empty error}">
                            <p style="color:red">${error}</p>
                        </c:if>
                        <button type="submit" class="btn">Đăng Kí</button>

                        <div class="footer">
                            © 2025 DPCRM from ISP490_SU25_GR4<br>
                            Bằng cách đăng ký, bạn đồng ý với <a href="#">Điều khoản dịch vụ</a>
                        </div>
                    </form>
                </div>
                <div class="login-link">
                    Bạn đã có tài khoản? <a href="login.jsp">Đăng nhập</a>
                </div>
            </div>
        </div>

    </body>
</html>
