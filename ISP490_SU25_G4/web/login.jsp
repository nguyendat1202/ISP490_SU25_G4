<%-- 
    Document   : login
    Created on : May 29, 2025, 10:48:23 AM
    Author     : NGUYEN MINH
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Đăng nhập CRM</title>
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
            background-size: fill;
        }
        .login-container {
            width: 40%;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .logo {
            text-align: center;
            margin-bottom: 10px; /* giảm khoảng cách gần logo */
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
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 12px 16px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 16px;
            font-family: Arial, sans-serif;
        }
        .login-btn {
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
        .login-btn:hover {
            background-color: #000a5a;
        }
        .extra-links {
            text-align: center;
            margin-top: 15px;
            font-family: Arial, sans-serif;
        }
        .extra-links a {
            text-decoration: none;
            color: #0e126d;
            font-weight: 700;
        }
        .extra-links p {
            margin-top: 10px;
            font-size: 14px;
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

<div class="login-container">
    <div class="logo">
        <img src="image/logo.png" alt="Logo" />
    </div>
    <div class="company-name">DONG PHAT JOINT STOCK COMPANY</div>

    <form action="UserController" method="post">
        <div class="form-group">
            <input type="text" name="email" placeholder="Email" required />
        </div>

        <div class="form-group">
            <input type="password" name="password" placeholder="Mật khẩu" required />
        </div>

        <button type="submit" class="login-btn">Đăng nhập</button>

        <div class="extra-links">
            <p>HOẶC</p>
            <a href="forgotPassword.jsp">Quên mật khẩu</a>
            <p>Bạn chưa có tài khoản? <a href="register.jsp">Đăng ký</a></p>
        </div>
    </form>

    <div class="footer">
        © 2025 DPCRM from ISP490_SU25_GR4
    </div>
</div>

</body>
</html>
