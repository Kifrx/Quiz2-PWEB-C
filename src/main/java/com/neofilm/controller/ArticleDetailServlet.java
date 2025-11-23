package com.neofilm.controller;

import com.neofilm.dao.ArticleDAO;
import com.neofilm.model.Article;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/article-detail")
public class ArticleDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");

        if (idParam != null && !idParam.isEmpty()) {
            try {
                int id = Integer.parseInt(idParam);

                ArticleDAO dao = new ArticleDAO();
                Article article = dao.getArticleById(id);

                if (article != null) {
                    request.setAttribute("article", article);
                    request.getRequestDispatcher("article-detail.jsp").forward(request, response);
                } else {
                    response.sendRedirect("articles");
                }

            } catch (Exception e) {
                response.sendRedirect("articles");
            }
        } else {
            response.sendRedirect("articles");
        }
    }
}