/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package vn.edu.fpt.controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.fpt.dao.UserDAO;

/**
 *
 * @author ducanh
 */
@WebServlet(name = "CreatePasswordController", urlPatterns = {"/CreatePasswordController"})
public class CreatePasswordController extends HttpServlet {

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
            out.println("<title>Servlet CreatePasswordController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreatePasswordController at " + request.getContextPath() + "</h1>");
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
        UserDAO dao = new UserDAO();
        String password = request.getParameter("password");
        String confirm = request.getParameter("confirmPassword");

        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        // --- SỬA LỖI Ở ĐÂY ---
        // thông tin tên từ session
        String lastName = (String) session.getAttribute("lastName");
        String middleName = (String) session.getAttribute("middleName");
        String firstName = (String) session.getAttribute("firstName");

        if (email == null) {
            response.sendRedirect("register.jsp");
            return;
        }

        if (!password.equals(confirm)) {
            request.setAttribute("error", "Mật khẩu không khớp!");
            request.getRequestDispatcher("password.jsp").forward(request, response);
            return;
        }

        if (!isValidPassword(password)) {
            request.setAttribute("error", "Mật khẩu không đủ mạnh!");
            request.getRequestDispatcher("password.jsp").forward(request, response);
            return;
        }

        dao.createNewEmployee(lastName, middleName, firstName, email, password);
        // Xóa email khỏi session sau khi tạo tài khoản
        session.removeAttribute("email");
        //edit
        session.removeAttribute("lastName");
        session.removeAttribute("middleName");
        session.removeAttribute("firstName");
        // Chuyển về trang đăng nhập
        response.sendRedirect("login.jsp");
    }

    private boolean isValidPassword(String password) {
        return password.length() >= 8
                && password.matches(".*[A-Z].*")
                && password.matches(".*[a-z].*")
                && password.matches(".*[0-9].*");
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
