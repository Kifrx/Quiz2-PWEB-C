package com.neofilm.controller;

import com.neofilm.dao.UserDAO;
import com.neofilm.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = { "/LoginServlet" })
public class LoginServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = userDAO.login(email, password);

        if (user != null) {

            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            session.setAttribute("role", user.getRole());

            if ("admin".equals(user.getRole())) {
                response.sendRedirect("admin/dashboard.jsp");
            } else {
                response.sendRedirect("home");
            }

        } else {

            response.sendRedirect("login.jsp?error=invalid");
        }
    }
}