package com.neofilm.dao;

import com.neofilm.model.Movie;
import com.neofilm.utils.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MovieDAO {

    private Movie mapRowToMovie(ResultSet rs) throws SQLException {
        Movie m = new Movie();
        m.setId(rs.getInt("id"));
        m.setTitle(rs.getString("title"));
        m.setReleaseDate(rs.getString("release_date"));
        m.setGenre(rs.getString("genre"));
        m.setSynopsis(rs.getString("synopsis"));

        m.setPosterPath(rs.getString("poster_path"));
        m.setRating(rs.getDouble("rating"));
        m.setDirector(rs.getString("director"));
        m.setActors(rs.getString("actors"));
        m.setDuration(rs.getInt("duration"));
        return m;
    }

    public boolean addMovie(Movie movie) {
        String sql = "INSERT INTO movies (title, release_date, genre, synopsis, poster_path, rating, director, actors, duration) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, movie.getTitle());
            ps.setString(2, movie.getReleaseDate());
            ps.setString(3, movie.getGenre());
            ps.setString(4, movie.getSynopsis());
            ps.setString(5, movie.getPosterPath());
            ps.setDouble(6, movie.getRating());
            ps.setString(7, movie.getDirector());
            ps.setString(8, movie.getActors());
            ps.setInt(9, movie.getDuration());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Movie> getAllMovies() {
        List<Movie> movies = new ArrayList<>();
        String sql = "SELECT * FROM movies ORDER BY id DESC";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                movies.add(mapRowToMovie(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return movies;
    }

    public Movie getMovieById(int id) {
        Movie m = null;
        String sql = "SELECT * FROM movies WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    m = mapRowToMovie(rs);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return m;
    }

    public boolean updateMovie(Movie movie) {

        String sql = "UPDATE movies SET title = ?, release_date = ?, genre = ?, duration = ?, rating = ?, synopsis = ?, director = ?, actors = ?, poster_path = ? WHERE id = ?";

        try (Connection connection = DBConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, movie.getTitle());
            statement.setString(2, movie.getReleaseDate());
            statement.setString(3, movie.getGenre());
            statement.setInt(4, movie.getDuration());
            statement.setDouble(5, movie.getRating());
            statement.setString(6, movie.getSynopsis());
            statement.setString(7, movie.getDirector());
            statement.setString(8, movie.getActors());
            statement.setString(9, movie.getPosterPath());
            statement.setInt(10, movie.getId());

            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteMovie(int id) {
        try (Connection connection = DBConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement("DELETE FROM movies WHERE id = ?")) {
            statement.setInt(1, id);
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Movie> getTop10Movies() {
        List<Movie> movies = new ArrayList<>();
        String sql = "SELECT * FROM movies ORDER BY rating DESC LIMIT 10";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                movies.add(mapRowToMovie(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return movies;
    }

    public List<Movie> getLatestMovies() {
        List<Movie> movies = new ArrayList<>();

        String sql = "SELECT * FROM movies ORDER BY release_date DESC LIMIT 3";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                movies.add(mapRowToMovie(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return movies;
    }

    public List<Movie> getFavoritesByUserId(int userId) {
        List<Movie> movies = new ArrayList<>();
        String sql = "SELECT m.* FROM movies m JOIN favorites f ON m.id = f.movie_id WHERE f.user_id = ? ORDER BY f.created_at DESC";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    movies.add(mapRowToMovie(rs));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return movies;
    }

    public boolean isFavorite(int userId, int movieId) {
        String sql = "SELECT 1 FROM favorites WHERE user_id = ? AND movie_id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, movieId);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean addFavorite(int userId, int movieId) {
        String sql = "INSERT INTO favorites (user_id, movie_id) VALUES (?, ?)";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, movieId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            return false;
        }
    }

    public boolean removeFavorite(int userId, int movieId) {
        String sql = "DELETE FROM favorites WHERE user_id = ? AND movie_id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, movieId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            return false;
        }
    }
}