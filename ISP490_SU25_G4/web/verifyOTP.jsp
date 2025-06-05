<%-- 
    Document   : verifyOTP
    Created on : May 29, 2025, 10:48:23 AM
    Author     : NGUYEN MINH
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Xác minh mã OTP</title>
        <style>
            * {
                box-sizing: border-box;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }

            html, body {
                margin: 0;
                padding: 0;
                width: 100%;
                height: 100vh;
            }

            .container {
                display: flex;
                height: 100vh;
            }

            .left-side {
                flex: 1;
                position: relative;
                background: url('img/bg.jpg') no-repeat center center;
                background-size: contain;
                background-color: #fff;
            }

            .left-side img {
                position: absolute;
                top: 30px;
                left: 200px;
                width: 60px;
            }

            .left-side .company-name {
                position: absolute;
                top: 130px;
                left: 200px;
                font-size: 18px;
                font-weight: 600;
                color: #D80000;
            }

            .right-side {
                flex: 1;
                background-color: #fff;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                padding: 20px;
            }

            .verify-box {
                width: 100%;
                max-width: 400px;
                border: 1px solid #ddd;
                padding: 30px;
                border-radius: 12px;
                text-align: center;
            }

            .verify-box h3 {
                font-size: 18px;
                margin-bottom: 25px;
                color: #15166F;
            }

            .verify-box input[type="text"] {
                width: 100%;
                padding: 12px;
                border: 1px solid #ccc;
                border-radius: 6px;
                margin-bottom: 20px;
                font-size: 15px;
            }

            .verify-box button {
                width: 100%;
                padding: 10px;
                background-color: #15166F;
                color: white;
                border: none;
                border-radius: 6px;
                font-weight: bold;
                font-size: 15px;
                cursor: pointer;
            }

            .verify-box button:hover {
                background-color: #0d1b5d;
            }

            .verify-box .expired {
                color: red;
                font-size: 14px;
                margin-top: 16px;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 6px;
            }

            .verify-box .expired img {
                width: 18px;
                height: 18px;
            }

            .resend {
                margin-top: 20px;
                font-size: 14px;
                text-align: center;
            }

            .resend a {
                color: #15166F;
                font-weight: bold;
                text-decoration: none;
                margin-left: 5px;
            }

            .footer {
                margin-top: 40px;
                font-size: 12px;
                color: #777;
                text-align: center;
            }

            @media (max-width: 768px) {
                .container {
                    flex-direction: column;
                }

                .left-side {
                    height: 40vh;
                    background-size: cover;
                }

                .right-side {
                    height: 60vh;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
            <!-- Cột trái: ảnh + logo + tên công ty -->
            <div class="left-side">
                <img src="img/logo.jpg" alt="Logo">
                <div class="company-name">DONG PHAT JOINT STOCK COMPANY</div>
            </div>

            <!-- Cột phải: form xác minh -->
            <div class="right-side">
                <div class="verify-box">
                    <h3>Mã xác thực đã được gửi đến<br>"<%= session.getAttribute("email")%>"</h3>

                    <form action="VerifyOTPController" method="post">
                        <input type="text" name="otp" placeholder="Mã xác minh" required>
                        <c:if test="${not empty error}">
                            <p style="color:red">${error}</p>
                        </c:if>
                        <button type="submit">Xác minh</button>
                    </form>

                    <div class="expired">
                        <img src="img/warning-icon.png" alt="Cảnh báo">
                        Mã sẽ hết hạn sau 5 phút
                    </div>
                </div>

                <div class="resend">
                    Bạn chưa nhận được mã? <a href="ResendOTPServlet">Gửi lại</a>
                </div>

                <div class="footer">
                    © 2025 DPCRM from ISP490_SU25_GR4
                </div>
            </div>
        </div>
    </body>
</html>
