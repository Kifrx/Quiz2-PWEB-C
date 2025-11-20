package com.neofilm.controller;

import com.neofilm.dao.MovieDAO;
import com.neofilm.model.Movie;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "MovieDetailServlet", urlPatterns = { "/movie-detail" })
public class MovieDetailServlet extends HttpServlet {

    private MovieDAO movieDAO;

    @Override
    public void init() {
        movieDAO = new MovieDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");

        if (idParam != null && !idParam.isEmpty()) {
            try {
                int id = Integer.parseInt(idParam);
                Movie movie = movieDAO.getMovieById(id);

                if (movie != null) {
                    request.setAttribute("movie", movie);

                    request.setAttribute("isFavorite", false);

                    request.getRequestDispatcher("movie-detail.jsp").forward(request, response);
                } else {
                    response.sendRedirect("home");
                }

            } catch (NumberFormatException e) {
                response.sendRedirect("home");
            }
        } else {
            response.sendRedirect("home");
        }
    }
}