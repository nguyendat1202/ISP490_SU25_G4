/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
/*
 * File: mainMenu.js - Đã cập nhật đầy đủ chức năng
 */
document.addEventListener('DOMContentLoaded', function() {

    // --- PHẦN 1: CODE XỬ LÝ THU GỌN TOÀN BỘ SIDEBAR (ĐÃ CÓ) ---
    const toggleBtn = document.querySelector('.sidebar .toggle-btn');
    const appContainer = document.querySelector('.app-container');

    if (toggleBtn && appContainer) {
        toggleBtn.addEventListener('click', function() {
            appContainer.classList.toggle('sidebar-collapsed');

            // Khi thu gọn menu chính, đóng tất cả các menu con đang mở
            if (appContainer.classList.contains('sidebar-collapsed')) {
                const openDropdowns = document.querySelectorAll('.nav-item-dropdown.open');
                openDropdowns.forEach(dropdown => {
                    dropdown.classList.remove('open');
                });
            }
        });
    }

    // --- PHẦN 2: CODE MỚI ĐỂ XỬ LÝ CLICK MỞ/ĐÓNG DROPDOWN ---
    // Tìm tất cả các thẻ <a> là mục cha của dropdown
    const dropdownLinks = document.querySelectorAll('.sidebar-nav .nav-item-dropdown > a');

    dropdownLinks.forEach(link => {
        link.addEventListener('click', function(event) {
            // Ngăn hành vi mặc định của thẻ <a> (nhảy trang khi href="#")
            event.preventDefault();

            // Tìm đến thẻ <li> cha của thẻ <a> vừa được click
            const parentLi = this.parentElement;

            // Thêm hoặc xóa class 'open' trên thẻ <li> đó
            // CSS sẽ dựa vào class 'open' này để hiện hoặc ẩn sub-menu
            parentLi.classList.toggle('open');
        });
    });

});


