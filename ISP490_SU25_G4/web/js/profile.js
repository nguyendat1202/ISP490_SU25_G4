/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
// File: js/profile.js

document.addEventListener('DOMContentLoaded', function() {

    const profileForm = document.getElementById('profileForm');
    const btnEdit = document.getElementById('btnEdit');
    const formElements = profileForm.querySelectorAll('input, select, textarea');

    const btnChooseAvatar = document.getElementById('btnChooseAvatar');
    const avatarUpload = document.getElementById('avatarUpload');
    const avatarPreview = document.getElementById('avatarPreview');

    // Chức năng nút Sửa/Lưu
    btnEdit.addEventListener('click', function() {
        if (btnEdit.textContent === 'Sửa thông tin') {
            // Chuyển sang chế độ chỉnh sửa
            formElements.forEach(el => {
                el.disabled = false;
            });
            btnEdit.textContent = 'Lưu thay đổi';
            btnEdit.classList.add('btn-save'); // Thêm class để có thể style riêng nếu muốn
            
            // Re-enable border for editing
            document.querySelectorAll('.form-group input, .form-group select, .form-group textarea').forEach(el => {
                 el.style.borderColor = 'var(--border-color)';
                 el.style.paddingLeft = '12px';
            });

        } else {
            // Chuyển sang chế độ xem (và gửi form)
            // TODO: Thêm logic để gửi dữ liệu form lên server (AJAX hoặc submit)
            alert('Đã gửi thông tin lên server!');

            formElements.forEach(el => {
                el.disabled = true;
            });
            btnEdit.textContent = 'Sửa thông tin';
            btnEdit.classList.remove('btn-save');

            // Disable border again
            document.querySelectorAll('.form-group input:disabled, .form-group select:disabled, .form-group textarea:disabled').forEach(el => {
                 el.style.borderColor = 'transparent';
                 el.style.paddingLeft = '0';
            });
        }
    });

    // Chức năng chọn ảnh
    btnChooseAvatar.addEventListener('click', function() {
        avatarUpload.click(); // Kích hoạt input file ẩn
    });

    avatarUpload.addEventListener('change', function(event) {
        if (event.target.files && event.target.files[0]) {
            const reader = new FileReader();
            reader.onload = function(e) {
                avatarPreview.src = e.target.result;
            }
            reader.readAsDataURL(event.target.files[0]);
        }
    });

});

