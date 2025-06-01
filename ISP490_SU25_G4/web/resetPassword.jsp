<%-- 
    Document   : resetPassword
    Created on : May 31, 2025, 12:47:31 PM
    Author     : NGUYEN MINH
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Đặt lại mật khẩu</title>
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
            background: url("image/OTP.png") no-repeat center center;
            background-size: fit;
        }
        .reset-container {
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
            width: 110px;
            height: 87px;
            background: white;
        }
        .company-name {
            font-size: 13px;
            color: red;
            text-align: center;
            margin-bottom: 30px;
            font-weight: 700;
        }
        h2 {
            font-size: 26px;
            color: #3C3838;
            font-weight: 500;
            margin-bottom: 25px;
            text-align: center;
        }
        label {
            font-size: 20px;
            color: #3C3838;
            font-weight: 500;
            margin-bottom: 10px;
            display: block;
        }
        input[type="password"] {
            width: 100%;
            padding: 12px 16px;
            border-radius: 6px;
            border: 1px solid #CDCDCD;
            font-size: 18px;
            margin-bottom: 20px;
            font-family: Arial, sans-serif;
            box-sizing: border-box;
        }
        button {
            width: 100%;
            background-color: #15166F;
            color: white;
            padding: 12px;
            font-size: 16px;
            font-weight: 700;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0e126d;
        }
        .password-requirements {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-top: 10px;
            color: #C49C00;
            font-size: 14px;
            font-weight: 500;
        }
        .warning-icon {
            width: 30px;
            height: 30px;
            background: #FFF419;
            border-radius: 4px;
            position: relative;
            flex-shrink: 0;
        }
        .warning-icon::before {
            content: "!";
            color: #C49C00;
            font-weight: 900;
            font-size: 22px;
            position: absolute;
            top: 1px;
            left: 9px;
        }
        .footer {
            margin-top: 40px;
            font-size: 12px;
            color: #737373;
            text-align: center;
            font-family: Arial, sans-serif;
        }
    </style>
</head>
<body>

<div class="left-side"></div>

<div class="reset-container">
    <div class="logo">
        <img src="image/logo.png" alt="Logo" />
    </div>
    <div class="company-name">DONG PHAT JOINT STOCK COMPANY</div>

    <h2>Đặt lại mật khẩu</h2>

    <form action="ResetPasswordServlet" method="post">
        <label for="newPassword">Mật khẩu mới</label>
        <input type="password" id="newPassword" name="newPassword" placeholder="Nhập mật khẩu mới" required />

        <label for="confirmPassword">Nhập lại mật khẩu</label>
        <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Nhập lại mật khẩu" required />

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

