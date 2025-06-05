/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.edu.fpt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
}
