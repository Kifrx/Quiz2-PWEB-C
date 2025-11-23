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

@WebServlet("/top10")
public class Top10Servlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        MovieDAO dao = new MovieDAO();

        List<Movie> topMovies = dao.getTop10Movies();

        request.setAttribute("topMovies", topMovies);
        request.getRequestDispatcher("top10.jsp").forward(request, response);
    }
}