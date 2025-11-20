package com.neofilm.controller;

import com.neofilm.dao.MovieDAO;
import com.neofilm.model.Movie;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "MovieServlet", urlPatterns = { "/MovieServlet" })
public class MovieServlet extends HttpServlet {

    private MovieDAO movieDAO;

    @Override
    public void init() {
        movieDAO = new MovieDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteMovie(request, response);
                break;
            default:
                listMovies(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");

        String title = request.getParameter("title");
        String releaseDate = request.getParameter("releaseDate");
        String genre = request.getParameter("genre");
        String synopsis = request.getParameter("synopsis");
        String ratingStr = request.getParameter("rating");
        String director = request.getParameter("director");
        String actors = request.getParameter("actors");
        String durationStr = request.getParameter("duration");
        String posterUrl = request.getParameter("posterUrl");

        Movie m = new Movie();
        m.setTitle(title);
        m.setReleaseDate(releaseDate);
        m.setGenre(genre);
        m.setSynopsis(synopsis);
        m.setDirector(director);
        m.setActors(actors);
        m.setPosterPath(posterUrl);

        try {
            m.setRating(Double.parseDouble(ratingStr));
            m.setDuration(Integer.parseInt(durationStr));
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }

        boolean success;

        if (idStr != null && !idStr.isEmpty()) {

            m.setId(Integer.parseInt(idStr));
            success = movieDAO.updateMovie(m);
        } else {

            success = movieDAO.addMovie(m);
        }

        if (success) {
            response.sendRedirect(request.getContextPath() + "/MovieServlet?status=success");
        } else {
            response.sendRedirect(request.getContextPath() + "/MovieServlet?status=error");
        }
    }

    private void listMovies(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Movie> movies = movieDAO.getAllMovies();
        request.setAttribute("listMovies", movies);
        request.getRequestDispatcher("admin/movies.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        Movie existingMovie = movieDAO.selectMovie(id);

        request.setAttribute("movie", existingMovie);
        request.getRequestDispatcher("admin/movie-form.jsp").forward(request, response);
    }

    private void deleteMovie(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        movieDAO.deleteMovie(id);
        response.sendRedirect(request.getContextPath() + "/MovieServlet?status=deleted");
    }
}