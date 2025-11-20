package com.neofilm.controller;

import java.io.IOException;
import java.util.List;

import com.neofilm.dao.MovieDAO;
import com.neofilm.model.Movie;
import com.neofilm.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/favorites")
public class FavoritesServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        // Cek Login
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        MovieDAO dao = new MovieDAO();
        List<Movie> favMovies = dao.getFavoritesByUserId(user.getId());
        request.setAttribute("movieList", favMovies);
        request.getRequestDispatcher("favorites.jsp").forward(request, response);
    }
}
