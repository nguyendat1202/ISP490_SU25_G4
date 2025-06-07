/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

document.addEventListener('DOMContentLoaded', function() {
    // ... (Các mã JS cũ của bạn ở đây) ...

    // --- Logic để đóng/mở sidebar ---
    const toggleButton = document.querySelector('.toggle-btn');
    const appContainer = document.querySelector('.app-container');

    if (toggleButton && appContainer) {
        toggleButton.addEventListener('click', function() {
            // Thêm hoặc xóa class 'sidebar-collapsed' trên container chính
            appContainer.classList.toggle('sidebar-collapsed');
        });
    }
});
