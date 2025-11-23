package com.neofilm.controller;

import com.neofilm.dao.MovieDAO;
import com.neofilm.model.Movie;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/latest")
public class LatestServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        MovieDAO dao = new MovieDAO();

        List<Movie> latestMovies = dao.getLatestMovies();

        request.setAttribute("latestMovies", latestMovies);

        request.getRequestDispatcher("latest.jsp").forward(request, response);
    }
}