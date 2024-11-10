package com.repo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.model.User;

public class UserDAO {
    private Connection conn;

    public UserDAO(Connection conn) {
        this.conn = conn;
    }

    public boolean addUser(User u) {
        boolean isAdded = false;
        String sql = "INSERT INTO user(name, qualification, email, password, role, access,paymentDetails) VALUES(?, ?, ?, ?, ?, ?,?)";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, u.getName());
            ps.setString(2, u.getQualification());
            ps.setString(3, u.getEmail());
            ps.setString(4, u.getPassword());
            ps.setString(5, "user");
            ps.setString(6, "lock");
            ps.setString(7, "null");
            
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                isAdded = true;
            }
        } catch (SQLException e) {
            System.err.println("SQL exception occurred while adding user: " + e.getMessage());
        }
        return isAdded;
    }

    public User login(String email, String password) {
        User user = null;
        String sql = "SELECT * FROM user WHERE email = ? AND password = ?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    user = new User();
                    user.setId(rs.getInt("id"));
                    user.setName(rs.getString("name"));
                    user.setQualification(rs.getString("qualification"));
                    user.setEmail(rs.getString("email"));
                    user.setPassword(rs.getString("password"));
                    user.setRole(rs.getString("role"));
                    user.setAccess(rs.getString("access"));
                }
            }
        } catch (SQLException e) {
            System.err.println("SQL exception occurred while logging in: " + e.getMessage());
        }
        return user;
    }

    public boolean updateUser(User u) {
        boolean isUpdated = false;
        String sql = "UPDATE user SET name = ?, email = ?, password = ?, qualification = ? WHERE id = ?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, u.getName());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getPassword());
            ps.setString(4, u.getQualification());
            ps.setInt(5, u.getId());

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                isUpdated = true;
            }
        } catch (SQLException e) {
            System.err.println("SQL exception occurred while updating user: " + e.getMessage());
        }
        return isUpdated;
    }
}
