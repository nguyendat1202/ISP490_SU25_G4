<%-- 
    Document   : forgotPassword
    Created on : May 31, 2025, 12:32:12 PM
    Author     : NGUYEN MINH
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Quên mật khẩu</title>
    <style>
        * {
            margin: 0; padding: 0; box-sizing: border-box;
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
            width: 70%;
            height: 100%;
            background: url("image/login.png") no-repeat center center;
            background-size: fit;
        }
        .forgot-password-container {
            width: 40%;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .logo {
            text-align: center;
            margin-bottom: 10px;
        }
        .logo img {
            width: 100px;
        }
        .company-name {
            font-size: 13px;
            color: red;
            text-align: center;
            margin-bottom: 30px;
            font-weight: 700;
        }
        .form-group {
            margin-bottom: 20px;
        }
        input[type="email"] {
            width: 100%;
            padding: 12px 16px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 16px;
            font-family: Arial, sans-serif;
        }
        .send-otp-btn {
            width: 100%;
            background-color: #0e126d;
            color: #fff;
            padding: 12px;
            font-size: 16px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            margin-top: 10px;
            font-weight: 700;
        }
        .send-otp-btn:hover {
            background-color: #000a5a;
        }
        .back-login {
            text-align: center;
            margin-top: 20px;
            font-family: Arial, sans-serif;
            font-weight: 700;
            color: #0e126d;
            cursor: pointer;
            text-decoration: none;
            display: block;
        }
        .back-login:hover {
            text-decoration: underline;
        }
        .footer {
            text-align: center;
            font-size: 13px;
            color: #999;
            margin-top: 30px;
            font-family: Arial, sans-serif;
        }
    </style>
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

    <a href="login.jsp" class="back-login">Quay lại đăng nhập</a>

    <div class="footer">
        © 2025 DPCRM from ISP490_SU25_GR4
    </div>
</div>

</body>
</html>
