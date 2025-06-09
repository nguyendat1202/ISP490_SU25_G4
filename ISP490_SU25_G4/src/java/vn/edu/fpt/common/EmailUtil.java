/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.edu.fpt.common;

/**
 *
 * @author ducanh
 */
import java.io.InputStream;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class EmailUtil {

    private static Properties prop;

    // Khối static này sẽ được chạy một lần duy nhất khi lớp được tải,
    // để đọc file properties và lưu vào biến prop.
    static {
        prop = new Properties();
        try (InputStream input = EmailUtil.class.getClassLoader().getResourceAsStream("mail.properties")) {
            if (input == null) {
                System.out.println("Lỗi: không tìm thấy file mail.properties");
            }
            prop.load(input);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Đây là phương thức private, là "động cơ" chính để gửi tất cả các loại
     * email. Nó xử lý tất cả các logic chung.
     */
    private static void sendEmail(String toEmail, String subject, String htmlContent) throws Exception {
        final String fromEmail = prop.getProperty("mail.from.email");
        final String fromPassword = prop.getProperty("mail.from.password");
        final String fromName = prop.getProperty("mail.from.name");

        Session session = Session.getInstance(prop, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, fromPassword);
            }
        });

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(fromEmail, fromName));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
        message.setSubject(subject);
        message.setContent(htmlContent, "text/html; charset=utf-8");

        Transport.send(message);
    }

    /**
     * Phương thức PUBLIC để gửi thông tin tài khoản cho nhân viên mới. Nhiệm vụ
     * của nó chỉ là chuẩn bị nội dung và gọi "động cơ" sendEmail.
     */
    public static void sendAccountInfoEmail(String toEmail, String employeeName, String password) {
        String subject = "Thông tin tài khoản nhân viên mới";
        String htmlContent = "<h1>Chào mừng nhân viên mới, " + employeeName + "!</h1>"
                + "<p>Chúc mừng bạn đã chính thức trở thành thành viên của công ty chúng tôi.</p>"
                + "<p>Dưới đây là thông tin tài khoản để bạn truy cập vào hệ thống nội bộ:</p>"
                + "<ul>"
                + "<li><b>Tài khoản (Email):</b> " + toEmail + "</li>"
                + "<li><b>Mật khẩu:</b> " + password + "</li>"
                + "</ul>"
                + "<p>Vui lòng đổi mật khẩu trong lần đăng nhập đầu tiên để đảm bảo an toàn.</p>"
                + "<p>Trân trọng,<br>Phòng Nhân sự</p>";

        try {
            sendEmail(toEmail, subject, htmlContent);
            System.out.println("Email thông tin tài khoản đã gửi thành công tới " + toEmail);
        } catch (Exception e) {
            System.err.println("Gửi email thông tin tài khoản thất bại: " + e.getMessage());
            e.printStackTrace();
        }
    }

    /**
     * Phương thức PUBLIC để gửi mã OTP. Tương tự, nó chỉ chuẩn bị nội dung và
     * gọi "động cơ" sendEmail.
     */
    public static void sendOTP(String toEmail, String otpCode) {
        String subject = "Mã xác thực đăng ký tài khoản DPCRM";
        String htmlContent = "<h3>Mã OTP của bạn là: " + otpCode + "</h3>"
                + "<p>Mã có hiệu lực trong 5 phút.</p>";

        try {
            sendEmail(toEmail, subject, htmlContent);
            System.out.println("Đã gửi OTP tới: " + toEmail);
        } catch (Exception e) {
            System.err.println("Gửi OTP thất bại: " + e.getMessage());
            e.printStackTrace();
        }
    }

}
