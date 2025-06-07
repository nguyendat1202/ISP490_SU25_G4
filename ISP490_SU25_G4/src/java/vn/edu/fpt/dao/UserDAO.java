/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.edu.fpt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.mindrot.jbcrypt.BCrypt;
import vn.edu.fpt.model.User;

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

            if (rs.next()) {
                String hashed = rs.getString("password_hash");

                // So sánh mật khẩu nhập vào với mật khẩu đã hash trong DB
                if (org.mindrot.jbcrypt.BCrypt.checkpw(password, hashed)) {
                    // Tạo đối tượng Users để trả về nếu đúng mật khẩu
                    User user = new User();
                    user.setId(rs.getInt("id"));
                    user.setEmail(rs.getString("email"));
                    user.setName(rs.getString("name"));
                    user.setRole(rs.getString("role"));
                    user.setStatus(rs.getString("status"));
                    user.setCreatedAt(rs.getTimestamp("created_at"));
                    user.setUpdatedAt(rs.getTimestamp("updated_at"));

                    return user;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null; // đăng nhập thất bại
    }

    public void createUser(String email, String rawPassword) {
        String sql = "INSERT INTO Users (email, password_hash, name, role, status) VALUES (?, ?, '', 'cskh', 'active')";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            String hashed = BCrypt.hashpw(rawPassword, BCrypt.gensalt());
            ps.setString(1, email);
            ps.setString(2, hashed);
            ps.executeUpdate();
        } catch (Exception e) {
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
        String sql = "UPDATE Users SET "
                   + "Phone = ?, "
                   + "LastName = ?, "
                   + "MiddleName = ?, "
                   + "FirstName = ?, "
                   + "Note = ?, "
                   + "IdCard = ?, "
                   + "Dob = ?, "
                   + "Gender = ?, "
                   + "Address = ?, "
                   + "CityDistrict = ?, "
                   + "Ward = ?, "
                   + "SocialLink = ?, "
                   + "AvatarURL = ? " // URL của ảnh đại diện
                   + "WHERE UserID = ?";

        try (Connection conn = new DBContext().getConnection(); // Lấy kết nối từ DBContext
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, user.getPhone());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getMiddleName());
            ps.setString(4, user.getFirstName());
            ps.setString(5, user.getNote());
            ps.setString(6, user.getIdCard());
            ps.setDate(7, user.getDob());
            ps.setString(8, user.getGender());
            ps.setString(9, user.getAddress());
            ps.setString(10, user.getCityDistrict());
            ps.setString(11, user.getWard());
            ps.setString(12, user.getSocialLink());
            ps.setString(13, user.getAvatarUrl());
            ps.setInt(14, user.getUserId());

            int rowsAffected = ps.executeUpdate();
            
            // Nếu có ít nhất 1 dòng được cập nhật, coi như thành công
            return rowsAffected > 0;

        } catch (SQLException e) {
            System.err.println("Lỗi khi cập nhật profile người dùng: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
 // Lấy all thông tin user dựa vào ID
  public User getUserById(int userId) {
    // Giả sử tên các cột trong DB của bạn là: id, name, email, phone, role, department, note, avatar_url
    // HÃY THAY ĐỔI TÊN CỘT CHO ĐÚNG VỚI DATABASE CỦA BẠN
    String sql = "SELECT * FROM Users WHERE id = ?";
    try (Connection conn = new DBContext().getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setInt(1, userId);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            User user = new User();
            user.setId(rs.getInt("id"));
            user.setName(rs.getString("name"));
            user.setEmail(rs.getString("email"));
            user.setRole(rs.getString("role"));

            // Lấy các trường mới (có thể null)
            user.setPhone(rs.getString("phone")); // Thay "phone" bằng tên cột thật
            user.setDepartment(rs.getString("department")); // Thay "department" bằng tên cột thật
            user.setNote(rs.getString("note")); // Thay "note" bằng tên cột thật
            user.setAvatarUrl(rs.getString("avatar_url")); // Thay "avatar_url" bằng tên cột thật
            
            user.setStatus(rs.getString("status"));
            user.setCreatedAt(rs.getTimestamp("created_at"));
            user.setUpdatedAt(rs.getTimestamp("updated_at"));

            return user;
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return null; // Không tìm thấy user
}  
}
    
    

