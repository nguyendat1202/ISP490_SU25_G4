<%-- 
    Document   : listProduct
    Created on : Jun 8, 2025, 12:01:43 PM
    Author     : NGUYEN MINH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- Set currentPage for active menu item --%>
<c:set var="currentPage" value="listProduct" />
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Danh sách Hàng hóa</title>

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Adamina&family=Be+Vietnam+Pro:wght@600&display=swap" rel="stylesheet">

        <script src="https://unpkg.com/feather-icons"></script>

        <link rel="stylesheet" href="css/style.css">        
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/mainMenu.css">
        <link rel="stylesheet" href="css/listProduct.css">
        <link rel="stylesheet" href="css/pagination.css">
    </head>
    <body>
        <div class="app-container">
            <jsp:include page="mainMenu.jsp"/>
            <main class="main-content">
                <header class="main-top-bar">
                    <div class="page-title">Danh sách hàng hóa</div>
                    <button class="notification-btn">
                        <i data-feather="bell"></i>
                        <span class="notification-badge"></span>
                    </button>
                </header>

                <section class="content-body">
                    <div class="product-content-container">
                        <div class="product-toolbar">
                            <div class="search-filter-group">
                                <div class="search-input-wrapper">
                                    <div class="input-with-icon">
                                        <input type="text" placeholder="Tìm kiếm hàng hóa">
                                        <i data-feather="search" class="icon"></i>
                                    </div>
                                </div>
                                <%-- THAY ĐỔI: Thêm id="filterBtn" để JavaScript có thể bắt sự kiện --%>
                                <button class="filter-button" id="filterBtn">
                                    Bộ lọc
                                    <i data-feather="filter" class="icon"></i>
                                </button>
                            </div>

                            <div class="action-buttons-group">
                                <a href="createProduct.jsp" class="btn-primary">
                                    <i data-feather="plus" class="icon"></i>
                                    <span>Thêm hàng</span>
                                </a>
                                <a href="#" class="btn-primary">
                                    <i data-feather="plus" class="icon"></i>
                                    <span>Thêm nhóm hàng</span>
                                </a>
                            </div>
                        </div>

                        <%-- BỔ SUNG: KHUNG BỘ LỌC CHI TIẾT (MẶC ĐỊNH SẼ ẨN) --%>
                        <div class="filter-container" id="filterContainer" style="display: none;">
                            <div class="filter-controls">
                                <div class="filter-group">
                                    <label for="minPrice">Lọc theo giá (VNĐ)</label>
                                    <div class="price-inputs">
                                        <input type="number" id="minPrice" placeholder="Từ">
                                        <span>-</span>
                                        <input type="number" id="maxPrice" placeholder="Đến">
                                    </div>
                                </div>
                                <div class="filter-group">
                                    <label for="originSelect">Xuất xứ</label>
                                    <select id="originSelect">
                                        <option value="">Tất cả</option>
                                        <option value="vietnam">Việt Nam</option>
                                        <option value="trungquoc">Trung Quốc</option>
                                        <option value="nhatban">Nhật Bản</option>
                                        <option value="my">Mỹ</option>
                                    </select>
                                </div>
                                <div class="filter-group">
                                    <label for="groupSelect">Nhóm hàng hóa</label>
                                    <select id="groupSelect">
                                        <option value="">Tất cả</option>
                                        <option value="dientu">Điện tử</option>
                                        <option value="thoitrang">Thời trang</option>
                                        <option value="giadung">Gia dụng</option>
                                    </select>
                                </div>
                            </div>
                            <div class="filter-actions">
                                <button class="btn-reset-filter">Xóa bộ lọc</button>
                                <button class="btn-apply-filter">Áp dụng</button>
                            </div>
                        </div>

                        <div class="product-table-wrapper">
                            <%-- Nội dung bảng giữ nguyên... --%>
                            <table class="product-table">
                                <thead>
                                    <tr>
                                        <th class="col-stt">STT</th>
                                        <th class="col-name">Tên hàng hóa</th>
                                        <th class="col-group">Nhóm hàng hóa</th>
                                        <th class="col-desc">Mô tả</th>
                                        <th class="col-price">Giá sản phẩm</th>
                                        <th class="col-actions">Thao tác</th>
                                    </tr>
                                </thead>
                                <%--<tbody>
                                    <tr>
                                        <td class="col-stt">1</td>
                                        <td class="col-name">Sản phẩm Mẫu A</td>
                                        <td class="col-group">Điện tử</td>
                                        <td class="col-desc">Mô tả ngắn gọn cho sản phẩm A.</td>
                                        <td class="col-price">15.000.000đ</td>
                                        <td class="col-actions">
                                            <div class="action-icon-group">
                                                <a href="#" class="action-link icon-view" title="Xem"><i data-feather="eye"></i></a>
                                                <a href="#" class="action-link icon-edit" title="Sửa"><i data-feather="edit-2"></i></a>
                                                <a href="#" class="action-link icon-delete" title="Xóa"><i data-feather="trash-2"></i></a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="col-stt">2</td>
                                        <td class="col-name">Sản phẩm Mẫu B</td>
                                        <td class="col-group">Thời trang</td>
                                        <td class="col-desc">Mô tả ngắn gọn cho sản phẩm B.</td>
                                        <td class="col-price">850.000đ</td>
                                        <td class="col-actions">
                                            <div class="action-icon-group">
                                                <a href="#" class="action-link icon-view" title="Xem"><i data-feather="eye"></i></a>
                                                <a href="#" class="action-link icon-edit" title="Sửa"><i data-feather="edit-2"></i></a>
                                                <a href="#" class="action-link icon-delete" title="Xóa"><i data-feather="trash-2"></i></a>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>--%>
                                <tbody>
                                    <%-- 
                                        Vòng lặp này sẽ duyệt qua một danh sách có tên là "productList".
                                        Khi backend của bạn sẵn sàng, nó sẽ có nhiệm vụ gửi danh sách này đến đây.
                                    --%>
                                <c:forEach var="p" items="${productList}" varStatus="loop">
                                    <tr>
                                        <%-- Dùng varStatus để lấy số thứ tự của vòng lặp --%>
                                        <td class="col-stt">${loop.count}</td>

                                        <%-- Dùng Expression Language ${} để lấy thuộc tính của đối tượng --%>
                                        <td class="col-name">${p.productName}</td>
                                        <td class="col-group">${p.productGroup}</td>
                                        <td class="col-desc">${p.description}</td>
                                        <td class="col-price">
                                            <%-- Dùng thư viện <fmt> để định dạng giá tiền cho đẹp (vd: 15,000,000 ₫) --%>
                                    <fmt:formatNumber value="${p.price}" type="currency" currencyCode="VND" maxFractionDigits="0"/>
                                    </td>
                                    <td class="col-actions">
                                        <div class="action-icon-group">
                                            <%-- Các link này sẽ tự động gắn ID của từng sản phẩm vào URL --%>
                                            <a href="viewProduct?pid=${p.productID}" class="action-link icon-view" title="Xem"><i data-feather="eye"></i></a>
                                            <a href="editProduct?pid=${p.productID}" class="action-link icon-edit" title="Sửa"><i data-feather="edit-2"></i></a>
                                            <a href="deleteProduct?pid=${p.productID}" class="action-link icon-delete" title="Xóa" onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này?');"><i data-feather="trash-2"></i></a>
                                        </div>
                                    </td>
                                    </tr>
                                </c:forEach>

                                <%-- 
                                    Đoạn mã này dùng để hiển thị một thông báo thân thiện 
                                    khi danh sách "productList" rỗng hoặc không tồn tại.
                                --%>
                                <c:if test="${empty productList}">
                                    <tr>
                                        <td colspan="6" style="text-align: center; padding: 40px;">Chưa có dữ liệu sản phẩm.</td>
                                    </tr>
                                </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <jsp:include page="pagination.jsp" />
                </section>
            </main>
        </div>

        <script>
            feather.replace();
        </script>
        <script src="js/filterProduct.js"></script>

        <script src="js/mainMenu.js"></script>
    </body>
</html>
