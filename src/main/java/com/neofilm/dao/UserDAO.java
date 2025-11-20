package com.neofilm.dao;

import com.neofilm.model.User;
import com.neofilm.utils.DBConnection;
import java.sql.*;

public class UserDAO {

    public User login(String email, String password) {
        User user = null;
        String sql = "SELECT * FROM users WHERE email = ? AND password = ?";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, email);
            ps.setString(2, password);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    user = new User();
                    user.setId(rs.getInt("id"));
                    user.setFullName(rs.getString("full_name"));
                    user.setEmail(rs.getString("email"));
                    user.setRole(rs.getString("role"));

                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}