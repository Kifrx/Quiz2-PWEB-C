package com.neofilm.controller;

import com.neofilm.dao.MovieDAO;
import com.neofilm.dao.ReviewDAO;
import com.neofilm.model.Movie;
import com.neofilm.model.Review;
import com.neofilm.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "MovieDetailServlet", urlPatterns = { "/movie-detail" })
public class MovieDetailServlet extends HttpServlet {

    private MovieDAO movieDAO;
    private ReviewDAO reviewDAO;

    @Override
    public void init() {
        movieDAO = new MovieDAO();
        reviewDAO = new ReviewDAO();
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

                    HttpSession session = request.getSession();
                    User user = (User) session.getAttribute("user");
                    boolean isFav = false;

                    if (user != null) {
                        isFav = movieDAO.isFavorite(user.getId(), id);
                    }
                    request.setAttribute("isFavorite", isFav);

                    List<Review> reviews = reviewDAO.getReviewsByMovieId(id);
                    System.out.println("ID Film: " + id);
                    System.out.println("Jumlah Review Ditemukan: " + reviews.size());
                    request.setAttribute("reviewList", reviews);

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