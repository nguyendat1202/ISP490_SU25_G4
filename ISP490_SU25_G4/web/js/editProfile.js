/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
document.addEventListener('DOMContentLoaded', function() {
    const btnChooseAvatar = document.getElementById('btnChooseAvatar');
    const avatarUpload = document.getElementById('avatarUpload');
    const avatarPreview = document.getElementById('avatarPreview');

    // Kiểm tra xem các phần tử có tồn tại không trước khi thêm sự kiện
    if (btnChooseAvatar && avatarUpload && avatarPreview) {
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
    }
});



