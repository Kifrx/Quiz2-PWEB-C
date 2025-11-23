package com.neofilm.controller;

import com.neofilm.dao.ArticleDAO;
import com.neofilm.model.Article;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/articles")
public class PublicArticlesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ArticleDAO dao = new ArticleDAO();
        List<Article> articles = dao.getAllArticles();

        request.setAttribute("articles", articles);
        request.getRequestDispatcher("article.jsp").forward(request, response);
    }
}