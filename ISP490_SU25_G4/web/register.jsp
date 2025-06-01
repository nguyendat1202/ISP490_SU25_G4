<%-- 
    Document   : register
    Created on : May 29, 2025, 10:48:23 AM
    Author     : NGUYEN MINH
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8" />
<title>Đăng ký DPCMR</title>
<style>
    * {
        box-sizing: border-box;
    }
    body, html {
        margin: 0; padding: 0;
        height: 100vh;
        width: 100vw;
        font-family: Roboto, sans-serif;
        background: white;
        display: flex;
        justify-content: center;
        align-items: center;
        overflow-x: hidden;
    }
    .container {
        width: 100%;
        max-width: 1200px;
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 50px;
        padding: 0 20px;
    }
    .left-image {
        flex: 1;
        background: url("image/register.png") no-repeat center center;
        background-size: contain;
        height: 600px;
        min-width: 300px;
    }
    .right-form {
        flex: 1;
        max-width: 400px;
        background: #FFC931;
        border-radius: 20px;
        padding: 40px 35px;
        box-shadow: 0px 12px 24px rgba(0,0,0,0.07);
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .logo {
        width: 70px;
        height: 70px;
        margin-bottom: 20px;
    }
    .logo img {
        width: 100%;
        height: 100%;
        object-fit: contain;
    }
    h2 {
        font-weight: 400;
        font-size: 26px;
        color: #151515;
        margin: 0 0 35px 0;
        text-align: center;
    }
    label {
        align-self: flex-start;
        font-size: 14px;
        color: #151515;
        opacity: 0.8;
        margin-bottom: 6px;
        font-weight: 500;
    }
    input[type=email] {
        width: 100%;
        height: 42px;
        border-radius: 8px;
        border: 1px solid #0154C8;
        padding-left: 15px;
        font-size: 16px;
        color: #A7A7A7;
        box-sizing: border-box;
    }
    .checkbox-wrapper {
        font-size: 12px;
        color: #828B95;
        display: flex;
        align-items: flex-start;
        gap: 8px;
        line-height: 1.2;
        align-self: flex-start;
        margin-top: 10px;
        user-select: none;
    }
    .checkbox-wrapper input[type=checkbox] {
        width: 16px;
        height: 16px;
        margin: 0;
        margin-top: 3px;
    }
    button {
        width: 100%;
        background-color: #15166F;
        color: white;
        font-weight: 700;
        font-size: 16px;
        height: 47px;
        border-radius: 8px;
        border: none;
        cursor: pointer;
        outline: none;
        margin-top: 25px;
        transition: background-color 0.3s ease;
    }
    button:hover {
        background-color: #0e126d;
    }
    .terms {
        font-size: 12px;
        color: #828B95;
        margin-top: 20px;
        text-align: center;
    }
    .terms a {
        text-decoration: underline;
        color: #828B95;
        cursor: pointer;
    }
    .login-box {
        margin-top: 20px;
        width: 100%;
        background: #FFC931;
        border-radius: 10px;
        text-align: center;
        padding: 15px 0;
        font-size: 14px;
        color: #15166F;
        font-weight: 600;
        cursor: default;
    }
    .login-box a {
        font-weight: 700;
        text-decoration: none;
        color: #15166F;
        margin-left: 5px;
        cursor: pointer;
    }
    .copyright {
        margin-top: 35px;
        font-size: 11px;
        color: #737373;
        text-align: center;
        width: 100%;
    }

    /* Responsive */
    @media screen and (max-width: 900px) {
        .container {
            flex-direction: column;
            gap: 30px;
            padding: 20px 10px;
        }
        .left-image, .right-form {
            width: 100%;
            max-width: none;
            height: 300px;
        }
        .right-form {
            padding: 30px 20px;
            border-radius: 15px;
        }
    }
</style>
</head>
<body>

<div class="container">
    <div class="left-image"></div>

    <div class="right-form">
        <div class="logo">
            <img src="image/logo.png" alt="Logo DPCMR" />
        </div>
        <h2>Tạo tài khoản DPCMR</h2>
        <form action="RegisterServlet" method="post" style="width: 100%;">
            <label for="email">Địa chỉ email của bạn</label>
            <input type="email" id="email" name="email" placeholder="name@company.com" required />
            <div class="checkbox-wrapper">
                <input type="checkbox" id="accept" name="accept" />
                <label for="accept">Tôi đồng ý nhận thông tin cập nhật sản phẩm, ưu đãi đặc biệt và tin tức qua email</label>
            </div>
            <button type="submit">Tiếp tục</button>
            <div class="terms">
                Bằng cách đăng ký, bạn đồng ý với <a href="#">Điều khoản dịch vụ</a>
            </div>
        </form>

        <div class="login-box">
            Bạn đã có tài khoản? <a href="login.jsp">Đăng nhập</a>
        </div>

        <div class="copyright">
            © 2025 DPCRM from ISP490_SU25_GR4
        </div>
    </div>
</div>

</body>
</html>
