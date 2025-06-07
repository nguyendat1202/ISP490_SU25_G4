<%-- 
    Document   : changePassword
    Created on : June 4, 2025, 11:28:23 PM
    Author     : minhnhnhe172717
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="currentPage" value="changePassword" />
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đổi mật khẩu</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
        <script src="https://unpkg.com/feather-icons"></script>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/mainMenu.css">       
        <link rel="stylesheet" href="css/changePassword.css">
    </head>
    <body>
        <div class="app-container">
            <jsp:include page="mainMenu.jsp"/>
            <main class="main-content">
                <header class="main-top-bar">
                    <div class="page-title">Đổi mật khẩu</div>
                    <button class="notification-btn">
                        <i data-feather="bell"></i>
                        <span class="notification-badge"></span>
                    </button>
                </header>

                <div class="change-password-container">
                    <form action="changePassword" method="POST" class="change-password-form">
                        <div class="form-header">
                            Đổi mật khẩu
                        </div>
                        <div class="form-body">
                            <div class="form-row">
                                <label for="currentPassword">Mật khẩu hiện tại</label>
                                <input type="password" id="currentPassword" name="currentPassword" placeholder="Nhập mật khẩu hiện tại" required>
                            </div>
                            <div class="form-row">
                                <label for="newPassword">Mật khẩu mới</label>
                                <input type="password" id="newPassword" name="newPassword" placeholder="Nhập mật khẩu mới" required>
                            </div>
                            <div class="form-row">
                                <label for="confirmPassword">Nhập lại mật khẩu mới</label>
                                <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Xác nhận mật khẩu mới" required>
                            </div>
                        </div>
                        <div class="form-footer">
                            <button type="button" class="btn-cancel">Hủy</button>
                            <button type="submit" class="btn-save">Lưu thông tin</button>
                        </div>
                    </form>
                </div>

            </main>
        </div>

        <script>
            feather.replace();
        </script>
        <script src="js/mainMenu.js"></script>
    </body>
</html>