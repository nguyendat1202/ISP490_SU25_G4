<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Xác minh mã OTP</title>
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
            width: 50%;
            height: 100%;
            background: url("image/OTP.png") no-repeat center center;
            background-size: fit;
        }
        .verify-container {
            width: 40%;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .logo {
            text-align: center;
            margin-bottom: 8px;
        }
        .logo img {
            width: 110px;
        }
        .company-name {
            font-size: 18px;
            color: #E01111;
            font-weight: 700;
            margin-top: 0;
            margin-bottom: 30px;
            text-align: center;
        }
        .info-text {
            font-size: 22px;
            color: black;
            margin-bottom: 20px;
            text-align: center;
            font-weight: 500;
        }
        .email-text {
            font-weight: 600;
            color: #333;
            margin-bottom: 30px;
            text-align: center;
        }
        .input-group {
            margin-bottom: 20px;
        }
        input[type="text"] {
            width: 100%;
            padding: 12px 16px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 20px;
            font-family: Arial, sans-serif;
        }
        .btn-verify {
            width: 100%;
            background-color: #15166F;
            color: white;
            padding: 12px;
            font-size: 16px;
            font-weight: 700;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }
        .btn-verify:hover {
            background-color: #0e126d;
        }
        .expire-message {
            color: #00376B;
            font-size: 16px;
            margin-top: 15px;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            font-weight: 500;
        }
        .expire-icon {
            width: 20px;
            height: 20px;
            background-color: #E01111;
            border-radius: 50%;
            position: relative;
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
        .resend-link {
            margin-top: 20px;
            text-align: center;
        }
        .resend-link a {
            text-decoration: none;
            color: #15166F;
            font-weight: 700;
            cursor: pointer;
        }
        .footer {
            text-align: center;
            font-size: 13px;
            color: #999;
            margin-top: 40px;
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

    <div class="info-text">Mã xác thực đã được gửi đến</div>
    <div class="email-text">
        "<%= request.getAttribute("userEmail") != null ? request.getAttribute("userEmail") : "email@gmail.com" %>"
    </div>

    <form action="VerifyCodeServlet" method="post">
        <div class="input-group">
            <input type="text" name="verificationCode" placeholder="Nhập mã xác minh gồm 6 số" required maxlength="6" pattern="\d{6}" title="Vui lòng nhập đúng 6 chữ số" />
        </div>
        <button type="submit" class="btn-verify">Xác minh</button>
    </form>

    <div class="expire-message">
        <div class="expire-icon"></div>
        Mã sẽ hết hạn sau 5 phút
    </div>

    <div class="resend-link">
        Bạn chưa nhận được mã? <a href="ResendCodeServlet">Gửi lại</a>
    </div>

    <div class="footer">
        © 2025 DPCRM from ISP490_SU25_GR4
    </div>
</div>

</body>
</html>
