package com.neofilm.controller;

import java.io.IOException;
import java.util.List;

import com.neofilm.dao.MovieDAO;
import com.neofilm.model.Movie;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/top-10")
public class Top10Servlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MovieDAO dao = new MovieDAO();
        List<Movie> topMovies = dao.getTop10Movies();
        request.setAttribute("movieList", topMovies);
        request.getRequestDispatcher("top-10.jsp").forward(request, response);
    }
}
