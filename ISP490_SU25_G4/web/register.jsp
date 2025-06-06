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
        <meta charset="UTF-8" />
        <title>Đăng ký tài khoản DPCMR</title>
        <link rel="stylesheet" type="text/css" href="css/register.css" />
    </head>
    <body>

        <div class="main-container">
            <div class="illustration">
                <img src="image/register.png" alt="CRM Illustration">
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
