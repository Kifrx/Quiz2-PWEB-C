package com.neofilm.controller;

import com.neofilm.dao.ArticleDAO;
import com.neofilm.model.Article;
import com.neofilm.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/articles")
public class AdminArticlesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("../login.jsp");
            return;
        }

        ArticleDAO dao = new ArticleDAO();
        List<Article> listArticles = dao.getAllArticles();

        System.out.println("Jumlah Artikel ditemukan: " + listArticles.size());

        request.setAttribute("articles", listArticles);
        request.getRequestDispatcher("articles.jsp").forward(request, response);
    }
}