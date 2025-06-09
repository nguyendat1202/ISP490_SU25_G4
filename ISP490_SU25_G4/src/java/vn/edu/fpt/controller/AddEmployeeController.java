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
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;
import java.time.LocalDate;
import org.mindrot.jbcrypt.BCrypt;
import vn.edu.fpt.common.EmailUtil;
import vn.edu.fpt.dao.UserDAO;
import vn.edu.fpt.model.User;

/**
 *
 * @author ducanh
 */
@WebServlet(name = "AddEmployeeController", urlPatterns = {"/addEmployee"})
@MultipartConfig
public class AddEmployeeController extends HttpServlet {

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
            out.println("<title>Servlet AddEmployeeController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddEmployeeController at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        UserDAO dao = new UserDAO();
        // Lấy mã nhân viên mới từ DAO
        String newEmployeeCode = dao.getNewEmployeeCode();
        // Đặt mã này vào request để JSP có thể lấy ra
        request.setAttribute("newEmployeeCode", newEmployeeCode);
        // Chuyển hướng tới trang JSP
        request.getRequestDispatcher("addEmployee.jsp").forward(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        // SỬA LỖI: Khai báo và khởi tạo đối tượng user ở ngoài khối try
        // để cả khối try và catch đều có thể truy cập được.
        User user = new User();

        try {
            // --- BƯỚC 1: XỬ LÝ FILE UPLOAD (AVATAR) ---
            String avatarFileName = null;
            Part filePart = request.getPart("avatar");
            if (filePart != null && filePart.getSize() > 0 && filePart.getSubmittedFileName() != null && !filePart.getSubmittedFileName().isEmpty()) {
                String originalFileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                avatarFileName = System.currentTimeMillis() + "_" + originalFileName;
                String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }
                filePart.write(uploadPath + File.separator + avatarFileName);
            }

            // --- BƯỚC 2: ĐIỀN THÔNG TIN VÀO ĐỐI TƯỢNG USER ---
            // Không khai báo "User user = new User();" ở đây nữa.
            user.setEmployeeCode(request.getParameter("employeeCode"));
            user.setLastName(request.getParameter("lastName"));
            user.setMiddleName(request.getParameter("middleName"));
            user.setFirstName(request.getParameter("firstName"));
            user.setPhoneNumber(request.getParameter("phone"));
            user.setEmail(request.getParameter("email"));
            user.setDepartment(request.getParameter("department"));
            user.setPosition(request.getParameter("position"));
            user.setNotes(request.getParameter("notes"));
            user.setIdentityCardNumber(request.getParameter("idCard"));
            user.setAddress(request.getParameter("address"));
            user.setCity(request.getParameter("city"));
            user.setDistrict(request.getParameter("quan"));
            user.setWard(request.getParameter("stress"));
            user.setAvatarUrl(avatarFileName);

            String dobStr = request.getParameter("dob");
            if (dobStr != null && !dobStr.isEmpty()) {
                user.setDateOfBirth(LocalDate.parse(dobStr));
            }

            String genderVn = request.getParameter("gender");
            user.setGender("Nam".equals(genderVn) ? "male" : "female");

            // --- BƯỚC 3: THIẾT LẬP CÁC GIÁ TRỊ MẶC ĐỊNH ---
            String defaultPassword = "123456";
            user.setPasswordHash(BCrypt.hashpw(defaultPassword, BCrypt.gensalt(12)));
            user.setRole("cskh");
            user.setStatus("active");
            user.setIsDeleted(false);
            user.setSocialMediaLink(null);

            // --- BƯỚC 4: GỌI DAO ĐỂ LƯU ---
            UserDAO dao = new UserDAO();
            boolean success = dao.addUser(user);

            // --- BƯỚC 5: CHUYỂN HƯỚNG HOẶC GỬI EMAIL ---
            if (success) {
                // Gửi email nếu thành công
                try {
                    EmailUtil.sendAccountInfoEmail(user.getEmail(), user.getFirstName(), defaultPassword);
                } catch (Exception mailException) {
                    System.err.println("Lỗi phụ: Không thể gửi email. " + mailException.getMessage());
                }
                response.sendRedirect("listEmployee");
            } else {
                throw new Exception("Thêm nhân viên vào CSDL thất bại (hàm addUser trả về false).");
            }
        } catch (Exception e) {
            e.printStackTrace();

            // Gửi thông báo lỗi cụ thể nhận được từ DAO hoặc Exception khác
            request.setAttribute("error", e.getMessage());

            // Gửi lại toàn bộ dữ liệu người dùng đã nhập (đối tượng "user" giờ đã hợp lệ)
            request.setAttribute("employee", user);

            // Tải lại trang với mã nhân viên mới và dữ liệu cũ
            doGet(request, response);
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
