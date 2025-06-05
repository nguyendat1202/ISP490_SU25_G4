<%--
    Document   : editProfile.jsp
    Created on : Jun 5, 2025, 9:27:00 PM
    Author     : Datnt
    Version    : Final Consolidated Code
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <title>Sửa thông tin cá nhân</title>
    <style>
        :root {
            --base-white: #ffffff;
            --bg-default: #f2f2f2;
            --color-primary: #298e94;
            --color-text-primary: #4d4d4d;
            --color-text-secondary: #666666;
            --color-text-tertiary: #a4a4a4;
            --icon-primary: #4D4D4D;
        }
        * { box-sizing: border-box; }
        body, html {
            margin: 0; padding: 0; height: 100%;
            font-family: 'Actor', sans-serif;
            background: var(--bg-default);
        }
        .container { width: 100%; height: 100%; display: flex; }
        .sidebar {
            width: 308px;
            background: var(--base-white);
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.08);
            display: flex;
            flex-direction: column;
            transition: width 0.3s ease;
        }
        .sidebar.collapsed { width: 60px !important; }
        .logo-container {
            height: 84px; padding: 12px 20px;
            display: flex; justify-content: space-between; align-items: center;
        }
        .logo-image {
            width: 65px; height: 65px;
            background-image: url('https://placehold.co/65x65');
            background-size: contain; background-repeat: no-repeat;
            transition: opacity 0.3s ease;
        }
        .sidebar.collapsed .logo-image { opacity: 0; pointer-events: none; }
        .logo-icon {
            padding: 6px; background: rgba(41, 142, 148, 0.20);
            border-radius: 6px; outline: 1px #298E94 solid;
            cursor: pointer;
        }
        .menu-items {
            padding: 16px; flex: 1 1 auto;
            display: flex; flex-direction: column; gap: 8px;
        }
        .menu-item {
            display: flex; align-items: center; gap: 12px;
            padding: 10px 12px; border-radius: 8px;
            color: var(--color-text-tertiary);
            cursor: pointer;
            transition: color 0.3s ease, background 0.3s ease;
            white-space: nowrap;
        }
        .menu-item:hover, .menu-item.open {
            color: var(--color-primary); background: #E6F4F5;
        }
        .menu-item.active {
            color: var(--color-primary); font-weight: 600; background: #D0EBEF;
        }
        .menu-item:hover .icon-container svg, .menu-item.open .icon-container svg, .menu-item.active .icon-container svg {
            stroke: var(--color-primary);
        }
        .icon-container {
            width: 24px; height: 24px; display: flex;
            justify-content: center; align-items: center; flex-shrink: 0;
        }
        .menu-text, .arrow-icon { transition: opacity 0.2s ease; }
        .sidebar.collapsed .menu-text, .sidebar.collapsed .arrow-icon {
            opacity: 0; width: 0; overflow: hidden; pointer-events: none;
        }
        .arrow-icon { margin-left: auto; transition: transform 0.3s ease; }
        .menu-item.open .arrow-icon { transform: rotate(180deg); }
        .submenu {
            display: none; flex-direction: column;
            gap: 4px; padding-left: 36px; margin-top: 4px;
        }
        .submenu.active { display: flex; }
        .submenu-item {
            display: flex; align-items: center; gap: 12px;
            padding: 8px 12px; border-radius: 6px;
            color: var(--color-text-tertiary); cursor: pointer;
        }
        .submenu-item:hover, .submenu-item.active {
            background: #E6F4F5; color: var(--color-primary);
        }
         .submenu-item .icon-container svg { stroke: var(--color-text-tertiary); }
         .submenu-item:hover .icon-container svg, .submenu-item.active .icon-container svg {
             stroke: var(--color-primary) !important;
        }
        .main-content {
            flex-grow: 1; display: flex; flex-direction: column;
            width: calc(100% - 308px);
        }
        .sidebar.collapsed + .main-content { width: calc(100% - 60px); }
        .header-container {
            height: 84px; padding: 16px 24px;
            background: var(--base-white);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            display: flex; justify-content: space-between; align-items: center;
        }
        .header-title {
            color: var(--color-text-primary); font-size: 20px; font-family: Adamina, serif;
        }
        .form-input, .form-textarea {
            font-size: 16px; font-family: 'SVN-Gilroy', sans-serif;
            border: none; background: transparent; width: 100%; padding: 0;
        }
        .form-input:focus, .form-textarea:focus { outline: none; }
        .input-container {
            width: 100%; padding: 10px 0;
            border-bottom: 1px #E5E5E5 solid;
            display: flex; align-items: center; gap: 10px;
        }
        .view-only-field {
            color: #4d4d4d; user-select: none; cursor: default;
        }
    </style>
</head>
<body>
    <div class="container">
        <nav id="sidebar" class="sidebar" role="navigation">
            <div class="logo-container">
                <div class="logo-image"></div>
                <div id="toggleSidebarBtn" class="logo-icon">
                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg" stroke="var(--color-primary)" stroke-width="2">
                        <line x1="3" y1="6" x2="17" y2="6"/><line x1="3" y1="10" x2="17" y2="10"/><line x1="3" y1="14" x2="17" y2="14"/>
                    </svg>
                </div>
            </div>
            <div class="menu-items">
                <div class="menu-item">
                    <div class="icon-container"><svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg" stroke="currentColor" stroke-width="1.5"><rect x="2" y="2" width="6" height="6"/><rect x="12" y="2" width="6" height="6"/><rect x="2" y="12" width="6" height="6"/><rect x="12" y="12" width="6" height="6"/></svg></div>
                    <span class="menu-text">Tổng quản</span>
                </div>
                <div class="menu-item">
                    <div class="icon-container"><svg width="20" height="20" fill="none" xmlns="http://www.w3.org/2000/svg" stroke="currentColor" stroke-width="1.5"><circle cx="10" cy="6" r="4"/><path d="M4 18c0-3 12-3 12 0"/></svg></div>
                    <span class="menu-text">Khách hàng</span>
                </div>
                <div class="menu-item">
                    <div class="icon-container"><svg width="20" height="20" fill="none" xmlns="http://www.w3.org/2000/svg" stroke="currentColor" stroke-width="1.8"><rect x="4" y="6" width="12" height="14" rx="2"/><rect x="7" y="3" width="6" height="5" rx="1"/></svg></div>
                    <span class="menu-text">Hàng hóa</span>
                </div>
                
                <div class="menu-item" role="menuitem">
                    <div class="icon-container"><svg width="20" height="20" fill="none" xmlns="http://www.w3.org/2000/svg" stroke="currentColor" stroke-width="1.5"><rect x="3" y="4" width="14" height="12" rx="2"/><line x1="3" y1="8" x2="17" y2="8"/><line x1="8" y1="4" x2="8" y2="16"/></svg></div>
                    <span class="menu-text">Giao dịch</span>
                    <div class="arrow-icon"><svg width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" stroke="currentColor" stroke-width="1.3"><path d="M4 6l4 4 4-4"/></svg></div>
                </div>
                <div class="submenu" role="menu">
                    <div class="submenu-item" role="menuitem"><div class="icon-container"><svg width="20" height="20" fill="none" xmlns="http://www.w3.org/2000/svg" stroke-width="1.5"><path d="M4 12h12M12 8l4 4-4 4"/></svg></div>Đơn bán hàng</div>
                    <div class="submenu-item" role="menuitem"><div class="icon-container"><svg width="20" height="20" fill="none" xmlns="http://www.w3.org/2000/svg" stroke-width="1.5"><path d="M16 12H4M8 8l-4 4 4 4"/></svg></div>Đơn nhập hàng</div>
                </div>

                <div class="menu-item" role="menuitem">
                    <div class="icon-container"><svg width="20" height="20" fill="none" xmlns="http://www.w3.org/2000/svg" stroke="currentColor" stroke-width="1.8"><rect x="2" y="5" width="16" height="10" rx="3"/><path d="M6 5v-2h8v2"/></svg></div>
                    <span class="menu-text">Báo cáo</span>
                    <div class="arrow-icon"><svg width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" stroke="currentColor" stroke-width="1.3"><path d="M4 6l4 4 4-4"/></svg></div>
                </div>
                <div class="submenu" role="menu">
                    <div class="submenu-item" role="menuitem"><div class="icon-container"><svg width="20" height="20" fill="none" xmlns="http://www.w3.org/2000/svg" stroke-width="1.5"><path d="M18 20V10M12 20V4M6 20V14"/></svg></div>Báo cáo cuối ngày</div>
                    <div class="submenu-item" role="menuitem"><div class="icon-container"><svg width="20" height="20" fill="none" xmlns="http://www.w3.org/2000/svg" stroke-width="1.5"><path d="M10 3.33v13.34M15 8.33v8.34M5 13.33v3.34"/></svg></div>Báo cáo lợi nhuận</div>
                </div>

                <div class="menu-item active" role="menuitem">
                    <div class="icon-container"><svg width="20" height="20" fill="none" xmlns="http://www.w3.org/2000/svg" stroke="currentColor" stroke-width="1.5"><circle cx="10" cy="6" r="4"/><path d="M4 14c0-3 12-3 12 0H4z"/><line x1="6" y1="18" x2="14" y2="18"/></svg></div>
                    <span class="menu-text">Thông tin cá nhân</span>
                    <div class="arrow-icon"><svg width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" stroke="currentColor" stroke-width="1.3"><path d="M4 6l4 4 4-4"/></svg></div>
                </div>
                <div class="submenu" role="menu">
                    <div class="submenu-item active" role="menuitem">
                        <div class="icon-container"><svg width="20" height="20" fill="none" xmlns="http://www.w3.org/2000/svg" stroke-width="1.5"><circle cx="8" cy="8" r="6"/><line x1="13" y1="13" x2="18" y2="18"/></svg></div>Xem thông tin cá nhân
                    </div>
                    <div class="submenu-item" role="menuitem">
                        <div class="icon-container"><svg width="20" height="20" fill="none" xmlns="http://www.w3.org/2000/svg" stroke-width="1.5"><rect x="5" y="9" width="10" height="7" rx="2"/><path d="M7 9V7a3 3 0 0 1 6 0v2"/></svg></div>Đổi mật khẩu
                    </div>
                    <div class="submenu-item" role="menuitem">
                        <div class="icon-container"><svg width="20" height="20" fill="none" xmlns="http://www.w3.org/2000/svg" stroke-width="1.5"><path d="M16 12v3a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v3"/><polyline points="10 9 15 9 15 15"/><line x1="15" y1="9" x2="10" y2="14"/></svg></div>Đăng xuất
                    </div>
                </div>
            </div>
        </nav>

        <main class="main-content" role="main">
            <form action="editProfile" method="post" enctype="multipart/form-data" style="display: flex; flex-direction: column; width: 100%; height: 100%;">
                <header class="header-container">
                    <h1 class="header-title">Sửa thông tin cá nhân</h1>
                </header>

                <section style="flex-grow: 1; background: #F2F2F2; overflow-y: auto; padding: 24px;">
                    <div style="display: flex; gap: 24px; flex-wrap: wrap;">
                        <div style="flex: 0 0 170px; display: flex; flex-direction: column; gap: 16px;">
                            <img style="width: 170px; height: 170px; border-radius: 12px; object-fit: cover;" src="<c:choose><c:when test='${not empty user.avatarUrl}'>${user.avatarUrl}</c:when><c:otherwise>https://placehold.co/170x170</c:otherwise></c:choose>" alt="Profile Image" />
                            <label for="upload-photo" style="width: 170px; padding: 10px; background: #E5E5E5; border-radius: 12px; text-align: center; color: #4D4D4D; cursor: pointer;">Chọn ảnh</label>
                            <input type="file" id="upload-photo" name="profileImage" style="display: none;">
                        </div>
                        <div style="flex: 1; display: flex; flex-direction: column; gap: 24px;">
                            <div style="background: white; border-radius: 12px; padding: 24px; display: flex; flex-direction: column; gap: 24px;">
                                <div style="font-size: 20px; font-family: Adamina, serif;">Thông tin khởi tạo</div>
                                <div style="display: flex; gap: 40px; flex-wrap: wrap;">
                                    <div style="flex: 1; display: flex; align-items: center; gap: 20px; min-width: 350px;">
                                        <div style="width: 120px;">Mã nhân viên</div>
                                        <div class="input-container" style="flex: 1;"><div class="form-input view-only-field">${user.employeeId}</div></div>
                                    </div>
                                    <div style="flex: 1; display: flex; align-items: center; gap: 20px; min-width: 350px;">
                                        <div style="width: 120px;">Số điện thoại</div>
                                        <div class="input-container" style="flex: 1;"><input type="text" name="phone" class="form-input" value="${user.phone}" placeholder="Nhập số điện thoại"></div>
                                    </div>
                                </div>
                                <div style="display: flex; gap: 20px; align-items: center;">
                                    <div style="width: 120px;">Họ và Tên</div>
                                    <div style="flex: 1; display: flex; gap: 16px;">
                                        <div class="input-container" style="flex:1;"><input type="text" name="lastName" class="form-input" value="${user.lastName}" placeholder="Họ"></div>
                                        <div class="input-container" style="flex:1;"><input type="text" name="middleName" class="form-input" value="${user.middleName}" placeholder="Tên đệm"></div>
                                        <div class="input-container" style="flex:1;"><input type="text" name="firstName" class="form-input" value="${user.firstName}" placeholder="Tên"></div>
                                    </div>
                                </div>
                            </div>
                            <div style="background: white; border-radius: 12px; padding: 24px; display: flex; flex-direction: column; gap: 32px;">
                                <div style="font-size: 20px;">Thông tin công việc</div>
                                <div style="display: flex; gap: 40px; flex-wrap: wrap;">
                                    <div style="flex: 1; display: flex; align-items: center; gap: 20px; min-width: 350px;">
                                        <div style="width: 120px;">Phòng làm việc</div>
                                        <div class="input-container" style="flex: 1;"><div class="form-input view-only-field">${user.department}</div></div>
                                    </div>
                                    <div style="flex: 1; display: flex; align-items: center; gap: 20px; min-width: 350px;">
                                        <div style="width: 120px;">Chức vụ</div>
                                        <div class="input-container" style="flex: 1;"><div class="form-input view-only-field">${user.position}</div></div>
                                    </div>
                                </div>
                                <div style="display: flex; gap: 20px; width: 100%;">
                                    <div style="width: 120px;">Ghi chú</div>
                                    <div class="input-container" style="flex: 1; height: 113px;"><textarea name="note" class="form-textarea" placeholder="Nhập ghi chú...">${user.note}</textarea></div>
                                </div>
                            </div>
                            <div style="background: white; border-radius: 12px; padding: 24px; display: flex; flex-direction: column; gap: 24px;">
                                <div style="font-size: 20px;">Thông tin cá nhân</div>
                                <div style="display: flex; gap: 40px; flex-wrap: wrap;">
                                    <div style="flex: 1; display: flex; flex-direction: column; gap: 24px; min-width: 350px;">
                                        <div style="display: flex; align-items: center; gap: 20px;">
                                            <div style="width: 120px;">Số CMND/CCCD</div>
                                            <div class="input-container"><input type="text" name="idCard" class="form-input" value="${user.idCard}" placeholder="Nhập số CMND/CCCD"></div>
                                        </div>
                                        <div style="display: flex; align-items: center; gap: 20px;">
                                            <div style="width: 120px;">Ngày sinh</div>
                                            <div class="input-container"><input type="date" name="dob" class="form-input" value="${user.dob}"></div>
                                        </div>
                                    </div>
                                    <div style="flex: 1; display: flex; flex-direction: column; gap: 16px; min-width: 350px;">
                                        <div>Giới tính</div>
                                        <div style="display: flex; gap: 40px;">
                                            <label style="display: flex; align-items: center; gap: 8px; cursor: pointer;">
                                                <input type="radio" name="gender" value="Nam" ${user.gender == 'Nam' ? 'checked' : ''}> Nam
                                            </label>
                                            <label style="display: flex; align-items: center; gap: 8px; cursor: pointer;">
                                                <input type="radio" name="gender" value="Nữ" ${user.gender == 'Nữ' ? 'checked' : ''}> Nữ
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div style="background: white; border-radius: 12px; padding: 24px; display: flex; flex-direction: column; gap: 24px;">
                                <div style="font-size: 20px;">Thông tin liên hệ</div>
                                <div style="display: flex; flex-direction: column; gap: 24px;">
                                    <div style="display: flex; gap: 40px; flex-wrap: wrap;">
                                        <div style="flex: 1; display: flex; align-items: center; gap: 20px; min-width: 350px;">
                                            <div style="width: 120px;">Địa chỉ</div>
                                            <div class="input-container" style="flex: 1;"><input type="text" name="address" class="form-input" value="${user.address}" placeholder="Nhập địa chỉ"></div>
                                        </div>
                                        <div style="flex: 1; display: flex; align-items: center; gap: 20px; min-width: 350px;">
                                            <div style="width: 150px;">Tỉnh/TP_Quận/Huyện</div>
                                            <div class="input-container" style="flex: 1;"><input type="text" name="cityDistrict" class="form-input" value="${user.cityDistrict}" placeholder="Nhập quận/huyện"></div>
                                        </div>
                                    </div>
                                    <div style="display: flex; gap: 40px; flex-wrap: wrap;">
                                        <div style="flex: 1; display: flex; align-items: center; gap: 20px; min-width: 350px;">
                                            <div style="width: 120px;">Phường/Xã</div>
                                            <div class="input-container" style="flex: 1;"><input type="text" name="ward" class="form-input" value="${user.ward}" placeholder="Nhập phường/xã"></div>
                                        </div>
                                        <div style="flex: 1; display: flex; align-items: center; gap: 20px; min-width: 350px;">
                                            <div style="width: 150px;">MXH (kèm link)</div>
                                            <div class="input-container" style="flex: 1;"><input type="text" name="socialLink" class="form-input" value="${user.socialLink}" placeholder="Nhập link mạng xã hội"></div>
                                        </div>
                                    </div>
                                    <div style="display: flex; gap: 40px; flex-wrap: wrap;">
                                         <div style="flex: 1; display: flex; align-items: center; gap: 20px; min-width: 350px;">
                                            <div style="width: 120px;">Email</div>
                                            <div class="input-container" style="flex: 1;"><div class="form-input view-only-field">${user.email}</div></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <div style="height: 70px; padding: 16px 32px; background: #ffffff; border-top: 1px solid #E5E5E5; display: flex; justify-content: flex-end; align-items: center; gap: 16px; position: sticky; bottom: 0;">
                    <button type="reset" style="padding: 10px 16px; background: white; border: 1px solid #A4A4A4; border-radius: 8px; cursor: pointer;">Hủy</button>
                    <button type="submit" style="padding: 10px 16px; background: #298e94; color: white; border: none; border-radius: 8px; cursor: pointer;">Lưu thông tin</button>
                </div>
            </form>
        </main>
    </div>

    <script>
        // Script cho nút thu gọn Sidebar
        document.getElementById('toggleSidebarBtn').addEventListener('click', () => {
            document.getElementById('sidebar').classList.toggle('collapsed');
        });

        // Script LINH HOẠT cho các Submenu
        document.querySelectorAll('.menu-item').forEach(menuItem => {
            if (menuItem.querySelector('.arrow-icon')) {
                menuItem.addEventListener('click', (e) => {
                    e.preventDefault();
                    const submenu = menuItem.nextElementSibling;
                    const isOpening = !menuItem.classList.contains('open');
                    
                    document.querySelectorAll('.menu-item.open').forEach(openItem => {
                        if (openItem !== menuItem) {
                            openItem.classList.remove('open');
                            const otherSubmenu = openItem.nextElementSibling;
                            if (otherSubmenu && otherSubmenu.classList.contains('submenu')) {
                                otherSubmenu.classList.remove('active');
                            }
                        }
                    });
                    
                    if (isOpening) {
                        menuItem.classList.add('open');
                        if (submenu && submenu.classList.contains('submenu')) {
                            submenu.classList.add('active');
                        }
                    }
                });
            }
        });

        // Xử lý trạng thái active ban đầu khi tải trang
        document.addEventListener('DOMContentLoaded', function() {
            const activeMenuItem = document.querySelector('.menu-item.active');
            if (activeMenuItem && activeMenuItem.querySelector('.arrow-icon')) {
                activeMenuItem.classList.add('open');
                const activeSubmenu = activeMenuItem.nextElementSibling;
                if (activeSubmenu && activeSubmenu.classList.contains('submenu')) {
                    activeSubmenu.classList.add('active');
                }
            }
        });
    </script>
</body>
</html>