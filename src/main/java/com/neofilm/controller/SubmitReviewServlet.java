package com.neofilm.controller;

import com.neofilm.dao.ReviewDAO;
import com.neofilm.model.Review;
import com.neofilm.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/submitReview")
public class SubmitReviewServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {

            int movieId = Integer.parseInt(request.getParameter("movieId"));
            int rating = Integer.parseInt(request.getParameter("rating"));
            String comment = request.getParameter("comment");

            Review review = new Review();
            review.setUserId(user.getId());
            review.setMovieId(movieId);
            review.setRating(rating);
            review.setComment(comment);

            ReviewDAO dao = new ReviewDAO();
            dao.addReview(review);

            response.sendRedirect("movie-detail?id=" + movieId);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("home");
        }
    }
}