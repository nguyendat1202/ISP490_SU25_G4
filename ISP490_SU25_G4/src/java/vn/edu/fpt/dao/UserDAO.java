/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.edu.fpt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import org.mindrot.jbcrypt.BCrypt;
import vn.edu.fpt.model.User;
import java.sql.SQLException;

/**
 *
 * @author anhndhe172050
 */
public class UserDAO {

    public User login(String email, String password) {
      
        String sql = "SELECT * FROM Users WHERE email = ?";

        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            // Kiểm tra xem có người dùng với email này không
            if (rs.next()) {
                // KIỂM TRA QUAN TRỌNG: Nếu tài khoản đã bị xóa mềm, không cho đăng nhập
                if (rs.getBoolean("is_deleted")) {
                    return null; // Trả về null coi như đăng nhập thất bại
                }

                String hashedPassword = rs.getString("password_hash");

                // So sánh mật khẩu nhập vào với mật khẩu đã hash trong DB
                if (BCrypt.checkpw(password, hashedPassword)) {
                    // Mật khẩu đúng, tạo và trả về đối tượng User với ĐẦY ĐỦ thông tin
                    User user = new User();

                    // --- ĐÃ SỬA LẠI Ở ĐÂY ---
                    // Thay thế user.setName() bằng các setter cho từng phần của tên
                    user.setId(rs.getInt("id"));
                    user.setLastName(rs.getString("last_name"));
                    user.setMiddleName(rs.getString("middle_name"));
                    user.setFirstName(rs.getString("first_name"));
                    user.setEmail(rs.getString("email"));

                    // --- NÊN BỔ SUNG THÊM ---
                    // Lấy tất cả các thông tin hồ sơ khác
                    user.setPasswordHash(hashedPassword); // Có thể cần nếu bạn muốn dùng lại
                    user.setRole(rs.getString("role"));
                    user.setStatus(rs.getString("status"));
                    user.setEmployeeCode(rs.getString("employee_code"));
                    user.setPosition(rs.getString("position"));
                    user.setDepartment(rs.getString("department"));
                    user.setPhoneNumber(rs.getString("phone_number"));
                    user.setNotes(rs.getString("notes"));
                    user.setAvatarUrl(rs.getString("avatar_url"));
                    user.setIdentityCardNumber(rs.getString("identity_card_number"));

                    // Lấy ngày sinh và chuyển sang LocalDate nếu cột trong DB là DATE
                    if (rs.getDate("date_of_birth") != null) {
                        user.setDateOfBirth(rs.getDate("date_of_birth").toLocalDate());
                    }

                    user.setGender(rs.getString("gender"));
                    user.setAddress(rs.getString("address"));
                    user.setWard(rs.getString("ward"));
                    user.setDistrict(rs.getString("district"));
                    user.setCity(rs.getString("city"));
                    user.setSocialMediaLink(rs.getString("social_media_link"));
                    user.setIsDeleted(rs.getBoolean("is_deleted"));
                    user.setCreatedAt(rs.getTimestamp("created_at"));
                    user.setUpdatedAt(rs.getTimestamp("updated_at"));

                    return user; // Trả về đối tượng user đã có đầy đủ thông tin
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null; // Trả về null nếu email không tồn tại hoặc sai mật khẩu
    }

   public void createUser(String lastName, String middleName, String firstName, String email, String rawPassword) {
       // Câu lệnh SQL đã được sửa để dùng các cột tên mới
       String sql = "INSERT INTO Users (last_name, middle_name, first_name, email, password_hash, role, status) VALUES (?, ?, ?, ?, ?, 'cskh', 'active')";

       try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

           // Mã hóa mật khẩu
           String hashedPassword = BCrypt.hashpw(rawPassword, BCrypt.gensalt());

           // Thiết lập các tham số cho PreparedStatement theo đúng thứ tự
           ps.setString(1, lastName);
           ps.setString(2, middleName);
           ps.setString(3, firstName);
           ps.setString(4, email);
           ps.setString(5, hashedPassword);

           // Thực thi câu lệnh
           ps.executeUpdate();

       } catch (Exception e) {
           // In ra lỗi để dễ dàng gỡ rối
           e.printStackTrace();
       }
   }
    public void updatePassword(String email, String rawPassword) {
        String sql = "UPDATE Users SET password_hash = ? WHERE email = ?";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            String hashed = BCrypt.hashpw(rawPassword, BCrypt.gensalt());
            ps.setString(1, hashed);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean emailExists(String email) {
        String sql = "SELECT id FROM Users WHERE email = ?";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            return rs.next(); // có tồn tại
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateUserProfile(User user) {
        // Câu lệnh SQL để cập nhật các trường có thể chỉnh sửa
        String sql = "UPDATE Users SET "
                + "last_name = ?, middle_name = ?, first_name = ?, email = ?, phone_number = ?, "
                + "department = ?, position = ?, notes = ?, identity_card_number = ?, date_of_birth = ?, "
                + "gender = ?, address = ?, ward = ?, district = ?, city = ?, social_media_link = ?, "
                + "avatar_url = ? "
                + "WHERE id = ?";

        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            // Thiết lập các tham số cho câu lệnh PreparedStatement
            ps.setString(1, user.getLastName());
            ps.setString(2, user.getMiddleName());
            ps.setString(3, user.getFirstName());
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getPhoneNumber());
            ps.setString(6, user.getDepartment());
            ps.setString(7, user.getPosition());
            ps.setString(8, user.getNotes());
            ps.setString(9, user.getIdentityCardNumber());

            // Chuyển đổi từ kiểu java.time.LocalDate sang java.sql.Date
            if (user.getDateOfBirth() != null) {
                ps.setDate(10, java.sql.Date.valueOf(user.getDateOfBirth()));
            } else {
                ps.setNull(10, java.sql.Types.DATE);
            }

            ps.setString(11, user.getGender());
            ps.setString(12, user.getAddress());
            ps.setString(13, user.getWard());
            ps.setString(14, user.getDistrict());
            ps.setString(15, user.getCity());
            ps.setString(16, user.getSocialMediaLink());
            ps.setString(17, user.getAvatarUrl());

            // Điều kiện WHERE
            ps.setInt(18, user.getId());

            // Thực thi lệnh update và kiểm tra xem có hàng nào được cập nhật không
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0; // Trả về true nếu có ít nhất 1 dòng được cập nhật

        } catch (Exception e) {
            e.printStackTrace();
            return false; // Trả về false nếu có lỗi xảy ra
        }
    }

// // Lấy all thông tin user dựa vào ID
    public User getUserById(int userId) {

        String sql = "SELECT * FROM Users WHERE id = ?";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // Sử dụng lại logic tương tự hàm login để lấy đầy đủ thông tin
                User user = new User();

                user.setId(rs.getInt("id"));
                user.setLastName(rs.getString("last_name"));
                user.setMiddleName(rs.getString("middle_name"));
                user.setFirstName(rs.getString("first_name"));
                user.setEmail(rs.getString("email"));
                user.setPasswordHash(rs.getString("password_hash"));
                user.setRole(rs.getString("role"));
                user.setStatus(rs.getString("status"));                
                user.setEmployeeCode(rs.getString("employee_code"));
                user.setPosition(rs.getString("position"));
                user.setDepartment(rs.getString("department"));
                user.setPhoneNumber(rs.getString("phone_number"));
                user.setNotes(rs.getString("notes")); 
                user.setAvatarUrl(rs.getString("avatar_url"));
                user.setIdentityCardNumber(rs.getString("identity_card_number"));
                
                if (rs.getDate("date_of_birth") != null) {
                    user.setDateOfBirth(rs.getDate("date_of_birth").toLocalDate());
                }
                
                user.setGender(rs.getString("gender"));
                user.setAddress(rs.getString("address"));
                user.setWard(rs.getString("ward"));
                user.setDistrict(rs.getString("district"));
                user.setCity(rs.getString("city"));
                user.setSocialMediaLink(rs.getString("social_media_link"));
                user.setIsDeleted(rs.getBoolean("is_deleted"));
                user.setCreatedAt(rs.getTimestamp("created_at"));
                user.setUpdatedAt(rs.getTimestamp("updated_at"));
                
                

                return user;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null; // Không tìm thấy user
    }


    /**
     * Tự động tạo mã nhân viên mới và thêm người dùng vào cơ sở dữ liệu.
     *
     * @param lastName Họ
     * @param middleName Tên đệm
     * @param firstName Tên
     * @param email Email
     * @param rawPassword Mật khẩu thô (chưa mã hóa)
     * @return Trả về mã nhân viên vừa được tạo, hoặc null nếu có lỗi.
     */
    public String createNewEmployee(String lastName, String middleName, String firstName, String email, String rawPassword) {
        String newEmployeeId = null;
        // Sử dụng try-with-resources để đảm bảo kết nối được đóng tự động
        try (Connection conn = new DBContext().getConnection()) {

            // ---- PHẦN 1: LẤY VÀ TẠO MÃ NHÂN VIÊN MỚI ----
            String queryGetMaxId = "SELECT MAX(employee_code) FROM users"; // Đảm bảo tên cột và bảng là đúng

            // Sử dụng PreparedStatement để an toàn và hiệu quả
            try (PreparedStatement psGetMaxId = conn.prepareStatement(queryGetMaxId); ResultSet rs = psGetMaxId.executeQuery()) {

                String lastId = "DP00000"; // Giá trị cơ sở để bắt đầu
                if (rs.next() && rs.getString(1) != null) {
                    lastId = rs.getString(1);
                }

                // Tách phần số và tăng lên 1
                int number = Integer.parseInt(lastId.substring(2)); // Tách số từ "NV..."
                number++;

                // Định dạng lại mã mới
                newEmployeeId = String.format("DP%05d", number);
            }

            // Nếu không tạo được mã mới thì dừng lại
            if (newEmployeeId == null) {
                throw new Exception("Không thể tạo mã nhân viên mới.");
            }

            // ---- PHẦN 2: THÊM NHÂN VIÊN MỚI VỚI MÃ VỪA TẠO ----
            String queryInsert = "INSERT INTO users (employee_code, last_name, middle_name, first_name, email, password_hash, role, status) VALUES (?, ?, ?, ?, ?, ?, 'cskh', 'active')";

            try (PreparedStatement psInsert = conn.prepareStatement(queryInsert)) {
                String hashedPassword = BCrypt.hashpw(rawPassword, BCrypt.gensalt());

                psInsert.setString(1, newEmployeeId); // Sử dụng mã vừa tạo
                psInsert.setString(2, lastName);
                psInsert.setString(3, middleName);
                psInsert.setString(4, firstName);
                psInsert.setString(5, email);
                psInsert.setString(6, hashedPassword);

                psInsert.executeUpdate();
            }

        } catch (Exception e) {
            e.printStackTrace(); // In lỗi ra console để debug
            return null; // Trả về null nếu có lỗi xảy ra
        }

        return newEmployeeId; // Trả về mã nhân viên đã tạo thành công
    }

    public String getNewEmployeeCode() {
        String query = "SELECT MAX(employee_code) FROM users";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            String lastId = "NV00000";
            if (rs.next() && rs.getString(1) != null) {
                lastId = rs.getString(1);
            }
            int number = Integer.parseInt(lastId.substring(2));
            number++;
            return String.format("NV%05d", number);
        } catch (Exception e) {
            e.printStackTrace();
            return "NV00001";
        }
    }

    public boolean addUser(User user) throws Exception {
        String query = "INSERT INTO users (email, password_hash, last_name, middle_name, first_name, role, status, "
                + "avatar_url, employee_code, phone_number, position, department, notes, "
                + "identity_card_number, date_of_birth, gender, address, ward, district, city) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, user.getEmail());
            ps.setString(2, user.getPasswordHash());
            ps.setString(3, user.getLastName());
            ps.setString(4, user.getMiddleName());
            ps.setString(5, user.getFirstName());
            ps.setString(6, user.getRole());
            ps.setString(7, user.getStatus());
            ps.setString(8, user.getAvatarUrl());
            ps.setString(9, user.getEmployeeCode());
            ps.setString(10, user.getPhoneNumber());
            ps.setString(11, user.getPosition());
            ps.setString(12, user.getDepartment());
            ps.setString(13, user.getNotes());
            ps.setString(14, user.getIdentityCardNumber());
            ps.setDate(15, java.sql.Date.valueOf(user.getDateOfBirth()));
            ps.setString(16, user.getGender());
            ps.setString(17, user.getAddress());
            ps.setString(18, user.getWard());
            ps.setString(19, user.getDistrict());
            ps.setString(20, user.getCity());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            // --- PHÂN TÍCH LỖI SQL Ở ĐÂY ---
            String errorMessage = e.getMessage().toLowerCase();

            if (errorMessage.contains("duplicate entry")) {
                // Lỗi trùng lặp dữ liệu (UNIQUE constraint)
                if (errorMessage.contains("email")) {
                    throw new Exception("Email này đã tồn tại trong hệ thống.");
                } else if (errorMessage.contains("phone_number")) {
                    throw new Exception("Số điện thoại này đã được đăng ký.");
                } else if (errorMessage.contains("identity_card_number")) {
                    throw new Exception("Số CMND/CCCD này đã tồn tại.");
                } else {
                    throw new Exception("Dữ liệu bị trùng lặp. Vui lòng kiểm tra lại.");
                }
            } else if (errorMessage.contains("data truncation")) {
                throw new Exception("Dữ liệu nhập vào quá dài so với quy định.");
            }

            // Đối với các lỗi SQL khác
            e.printStackTrace(); // In lỗi gốc ra cho lập trình viên xem
            throw new Exception("Lỗi cơ sở dữ liệu. Vui lòng thử lại."); // Ném ra lỗi thân thiện
        }
    }

    /**
     * Lấy tất cả người dùng (nhân viên) chưa bị xóa khỏi cơ sở dữ liệu.
     *
     * @return một danh sách các đối tượng User.
     */
    public List<User> getAllUsers() {
        List<User> userList = new ArrayList<>();
        // Lấy những nhân viên chưa bị xóa (is_deleted = 0) và sắp xếp theo ngày tạo mới nhất
        String query = "SELECT * FROM Users WHERE is_deleted = 0 ORDER BY created_at DESC";

        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query); ResultSet rs = ps.executeQuery()) {

            // Lặp qua từng dòng kết quả trong ResultSet
            while (rs.next()) {
                User user = new User();
                // Đọc dữ liệu từ ResultSet và gán vào đối tượng User
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setLastName(rs.getString("last_name"));
                user.setMiddleName(rs.getString("middle_name"));
                user.setFirstName(rs.getString("first_name"));
                user.setRole(rs.getString("role"));
                user.setStatus(rs.getString("status"));
                user.setAvatarUrl(rs.getString("avatar_url"));
                user.setEmployeeCode(rs.getString("employee_code"));
                user.setPhoneNumber(rs.getString("phone_number"));
                user.setPosition(rs.getString("position"));
                user.setDepartment(rs.getString("department"));
                user.setIdentityCardNumber(rs.getString("identity_card_number"));

                // Lấy ngày sinh (có thể là null)
                if (rs.getDate("date_of_birth") != null) {
                    user.setDateOfBirth(rs.getDate("date_of_birth").toLocalDate());
                }

                user.setGender(rs.getString("gender"));

                // Thêm đối tượng user đã điền đủ thông tin vào danh sách
                userList.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userList;
    }

}
