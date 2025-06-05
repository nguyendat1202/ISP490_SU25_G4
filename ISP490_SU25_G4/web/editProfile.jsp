
<%-- 
    Document   : viewProfile
    Created on : Jun 4, 2025, 11:03:31 AM
    Author     : Datnt
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <title>Sửa thông tin</title>
    <style>
        :root {
            --base-white: #ffffff;
            --bg-default: #f2f2f2;
            --color-primary: #298e94;
            --color-text-primary: #4d4d4d;
            --color-text-secondary: #666666;
            --color-text-tertiary: #a4a4a4;
            --icon-primary: #4D4D4D;
            --error-red: #EB3B31;
        }
        * {
            box-sizing: border-box;
        }
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: 'Actor', sans-serif;
            background: var(--bg-default);
        }
        .container {
            width: 100%;
            height: 100%;
            display: flex;
        }
        .sidebar {
            width: 308px;
            align-self: stretch;
            padding: 16px 16px;
            background: var(--base-white);
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.08);
            display: flex;
            flex-direction: column;
            gap: 16px;
            transition: width 0.3s ease, padding 0.3s ease;
        }
        .sidebar.collapsed {
            width: 60px !important;
            padding: 16px 8px !important;
            overflow: visible;
        }
        .logo-container {
            align-self: stretch;
            height: 68px;
            padding: 12px 20px;
            background: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            transition: padding 0.3s ease;
        }
        .sidebar.collapsed .logo-container {
            padding: 12px 8px;
        }
        .logo-image {
            width: 65px;
            height: 65px;
            background-image: url('https://placehold.co/65x65');
            background-repeat: no-repeat;
            background-position: center;
            background-size: contain;
            display: flex;
            justify-content: flex-start;
            align-items: flex-end;
            gap: 4px;
            transition: opacity 0.3s ease;
        }
        .sidebar.collapsed .logo-image {
            opacity: 0;
            pointer-events: none;
            user-select: none;
        }
        .logo-icon {
            width: 28px;
            height: 28px;
            padding: 0 8px;
            background: rgba(41, 142, 148, 0.20);
            border-radius: 6px;
            outline: 1px #298E94 solid;
            outline-offset: -1px;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 4px;
            cursor: pointer;
        }
        .logo-icon-inner {
            width: 16px;
            height: 16px;
        }
        .menu-items {
            width: 100%;
            padding: 0;
            flex: 1 1 auto;
            display: flex;
            flex-direction: column;
            gap: 16px;
            transition: padding 0.3s ease;
        }
        .sidebar.collapsed .menu-items {
            padding-left: 4px;
        }
        .menu-item {
            display: flex;
            align-items: center;
            gap: 8px;
            padding: 10px 12px;
            border-radius: 8px;
            background: white;
            font-size: 14px;
            font-family: Actor, sans-serif;
            font-weight: 400;
            color: var(--color-text-tertiary);
            cursor: pointer;
            transition: color 0.3s ease, background 0.3s ease;
            width: 100%;
            height: 44px;
            white-space: nowrap;
            position: relative;
        }
        .menu-item:hover {
            color: var(--color-primary);
            background: #E6F4F5;
        }
        .menu-items > .menu-item:first-child {
            color: var(--color-text-tertiary);
        }
        .menu-items > .menu-item:first-child .icon-container svg {
            stroke: currentColor !important;
            width: 26px !important;
            height: 26px !important;
        }
        .menu-item:hover .icon-container svg {
            stroke: var(--color-primary);
        }
        .menu-item.active {
            color: var(--color-primary);
            font-weight: 600;
            background: #D0EBEF;
        }
        .menu-item.active .icon-container svg {
            stroke: var(--color-primary);
        }
        .icon-container {
            width: 24px;
            height: 24px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .menu-text {
            transition: opacity 0.3s ease;
        }
        .sidebar.collapsed .menu-text {
            opacity: 0;
            width: 0;
            overflow: hidden;
            pointer-events: none;
            user-select: none;
        }
        .sidebar-footer {
            align-self: stretch;
            height: 68px;
            padding: 12px 20px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .sidebar-footer-text {
            flex: 1 1 0;
            color: var(--color-text-secondary);
            font-size: 14px;
            font-family: Actor, sans-serif;
            font-weight: 400;
            line-height: 18px;
            word-wrap: break-word;
            transition: opacity 0.3s ease;
        }
        .sidebar.collapsed .sidebar-footer-text {
            opacity: 0;
            pointer-events: none;
            user-select: none;
        }
        main.main-content {
            flex-grow: 1;
            align-self: stretch;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            align-items: flex-start;
            transition: width 0.3s ease;
            width: calc(100% - 308px);
        }
        .sidebar.collapsed + main.main-content {
            width: calc(100% - 60px);
        }
        .header-container {
            align-self: stretch;
            height: 84px;
            padding: 16px 24px;
            background: var(--base-white);
            box-shadow: 0 28px 28px rgba(0, 0, 0, 0.03);
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            gap: 16px;
        }
        .header-title {
            flex: 1 1 0;
            color: var(--color-text-primary);
            font-size: 20px;
            font-family: Adamina, serif;
            font-weight: 400;
            line-height: 24px;
            word-wrap: break-word;
        }
        .notification-container {
            position: relative;
            width: 48px;
            padding: 14px;
            border-radius: 8px;
            outline: 1px #B2D6D9 solid;
            outline-offset: -1px;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 8px;
            cursor: pointer;
        }
        .notification-icon svg {
            stroke: var(--icon-primary);
            stroke-width: 1.5;
            stroke-linecap: round;
            stroke-linejoin: round;
        }
        .notification-badge {
            position: absolute;
            top: 8px;
            right: 8px;
            width: 14px;
            height: 14px;
            background: var(--error-red);
            border-radius: 50%;
            color: white;
            font-size: 10px;
            font-weight: 600;
            font-family: SVN-Gilroy, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            user-select: none;
            line-height: 14px;
        }
        .content-wrapper {
            align-self: stretch;
            flex: 1 1 0;
            padding: 24px;
            background: var(--bg-default);
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            align-items: flex-start;
            gap: 24px;
        }
        .content-inner {
            align-self: stretch;
            flex: 1 1 0;
            padding: 24px;
            background: var(--base-white);
            box-shadow: 0 28px 28px rgba(0, 0, 0, 0.03);
            border-radius: 12px;
        }
        .submenu {
            display: none;
            flex-direction: column;
            gap: 4px;
            padding-left: 32px;
            margin-top: 8px;
        }
        .submenu-item.active {
            background: #D0EBEF;
            color: var(--color-primary);
        }
        .submenu-item.active .icon-container svg {
            stroke: var(--color-primary) !important;
        }
        .submenu.active {
            display: flex;
        }
        .submenu-item {
            display: flex;
            align-items: center;
            gap: 8px;
            padding: 8px 12px;
            border-radius: 6px;
            background: var(--base-white);
            color: var(--color-text-tertiary);
            font-size: 14px;
            font-family: Actor, sans-serif;
            font-weight: 400;
            cursor: pointer;
            user-select: none;
            white-space: nowrap;
            height: 38px;
            border: none;
            transition: background 0.3s ease, color 0.3s ease;
        }
        .submenu-item .icon-container svg {
            stroke: var(--color-text-tertiary) !important;
        }
        .submenu-item:hover {
            background: #E6F4F5;
            color: var(--color-primary);
        }
        .menu-item .arrow-icon {
            margin-left: auto;
            width: 20px;
            height: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .menu-item.open .arrow-icon svg {
            transform: rotate(180deg);
            transition: transform 0.3s ease;
        }
        .icon-modern {
            width: 20px;
            height: 20px;
            color: black;
        }
        .form-input {
            color: black;
            font-size: 16px;
            font-family: Adamina, sans-serif;
            font-weight: 400;
            line-height: 18px;
            word-wrap: break-word;
            border: none;
            background: transparent;
            width: 100%;
            padding: 0;
        }
        .form-input:focus {
            outline: none;
        }
        .input-container {
            width: 100%;
            padding-top: 10px;
            padding-bottom: 10px;
            border-bottom: 1px #E5E5E5 solid;
            justify-content: flex-start;
            align-items: center;
            gap: 10px;
            display: flex;
        }
         .form-select {
            color: black;
            font-size: 16px;
            font-family: Adamina, sans-serif;
            font-weight: 400;
            line-height: 18px;
            border: none;
            background: transparent;
            width: 100%;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            cursor: pointer;
        }
        .select-container {
            width: 247px;
            padding-top: 10px;
            padding-bottom: 10px;
            border-bottom: 1px #E5E5E5 solid;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .form-textarea {
            width: 100%;
            height: 90px;
            border: none;
            background: transparent;
            font-size: 16px;
            font-family: 'SVN-Gilroy', sans-serif;
            font-weight: 400;
            resize: none;
        }
        .form-textarea:focus {
            outline: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <nav id="sidebar" class="sidebar" role="navigation" aria-label="Sidebar Navigation">
            <div class="logo-container">
                <div class="logo-image" title="Logo DPCRM"></div>
                <div id="toggleSidebarBtn" class="logo-icon" role="button" aria-label="Toggle menu" tabindex="0">
                    <svg class="logo-icon-inner" width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg" stroke="var(--color-primary)" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <line x1="3" y1="6" x2="17" y2="6"/>
                        <line x1="3" y1="10" x2="17" y2="10"/>
                        <line x1="3" y1="14" x2="17" y2="14"/>
                    </svg>
                </div>
            </div>
            <div class="menu-items">
                <div class="menu-item " role="menuitem" aria-current="page">
                    <div class="icon-container" aria-hidden="true">
                        <svg width="10" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg" stroke="var(--color-primary)" stroke-width="1.5">
                            <rect x="2" y="2" width="6" height="6" stroke="var(--color-primary)" stroke-width="1.5" fill="none"/>
                            <rect x="12" y="2" width="6" height="6" stroke="var(--color-primary)" stroke-width="1.5" fill="none"/>
                            <rect x="2" y="12" width="6" height="6" stroke="var(--color-primary)" stroke-width="1.5" fill="none"/>
                            <rect x="12" y="12" width="6" height="6" stroke="var(--color-primary)" stroke-width="1.5" fill="none"/>
                        </svg>
                    </div>
                    <span class="menu-text">Tổng quản</span>
                </div>
                <div class="menu-item" role="menuitem">
                    <div class="icon-container" aria-hidden="true">
                        <svg width="20" height="20" fill="none" xmlns="http://www.w3.org/2000/svg" stroke="var(--icon-primary)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                            <circle cx="10" cy="6" r="4"/>
                            <path d="M4 18c0-3 12-3 12 0"/>
                        </svg>
                    </div>
                    <span class="menu-text">Khách hàng</span>
                </div>
                <div class="menu-item" role="menuitem">
                    <div class="icon-container" aria-hidden="true">
                        <svg width="20" height="20" fill="none" xmlns="http://www.w3.org/2000/svg" stroke="var(--icon-primary)" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
                            <rect x="4" y="6" width="12" height="14" rx="2" ry="2"/>
                            <rect x="7" y="3" width="6" height="5" rx="1" ry="1"/>
                        </svg>
                    </div>
                    <span class="menu-text">Hàng hóa</span>
                </div>
                <div class="menu-item" role="menuitem">
                    <div class="icon-container" aria-hidden="true">
                        <svg width="20" height="20" fill="none" xmlns="http://www.w3.org/2000/svg" stroke="var(--icon-primary)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                            <rect x="3" y="4" width="14" height="12" rx="2" ry="2"/>
                            <line x1="3" y1="8" x2="17" y2="8" />
                            <line x1="8" y1="4" x2="8" y2="16" />
                        </svg>
                    </div>
                    <span class="menu-text">Giao dịch</span>
                    <div class="arrow-icon" aria-hidden="true">
                        <svg width="20" height="20" fill="none" xmlns="http://www.w3.org/2000/svg" stroke="var(--icon-primary)" stroke-width="1.3" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M5 12.5l5-5 5 5"/>
                        </svg>
                    </div>
                </div>
                <div class="menu-item" role="menuitem">
                    <div class="icon-container" aria-hidden="true">
                        <svg width="20" height="20" fill="none" xmlns="http://www.w3.org/2000/svg" stroke="var(--icon-primary)" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
                            <rect x="2" y="5" width="16" height="10" rx="3" ry="3"/>
                            <path d="M6 5v-2h8v2"/>
                        </svg>
                    </div>
                    <span class="menu-text">Báo cáo</span>
                    <div class="arrow-icon" aria-hidden="true">
                        <svg width="20" height="20" fill="none" xmlns="http://www.w3.org/2000/svg" stroke="var(--icon-primary)" stroke-width="1.3" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M5 12.5l5-5 5 5"/>
                        </svg>
                    </div>
                </div>
                <div id="personalInfoMenu" class="menu-item active open" role="menuitem" aria-expanded="true" tabindex="0">
                    <div class="icon-container" aria-hidden="true">
                        <svg width="20" height="20" fill="none" xmlns="http://www.w3.org/2000/svg" stroke="var(--icon-primary)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                            <circle cx="10" cy="6" r="4"/>
                            <path d="M4 14c0-3 12-3 12 0H4z"/>
                            <line x1="6" y1="18" x2="14" y2="18"/>
                        </svg>
                    </div>
                    <span class="menu-text">Thông tin cá nhân</span>
                    <div class="arrow-icon" aria-hidden="true">
                        <svg width="20" height="20" fill="none" xmlns="http://www.w3.org/2000/svg" stroke="var(--icon-primary)" stroke-width="1.3" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M5 12.5l5-5 5 5"/>
                        </svg>
                    </div>
                </div>
                <div id="personalInfoSubmenu" class="submenu active" role="menu">
                    <div class="submenu-item active" role="menuitem" tabindex="0">
                        <div class="icon-container" aria-hidden="true">
                            <svg width="20" height="20" fill="none" xmlns="http://www.w3.org/2000/svg" stroke="var(--color-primary)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                                <circle cx="8" cy="8" r="6"/>
                                <line x1="13" y1="13" x2="18" y2="18"/>
                            </svg>
                        </div>
                        Xem thông tin cá nhân
                    </div>
                    <div class="submenu-item" role="menuitem" tabindex="0">
                        <div class="icon-container" aria-hidden="true">
                            <svg width="20" height="20" fill="none" xmlns="http://www.w3.org/2000/svg" stroke="var(--color-text-tertiary)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                                <rect x="5" y="9" width="10" height="7" rx="2"/>
                                <path d="M7 9V7a3 3 0 0 1 6 0v2"/>
                            </svg>
                        </div>
                        Đổi mật khẩu
                    </div>
                    <div class="submenu-item" role="menuitem" tabindex="0">
                        <div class="icon-container" aria-hidden="true">
                            <svg width="20" height="20" fill="none" xmlns="http://www.w3.org/2000/svg" stroke="var(--color-text-tertiary)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M16 12v3a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v3"/>
                                <polyline points="10 9 15 9 15 15"/>
                                <line x1="15" y1="9" x2="10" y2="14"/>
                            </svg>
                        </div>
                        Đăng xuất
                    </div>
                </div>
            </div>
            <div class="sidebar-footer">
                <div class="sidebar-footer-text">
                    © 2025 DPCRM from ISP490_SU25_GR4
                </div>
            </div>
        </nav>

        <main class="main-content" role="main">
            <form action="editProfileController" method="post" enctype="multipart/form-data" style="display: flex; flex-direction: column; width: 100%; height: 100%;">
                <header class="header-container">
                    <h1 class="header-title">Sửa thông tin cá nhân</h1>
                    <div class="notification-container" title="Thông báo" role="button" aria-label="Thông báo mới 4">
                        <div class="notification-icon" aria-hidden="true">
                            <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M10 2a4 4 0 0 0-4 4v4c0 1.5-1 2-1 2h10s-1-.5-1-2V6a4 4 0 0 0-4-4z" stroke="var(--icon-primary)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M7 17h6" stroke="var(--icon-primary)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                            </svg>
                        </div>
                        <div class="notification-badge">4</div>
                    </div>
                </header>

                <section style="width: 100%; flex-grow: 1; position: relative; background: #F2F2F2; overflow-y: auto; padding: 24px;">
                    <div style="display: flex; gap: 24px; flex-wrap: wrap;">
                        <div style="flex: 0 0 170px; display: flex; flex-direction: column; gap: 16px;">
                            <img style="width: 170px; height: 170px; border-radius: 12px" src="https://placehold.co/170x170" alt="Profile Image" />
                            <label for="upload-photo" style="width: 170px; padding: 10px; background: #E5E5E5; border-radius: 12px; text-align: center; color: #4D4D4D; font-size: 14px; font-family: SVN-Gilroy; font-weight: 700; cursor: pointer;">
                                Chọn ảnh
                            </label>
                            <input type="file" id="upload-photo" name="profileImage" style="display: none;">
                        </div>

                        <div style="flex: 1; display: flex; flex-direction: column; gap: 24px;">
                            <div style="width: 100%; background: white; border-radius: 12px; outline: 1px #E5E5E5 solid; padding: 24px; display: flex; flex-direction: column; gap: 24px;">
                                <div style="color: black; font-size: 20px; font-family: Adamina; font-weight: 400;">Thông tin khởi tạo</div>
                                <div style="display: flex; gap: 40px; flex-wrap: wrap;">
                                    <div style="flex: 1; display: flex; align-items: center; gap: 20px; min-width: 350px;">
                                        <div style="width: 120px; color: black; font-size: 16px; font-family: Adamina; font-weight: 400;">Mã nhân viên</div>
                                        <div class="input-container" style="flex: 1;">
                                            <div style="color: #a4a4a4; font-size: 16px; font-family: Adamina; font-weight: 400; line-height: 18px;">Mã nhân viên tự động</div>
                                        </div>
                                    </div>
                                    <div style="flex: 1; display: flex; align-items: center; gap: 20px; min-width: 350px;">
                                        <div style="width: 120px; color: black; font-size: 16px; font-family: Adamina; font-weight: 400;">Số điện thoại</div>
                                        <div class="input-container" style="flex: 1;">
                                            <input type="text" name="phone" class="form-input" value="" placeholder="Nhập số điện thoại">
                                        </div>
                                    </div>
                                </div>
                                <div style="display: flex; gap: 20px; align-items: center; flex-wrap: nowrap;">
                                    <div style="width: 120px; color: black; font-size: 16px; font-family: Adamina; font-weight: 400;">Họ và Tên</div>
                                    <div style="flex: 1; display: flex; gap: 16px;">
                                        <div class="input-container" style="flex: 1;">
                                            <input type="text" name="lastName" class="form-input" value="" placeholder="Họ">
                                        </div>
                                        <div class="input-container" style="flex: 1;">
                                            <input type="text" name="middleName" class="form-input" value="" placeholder="Tên đệm">
                                        </div>
                                        <div class="input-container" style="flex: 1;">
                                            <input type="text" name="firstName" class="form-input" value="" placeholder="Tên">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div style="width: 100%; background: white; border-radius: 12px; outline: 1px #E5E5E5 solid; padding: 24px; display: flex; flex-direction: column; gap: 32px;">
                                <div style="color: black; font-size: 20px; font-family: 'SVN-Gilroy'; font-weight: 500;">Thông tin công việc</div>
                                <div style="display: flex; gap: 40px; flex-wrap: wrap; align-items: flex-start;">
                                     <div style="flex: 1; display: flex; align-items: center; gap: 20px;">
                                        <div style="width: 120px; color: black; font-size: 16px; font-family: Adamina; font-weight: 400;">Phòng làm việc</div>
                                        <div class="select-container" style="flex: 1;">
                                            <select name="department" class="form-select">
                                                <option value="" disabled selected>Chọn phòng làm việc</option>
                                                <option value="CSKH">Phòng CSKH</option>
                                                <option value="KyThuat">Phòng kĩ thuật</option>
                                            </select>
                                            <i data-lucide="chevron-down" class="icon-modern"></i>
                                        </div>
                                    </div>
                                    <div style="flex: 1; display: flex; align-items: center; gap: 20px;">
                                        <div style="width: 120px; color: black; font-size: 16px; font-family: Adamina; font-weight: 400;">Chức vụ</div>
                                         <div class="select-container" style="flex: 1;">
                                            <select name="position" class="form-select">
                                                <option value="" disabled selected>Chọn chức vụ</option>
                                                <option value="NhanVienCSKH">Nhân viên CSKH</option>
                                                <option value="NhanVienKyThuat">Nhân viên kĩ thuật</option>
                                            </select>
                                            <i data-lucide="chevron-down" class="icon-modern"></i>
                                        </div>
                                    </div>
                                </div>
                                <div style="display: flex; gap: 20px; width: 100%;">
                                    <div style="width: 120px; color: black; font-size: 16px; font-family: 'SVN-Gilroy'; font-weight: 500;">Ghi chú</div>
                                    <div class="input-container" style="flex: 1; height: 113px;">
                                        <i data-lucide="sticky-note" class="icon-modern" style="align-self: flex-start;"></i>
                                        <textarea name="note" class="form-textarea" placeholder="Nhập ghi chú..."></textarea>
                                    </div>
                                </div>
                            </div>

                            <div style="width: 100%; background: white; border-radius: 12px; outline: 1px #E5E5E5 solid; padding: 24px; display: flex; flex-direction: column; gap: 24px;">
                                 <div style="color: black; font-size: 20px; font-family: 'SVN-Gilroy'; font-weight: 500;">Thông tin cá nhân</div>
                                 <div style="display: flex; gap: 40px; flex-wrap: wrap;">
                                    <div style="flex: 1; display: flex; flex-direction: column; gap: 24px; min-width: 350px;">
                                        <div style="display: flex; align-items: center; gap: 20px;">
                                            <div style="width: 120px; color: black; font-size: 16px; font-family: 'SVN-Gilroy'; font-weight: 500;">Số CMND/CCCD</div>
                                            <div class="input-container" style="flex: 1;">
                                                <input type="text" name="idCard" class="form-input" style="font-family: 'SVN-Gilroy', sans-serif;" value="" placeholder="Nhập số CMND/CCCD">
                                            </div>
                                        </div>
                                        <div style="display: flex; align-items: center; gap: 20px;">
                                            <div style="width: 120px; color: black; font-size: 16px; font-family: 'SVN-Gilroy'; font-weight: 500;">Ngày sinh</div>
                                            <div class="input-container" style="flex: 1;">
                                                <input type="date" name="dob" class="form-input" style="font-family: 'SVN-Gilroy', sans-serif;" value="">
                                            </div>
                                        </div>
                                    </div>
                                    <div style="flex: 1; display: flex; flex-direction: column; gap: 16px; min-width: 350px;">
                                        <div style="color: black; font-size: 16px; font-family: 'SVN-Gilroy'; font-weight: 500;">Giới tính</div>
                                        <div style="display: flex; gap: 40px;">
                                            <label style="display: flex; align-items: center; gap: 8px; cursor: pointer;">
                                                <input type="radio" name="gender" value="Nam">
                                                <span style="font-size: 16px; font-family: 'SVN-Gilroy'; font-weight: 500;">Nam</span>
                                            </label>
                                            <label style="display: flex; align-items: center; gap: 8px; cursor: pointer;">
                                                <input type="radio" name="gender" value="Nữ">
                                                <span style="font-size: 16px; font-family: 'SVN-Gilroy'; font-weight: 500;">Nữ</span>
                                            </label>
                                        </div>
                                    </div>
                                 </div>
                            </div>

                             <div style="width: 100%; background: white; border-radius: 12px; outline: 1px #E5E5E5 solid; padding: 24px; display: flex; flex-direction: column; gap: 24px;">
                                <div style="color: black; font-size: 20px; font-family: 'SVN-Gilroy'; font-weight: 500;">Thông tin liên hệ</div>
                                <div style="display: flex; flex-direction: column; gap: 24px;">
                                    <div style="display: flex; gap: 40px; flex-wrap: wrap;">
                                        <div style="flex: 1; display: flex; align-items: center; gap: 20px; min-width: 350px;">
                                            <div style="width: 120px; color: black; font-size: 16px; font-family: 'SVN-Gilroy'; font-weight: 500;">Địa chỉ</div>
                                            <div class="input-container" style="flex: 1;">
                                                <input type="text" name="address" class="form-input" style="font-family: 'SVN-Gilroy', sans-serif;" value="" placeholder="Nhập địa chỉ">
                                            </div>
                                        </div>
                                        <div style="flex: 1; display: flex; align-items: center; gap: 20px; min-width: 350px;">
                                            <div style="width: 150px; color: black; font-size: 16px; font-family: 'SVN-Gilroy'; font-weight: 500;">Tỉnh/TP_Quận/Huyện</div>
                                            <div class="input-container" style="flex: 1;">
                                                <input type="text" name="cityDistrict" class="form-input" style="font-family: 'SVN-Gilroy', sans-serif;" value="" placeholder="Nhập quận/huyện">
                                            </div>
                                        </div>
                                    </div>
                                     <div style="display: flex; gap: 40px; flex-wrap: wrap;">
                                        <div style="flex: 1; display: flex; align-items: center; gap: 20px; min-width: 350px;">
                                            <div style="width: 120px; color: black; font-size: 16px; font-family: 'SVN-Gilroy'; font-weight: 500;">Phường/Xã</div>
                                            <div class="input-container" style="flex: 1;">
                                                <input type="text" name="ward" class="form-input" style="font-family: 'SVN-Gilroy', sans-serif;" value="" placeholder="Nhập phường/xã">
                                            </div>
                                        </div>
                                        <div style="flex: 1; display: flex; align-items: center; gap: 20px; min-width: 350px;">
                                            <div style="width: 150px; color: black; font-size: 16px; font-family: 'SVN-Gilroy'; font-weight: 500;">MXH (kèm link)</div>
                                            <div class="input-container" style="flex: 1;">
                                                <input type="text" name="socialLink" class="form-input" style="font-family: 'SVN-Gilroy', sans-serif;" value="" placeholder="Nhập link mạng xã hội">
                                            </div>
                                        </div>
                                    </div>
                                    <div style="display: flex; gap: 40px; flex-wrap: wrap;">
                                         <div style="flex: 1; display: flex; align-items: center; gap: 20px; min-width: 350px;">
                                            <div style="width: 120px; color: black; font-size: 16px; font-family: 'SVN-Gilroy'; font-weight: 500;">Email</div>
                                            <div class="input-container" style="flex: 1;">
                                                <input type="email" name="email" class="form-input" style="font-family: 'SVN-Gilroy', sans-serif;" value="" placeholder="Nhập email">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <div style="width: 100%; height: 70px; padding: 16px 32px; background: #ffffff; border-top: 1px solid #E5E5E5; display: flex; justify-content: flex-end; align-items: center; gap: 16px; position: sticky; bottom: 0; z-index: 10;">
                    <button type="reset" style="height: 40px; padding: 0 16px; background: white; color: #4D4D4D; border: 1px solid #A4A4A4; border-radius: 8px; font-family: 'SVN-Gilroy'; font-size: 14px; font-weight: 500; cursor: pointer;">
                        Hủy
                    </button>
                    <button type="submit" style="height: 40px; padding: 0 16px; background: #298e94; color: white; border: none; border-radius: 8px; font-family: 'SVN-Gilroy'; font-size: 14px; font-weight: 500; cursor: pointer;">
                        Lưu thông tin
                    </button>
                </div>
            </form>
            </main>
    </div>

    <script>
        const toggleBtn = document.getElementById('toggleSidebarBtn');
        const sidebar = document.getElementById('sidebar');

        toggleBtn.addEventListener('click', () => {
            sidebar.classList.toggle('collapsed');
        });

        toggleBtn.addEventListener('keydown', e => {
            if (e.key === 'Enter' || e.key === ' ') {
                e.preventDefault();
                sidebar.classList.toggle('collapsed');
            }
        });

        const personalInfoMenu = document.getElementById('personalInfoMenu');
        const personalInfoSubmenu = document.getElementById('personalInfoSubmenu');
        const arrowIcon = personalInfoMenu.querySelector('.arrow-icon svg');

        personalInfoMenu.addEventListener('click', () => {
            const expanded = personalInfoMenu.getAttribute('aria-expanded') === 'true';
            personalInfoMenu.setAttribute('aria-expanded', !expanded);
            personalInfoMenu.classList.toggle('open');
            personalInfoSubmenu.classList.toggle('active');
            if(personalInfoMenu.classList.contains('open')){
                 arrowIcon.style.transform = 'rotate(180deg)';
            } else {
                 arrowIcon.style.transform = 'rotate(0deg)';
            }
        });

        personalInfoMenu.addEventListener('keydown', e => {
            if (e.key === 'Enter' || e.key === ' ') {
                e.preventDefault();
                personalInfoMenu.click();
            }
        });

        document.addEventListener('DOMContentLoaded', function() {
            if(personalInfoMenu.classList.contains('active')) {
                 personalInfoMenu.classList.add('open');
                 personalInfoSubmenu.classList.add('active');
                 arrowIcon.style.transform = 'rotate(180deg)';
            }
        });
    </script>
</body>
</html>
