<%-- 
    Document   : verifyForgotPassword
    Created on : May 31, 2025, 12:43:01 PM
    Author     : NGUYEN MINH
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Xác minh mã OTP - Quên mật khẩu</title>
    <style>
        * {
            margin: 0; padding: 0; box-sizing: border-box;
            font-family: Roboto, Arial, sans-serif;
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
        .verify-container {
            width: 40%;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            position: relative;
        }
        .logo {
            text-align: center;
            margin-bottom: 10px;
        }
        .logo img {
            width: 110px;
            height: 87px;
            background: white;
        }
        .company-name {
            font-size: 18px;
            color: #E01111;
            font-weight: 700;
            margin-bottom: 30px;
            text-align: center;
        }
        .info-text {
            font-size: 26px;
            font-weight: 500;
            text-align: center;
            color: black;
            margin-bottom: 25px;
            line-height: 28px;
            white-space: pre-line;
        }
        .input-label {
            font-size: 25px;
            font-weight: 500;
            color: black;
            margin-bottom: 10px;
        }
        input[type="text"] {
            width: 100%;
            height: 38px;
            padding: 8px 12px;
            font-size: 20px;
            border-radius: 3px;
            border: 1px solid #CDCDCD;
            outline-offset: -1px;
            color: #CDCDCD;
            position: relative;
        }
        button.verify-btn {
            margin-top: 20px;
            width: 100%;
            height: 32px;
            background-color: #15166F;
            border-radius: 8px;
            color: white;
            font-weight: 700;
            font-size: 14px;
            border: none;
            cursor: pointer;
            position: relative;
        }
        .expire-message {
            margin-top: 18px;
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 20px;
            color: #00376B;
            font-weight: 400;
        }
        .expire-icon {
            width: 24px;
            height: 24px;
            background-color: #E01111;
            position: relative;
            border-radius: 2px;
        }
        .expire-icon::before, .expire-icon::after {
            content: '';
            position: absolute;
            top: 6px; left: 9px;
            width: 2px; height: 6px;
            background: white;
            border-radius: 1px;
        }
        .expire-icon::after {
            left: 14px;
            height: 12px;
            top: 4px;
            border-radius: 2px;
        }
        .footer {
            margin-top: 40px;
            font-size: 14px;
            color: #737373;
            text-align: center;
            font-family: Roboto, Arial, sans-serif;
            font-weight: 400;
        }
    </style>
</head>
<body>

<div class="left-side"></div>

<div class="verify-container">
    <div class="logo">
        <img src="image/logo.png" alt="Logo" />
    </div>
    <div class="company-name">DONG PHAT JOINT STOCK COMPANY</div>

    <div class="info-text">
        Mã xác thực đã được gửi đến
        "<%= request.getAttribute("userEmail") != null ? request.getAttribute("userEmail") : "email@gmail.com" %>"
    </div>

    <form action="VerifyForgotPassOTPServlet" method="post">
        <label class="input-label" for="verificationCode">Nhập mã xác minh gồm 6 số</label>
        <input type="text" id="verificationCode" name="verificationCode" placeholder="Mã xác minh" required maxlength="6" pattern="\d{6}" title="Vui lòng nhập đúng 6 chữ số" />
        <button type="submit" class="verify-btn">Xác minh</button>
    </form>

    <div class="expire-message">
        <div class="expire-icon"></div>
        Mã sẽ hết hạn sau 5 phút
    </div>

    <div class="footer">© 2025 DPCRM from ISP490_SU25_GR4</div>
</div>

</body>
</html>
