/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.edu.fpt.model;

import java.sql.Timestamp;
import java.sql.Date;

/**
 *
 * @author ducanh
 */
public class User {
    private int id;
    private String email;
    private String passwordHash;
    private String name;
    private String role;
    private String status;
    private Timestamp createdAt;
    private Timestamp updatedAt; 
    
    // --- Thuộc tính chi tiết của Profile ---
    private String firstName;
    private String middleName;
    private String lastName;
    private String phone;
    private String department; // Phòng làm việc
    private String note;
    private String avatarUrl;
    private String idCard; // Số CMND/CCCD
    private Date dob; // Ngày sinh (Date)
    private String gender; // Giới tính
    private String address; // Địa chỉ chi tiết (số nhà, đường)
    private String cityDistrict; // Tỉnh/TP, Quận/Huyện
    private String ward; // Phường/Xã
    private String socialLink; // Link mạng xã hội

    public User() {
    }

    public User(int id, String email, String passwordHash, String name, String role, String status, Timestamp createdAt, Timestamp updatedAt) {
        this.id = id;
        this.email = email;
        this.passwordHash = passwordHash;
        this.name = name;
        this.role = role;
        this.status = status;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPasswordHash() {
        return passwordHash;
    }

    public void setPasswordHash(String passwordHash) {
        this.passwordHash = passwordHash;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }
    
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getAvatarUrl() {
        return avatarUrl;
    }

    public void setAvatarUrl(String avatarUrl) {
        this.avatarUrl = avatarUrl;
    }
    
    // bổ sung
     public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    
    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    
    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public Date getDob() {
        return dob;
    }
    
    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getGender() {
        return gender;
    }
    
    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }

    public String getCityDistrict() {
        return cityDistrict;
    }
    
    public void setCityDistrict(String cityDistrict) {
        this.cityDistrict = cityDistrict;
    }
    
    public String getWard() {
        return ward;
    }

    public void setWard(String ward) {
        this.ward = ward;
    }

    public String getSocialLink() {
        return socialLink;
    }
    
    public void setSocialLink(String socialLink) {
        this.socialLink = socialLink;
    }
    
    public int getUserId() {
    return this.id; 
}
    

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", email=" + email + ", passwordHash=" + passwordHash + ", name=" + name + ", role=" + role + ", status=" + status + ", createdAt=" + createdAt + ", updatedAt=" + updatedAt + '}';
    }

}
