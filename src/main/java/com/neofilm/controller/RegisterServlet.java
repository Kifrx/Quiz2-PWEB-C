package com.neofilm.controller;

import com.neofilm.dao.UserDAO;
import com.neofilm.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() {

        userDAO = new UserDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User newUser = new User();
        newUser.setUsername(username);
        newUser.setEmail(email);
        newUser.setPassword(password);

        boolean isSuccess = userDAO.register(newUser);

        if (isSuccess) {
            System.out.println("User baru berhasil dibuat!");

            response.sendRedirect("login.jsp?status=registered");
        } else {

            request.setAttribute("errorMessage", "Registrasi Gagal. Coba lagi.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}