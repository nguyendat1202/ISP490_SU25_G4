<%-- 
    Document   : listProduct
    Created on : Jun 12, 2025
    Author     : minhnhn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="currentPage" value="listProduct" />

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Danh sách Hàng hóa</title>

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Be+Vietnam+Pro:wght@600&display=swap" rel="stylesheet">

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
                <header class="page-header">
                    <div class="title-section">
                        <div class="title">Danh sách Sản phẩm</div>
                        <div class="breadcrumb">Sản phẩm / <span>Danh sách</span></div>
                    </div>
                    <button class="notification-btn">
                        <i data-feather="bell"></i>
                        <span class="notification-badge"></span>
                    </button>
                </header>

                <div class="page-content">
                    <div class="content-card">
                        <form action="product" method="get">
                            <div class="table-toolbar">
                                <div class="search-box">
                                    <i data-feather="search" class="feather-search"></i>
                                    <input type="text" name="searchQuery" placeholder="Tìm kiếm tên, mã SP..." value="${param.searchQuery}">
                                </div>
                                <button type="button" class="filter-button" id="filterBtn">
                                    <i data-feather="filter"></i>
                                    <span>Bộ lọc</span>
                                </button>
                                <div class="toolbar-actions">
                                    <a href="createProduct.jsp" class="btn btn-primary"><i data-feather="plus"></i>Thêm Sản phẩm</a>
                                    <a href="createGroupProduct.jsp" class="btn btn-primary"><i data-feather="plus-square"></i>Thêm nhóm hàng</a>
                                </div>
                            </div>
                            <div class="filter-container" id="filterContainer" style="display: none;">
                                <div class="filter-controls">
                                    <div class="filter-group">
                                        <label>Khoảng giá (VNĐ)</label>
                                        <div class="price-inputs">
                                            <input type="number" name="minPrice" placeholder="Từ" value="${param.minPrice}">
                                            <span>-</span>
                                            <input type="number" name="maxPrice" placeholder="Đến" value="${param.maxPrice}">
                                        </div>
                                    </div>
                                    <div class="filter-group">
                                        <label for="origin-filter">Xuất xứ</label>
                                        <select id="origin-filter" name="originId">
                                            <option value="">Tất cả</option>
                                            <option value="">Nhật Bản</option>
                                            <option value="">Mỹ</option>
                                            <c:forEach var="origin" items="${origins}">
                                                <option value="${origin.id}" ${param.originId == origin.id ? 'selected' : ''}>${origin.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="filter-group">
                                        <label for="category-filter">Nhóm hàng</label>
                                        <select id="category-filter" name="categoryId">
                                            <option value="">Tất cả</option>
                                            <c:forEach var="category" items="${categories}">
                                                <option value="${category.id}" ${param.categoryId == category.id ? 'selected' : ''}>${category.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="filter-actions">
                                    <a href="product" class="btn-reset-filter">Xóa lọc</a>
                                    <button type="submit" class="btn-apply-filter">Áp dụng</button>
                                </div>
                            </div>
                        </form>

                        <div class="product-grid">
                            <c:if test="${empty products}">
                                <p style="grid-column: 1 / -1; text-align: center; padding: 40px; color: var(--text-secondary);">
                                    Không có sản phẩm nào để hiển thị.
                                </p>
                            </c:if>

                            <%-- Vòng lặp JSTL để hiển thị dữ liệu sản phẩm động --%>
                            <c:forEach var="product" items="${products}">
                                <div class="product-card">
                                    <div class="card-image">
                                        <a href="productDetail?id=${product.id}">
                                            <img src="${not empty product.imageUrl ? product.imageUrl : 'https://placehold.co/400x300/E0E0E0/A4A4A4?text=No+Image'}" 
                                                 alt="${product.name}">
                                        </a>
                                    </div>
                                    <div class="card-content">
                                        <div class="card-header">
                                            <a href="productDetail?id=${product.id}" class="product-name-link">
                                                <span class="product-name-header">${product.name}</span>
                                            </a>
                                            <span class="status-pill ${product.statusClass}">${product.statusText}</span>
                                        </div>
                                        <div class="card-body">
                                            <div class="card-info-row">
                                                <i data-feather="tag"></i>
                                                <span class="info-value">Mã: ${product.productCode}</span>
                                            </div>
                                            <div class="card-info-row">
                                                <i data-feather="layers"></i>
                                                <span class="info-value">Danh mục: ${product.categoryName}</span>
                                            </div>
                                            <div class="card-info-row">
                                                <i data-feather="package"></i>
                                                <span class="info-value">Xuất xứ: ${product.productOrigin}</span>
                                            </div>
                                        </div>
                                        <div class="card-footer">
                                            <div class="product-price-footer">
                                                <i data-feather="dollar-sign"></i>
                                                <span><fmt:formatNumber value="${product.price}" type="currency" currencyCode="VND"/></span>
                                            </div>
                                            <div class="action-buttons">
                                                <a href="productDetail?id=${product.id}" title="Xem chi tiết"><i data-feather="eye" class="icon-view"></i></a>
                                                <a href="editProduct?id=${product.id}" title="Sửa"><i data-feather="edit-2" class="icon-edit"></i></a>
                                                <a href="deleteProduct?id=${product.id}" onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm \'${product.name}\'?')" title="Xóa"><i data-feather="trash-2" class="icon-delete"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                        <jsp:include page="pagination.jsp"/>
                    </div>
                </div>
            </main>
        </div>
        <script src="js/listProduct.js"></script>
        <script src="js/mainMenu.js"></script>
    </body>
</html>
