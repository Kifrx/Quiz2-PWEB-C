package com.neofilm.controller;

import com.neofilm.dao.MovieDAO;
import com.neofilm.model.Movie;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeServlet", urlPatterns = { "/home", "" })
public class HomeServlet extends HttpServlet {

    private MovieDAO movieDAO;

    @Override
    public void init() {
        movieDAO = new MovieDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Movie> listFilm = movieDAO.getAllMovies();

        request.setAttribute("movieList", listFilm);

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}