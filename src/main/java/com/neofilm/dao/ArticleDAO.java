package com.neofilm.dao;

import com.neofilm.model.Article;
import com.neofilm.utils.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ArticleDAO {

    public boolean addArticle(Article article) {
        String sql = "INSERT INTO articles (title, content) VALUES (?, ?)";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, article.getTitle());
            ps.setString(2, article.getContent());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateArticle(Article article) {
        String sql = "UPDATE articles SET title = ?, content = ? WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, article.getTitle());
            ps.setString(2, article.getContent());
            ps.setInt(3, article.getId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Article getArticleById(int id) {
        Article article = null;
        String sql = "SELECT * FROM articles WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    article = new Article();
                    article.setId(rs.getInt("id"));
                    article.setTitle(rs.getString("title"));
                    article.setContent(rs.getString("content"));
                    article.setCreatedAt(rs.getString("created_at"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return article;
    }

    public List<Article> getAllArticles() {
        List<Article> articles = new ArrayList<>();

        String sql = "SELECT * FROM articles ORDER BY created_at DESC";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Article a = new Article();
                a.setId(rs.getInt("id"));
                a.setTitle(rs.getString("title"));
                a.setContent(rs.getString("content"));

                a.setCreatedAt(rs.getString("created_at"));

                articles.add(a);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return articles;
    }

}