<%-- 
    Document   : listEmployee
    Created on : Jun 6, 2025, 8:52:42 AM
    Author     : NGUYEN MINH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="currentPage" value="listEmployee" />
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quản lý Nhân viên</title>

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
        <script src="https://unpkg.com/feather-icons"></script>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/menu.css">
        <link rel="stylesheet" href="css/pagination.css">
        <link rel="stylesheet" href="css/dataTable.css">  
        <link rel="stylesheet" href="css/modal.css">
    </head>
    <body>
        <div class="app-container">
            <jsp:include page="menu.jsp"/>
            <main class="main-content">
                <header class="main-top-bar">
                    <div class="page-title">Nhân viên</div>
                    <button class="notification-btn">
                        <i data-feather="bell"></i>
                        <span class="notification-badge"></span>
                    </button>
                </header>

                <section class="content-body">
                    <div class="table-toolbar">
                        <div class="search-bar">
                            <i data-feather="search"></i>
                            <input type="text" placeholder="Tìm kiếm nhân viên">
                        </div>
                        <a href="addEmployee" class="btn btn-primary">
                            <i data-feather="plus"></i>
                            <span>Thêm nhân viên</span>
                        </a>
                    </div>

                    <div class="table-container">
                        <div class="table-container">
                            <table class="data-table">
                                <%-- PHẦN 1: SỬA LẠI THỨ TỰ CÁC CỘT TRONG TIÊU ĐỀ CHO ĐÚNG --%>
                                <thead>
                                    <tr>
                                        <th class="col-checkbox"><input type="checkbox" /></th>
                                        <th class="col-id">Mã nhân viên</th>
                                        <th class="col-name">Tên nhân viên</th>
                                        <th class="col-phone">Số điện thoại</th>
                                        <th class="col-idcard">Số CMND/CCCD</th>
                                        <th class="col-position">Chức vụ</th>
                                        <th class="col-department">Phòng ban</th>
                                        <th class="col-actions">Hành động</th>
                                    </tr>
                                </thead>
                                <%-- File: listEmployee.jsp --%>
                                <tbody>
                                    <c:forEach var="employee" items="${employeeList}">
                                        <tr data-id="${employee.id}"
                                            <%-- SỬA: Ghép họ và tên để hiển thị và dùng cho các thuộc tính data-* --%>
                                            data-name="${employee.lastName} ${employee.middleName} ${employee.firstName}"
                                            data-code="${employee.employeeCode}"
                                            data-phone="${employee.phoneNumber}" <%-- SỬA: thành phoneNumber --%>
                                            data-idcard="${employee.identityCardNumber}" <%-- SỬA: thành identityCardNumber --%>
                                            data-position="${employee.position}"
                                            data-department="${employee.department}">

                                            <td class="col-checkbox"><input type="checkbox" name="employeeId" value="${employee.id}" /></td>

                                            <td>${employee.employeeCode}</td>

                                            <%-- SỬA: Ghép các thành phần tên lại để hiển thị đầy đủ --%>
                                            <td>${employee.lastName} ${employee.middleName} ${employee.firstName}</td>

                                            <%-- SỬA: Dùng đúng tên thuộc tính trong model User --%>
                                            <td>${employee.phoneNumber}</td>
                                            <td>${employee.identityCardNumber}</td>

                                            <td>${employee.position}</td>
                                            <td>${employee.department}</td>

                                            <td class="col-actions">
                                                <div class="action-buttons">
                                                    <a href="viewEmployee?id=${employee.id}" class="view-btn" title="Xem chi tiết"><i data-feather="eye"></i></a>
                                                    <a href="editEmployee?id=${employee.id}" title="Sửa"><i data-feather="edit-2"></i></a>
                                                    <a href="deleteEmployee?id=${employee.id}" title="Xóa" 
                                                       onclick="return confirm('Bạn có chắc chắn muốn xóa nhân viên ${employee.lastName} ${employee.firstName} không?');">
                                                        <i data-feather="trash-2"></i>
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <section class="content-body">
                        <div class="table-toolbar">
                        </div>

                        <div class="empty-state">
                        </div>
                        <jsp:include page="pagination.jsp"/>
                    </section>
                </section>
            </main>
        </div>


        <script>
            feather.replace();
        </script>
        <script src="js/mainMenu.js"></script>
    </body>
</html>