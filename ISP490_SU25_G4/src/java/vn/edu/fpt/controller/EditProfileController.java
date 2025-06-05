/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package vn.edu.fpt.controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import vn.edu.fpt.dao.UserDAO;
import vn.edu.fpt.model.User;

/**
 *
 * @author datnt
 */

@WebServlet(name = "EditProfileController", urlPatterns = {"/editProfile"})
@MultipartConfig
public class EditProfileController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditProfileController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditProfileController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    // 1. Set encoding UTF-8 để xử lý tiếng Việt
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");

        // Nếu người dùng chưa đăng nhập, không cho phép cập nhật
        if (currentUser == null) {
            response.sendRedirect("login.jsp"); // Chuyển đến trang đăng nhập
            return;
        }

        try {
            // 2. Lấy tất cả thông tin từ form
            String phone = request.getParameter("phone");
            String lastName = request.getParameter("lastName");
            String middleName = request.getParameter("middleName");
            String firstName = request.getParameter("firstName");
            String note = request.getParameter("note");
            String idCard = request.getParameter("idCard");
            Date dob = Date.valueOf(request.getParameter("dob")); // Chuyển String sang java.sql.Date
            String gender = request.getParameter("gender");
            String address = request.getParameter("address");
            String cityDistrict = request.getParameter("cityDistrict");
            String ward = request.getParameter("ward");
            String socialLink = request.getParameter("socialLink");
            
            // 3. Xử lý file ảnh đại diện được upload
            Part part = request.getPart("profileImage");
            String avatarUrl = currentUser.getAvatarUrl(); // Giữ lại ảnh cũ nếu không có ảnh mới

            if (part != null && part.getSize() > 0) {
                // Tạo đường dẫn tuyệt đối đến thư mục 'uploads' trong web app
                String realPath = request.getServletContext().getRealPath("/uploads");
                String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();

                // Đảm bảo thư mục uploads tồn tại
                Path uploadPath = Paths.get(realPath);
                if (!Files.exists(uploadPath)) {
                    Files.createDirectories(uploadPath);
                }

                // Ghi file
                part.write(realPath + "/" + fileName);

                // Cập nhật URL mới để lưu vào DB
                avatarUrl = "uploads/" + fileName;
            }

            // 4. Cập nhật thông tin vào đối tượng User hiện tại
            currentUser.setPhone(phone);
            currentUser.setLastName(lastName);
            currentUser.setMiddleName(middleName);
            currentUser.setFirstName(firstName);
            currentUser.setNote(note);
            currentUser.setIdCard(idCard);
            currentUser.setDob(dob);
            currentUser.setGender(gender);
            currentUser.setAddress(address);
            currentUser.setCityDistrict(cityDistrict);
            currentUser.setWard(ward);
            currentUser.setSocialLink(socialLink);
            currentUser.setAvatarUrl(avatarUrl); // Cập nhật URL ảnh mới hoặc giữ lại ảnh cũ

            // 5. Gọi DAO để cập nhật vào database
            UserDAO userDAO = new UserDAO();
            boolean isUpdated = userDAO.updateUserProfile(currentUser);

            // 6. Xử lý kết quả và chuyển hướng
            if (isUpdated) {
                // CẬP NHẬT LẠI session với thông tin mới
                session.setAttribute("user", currentUser);
                // Chuyển hướng về trang profile với thông báo thành công
                response.sendRedirect("viewProfile?status=success");
            } else {
                // Chuyển hướng về trang edit với thông báo lỗi
                response.sendRedirect("editProfile.jsp?status=fail");
            }

        } catch (Exception e) {
            e.printStackTrace();
            // Xử lý các lỗi khác (ví dụ: định dạng ngày sai)
            response.sendRedirect("editProfile.jsp?status=error");
        }
    }
        
    

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
