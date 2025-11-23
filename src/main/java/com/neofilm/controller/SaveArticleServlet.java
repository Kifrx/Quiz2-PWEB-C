package com.neofilm.controller;

import com.neofilm.dao.ArticleDAO;
import com.neofilm.model.Article;
import com.neofilm.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/saveArticle")
public class SaveArticleServlet extends HttpServlet {

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

            String idStr = request.getParameter("id");
            String title = request.getParameter("title");
            String content = request.getParameter("content");

            Article article = new Article();
            article.setTitle(title);
            article.setContent(content);

            ArticleDAO dao = new ArticleDAO();
            boolean success = false;

            if (idStr == null || idStr.isEmpty() || idStr.equals("0")) {

                success = dao.addArticle(article);
            } else {

                article.setId(Integer.parseInt(idStr));
                success = dao.updateArticle(article);
            }

            if (success) {

                response.sendRedirect("admin/dashboard.jsp?status=saved");
            } else {
                response.sendRedirect("admin/article-form.jsp?status=error");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin/article-form.jsp?status=error");
        }
    }
}