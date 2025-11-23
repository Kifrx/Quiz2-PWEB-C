package com.neofilm.controller;

import com.neofilm.dao.MovieDAO;
import com.neofilm.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "ToggleFavoriteServlet", urlPatterns = { "/addToFavorites" })
public class ToggleFavoriteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String movieIdStr = request.getParameter("movieId");

        if (movieIdStr != null && !movieIdStr.isEmpty()) {
            try {
                int movieId = Integer.parseInt(movieIdStr);
                int userId = user.getId();

                MovieDAO dao = new MovieDAO();

                if (dao.isFavorite(userId, movieId)) {
                    dao.removeFavorite(userId, movieId);
                } else {
                    dao.addFavorite(userId, movieId);
                }

                response.sendRedirect("movie-detail?id=" + movieId);

            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("home");
            }
        } else {
            response.sendRedirect("home");
        }
    }
}