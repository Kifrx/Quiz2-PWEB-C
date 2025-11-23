package com.neofilm.dao;

import com.neofilm.model.Review;
import com.neofilm.utils.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReviewDAO {

    public boolean addReview(Review review) {
        String sql = "INSERT INTO reviews (user_id, movie_id, rating, comment) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, review.getUserId());
            ps.setInt(2, review.getMovieId());
            ps.setInt(3, review.getRating());
            ps.setString(4, review.getComment());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Review> getReviewsByMovieId(int movieId) {
        List<Review> reviews = new ArrayList<>();

        String sql = "SELECT r.*, u.username FROM reviews r " +
                "JOIN users u ON r.user_id = u.id " +
                "WHERE r.movie_id = ? ORDER BY r.created_at DESC";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, movieId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Review r = new Review();
                    r.setId(rs.getInt("id"));
                    r.setUserId(rs.getInt("user_id"));
                    r.setMovieId(rs.getInt("movie_id"));
                    r.setUsername(rs.getString("username"));
                    r.setRating(rs.getInt("rating"));
                    r.setComment(rs.getString("comment"));

                    r.setReviewDate(rs.getString("created_at"));

                    reviews.add(r);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviews;
    }
}