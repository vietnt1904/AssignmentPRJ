/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

import model.User;

/**
 *
 * @author VIET
 */
@WebServlet(urlPatterns = "/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String account = req.getParameter("account");
        String password = req.getParameter("password");

        if (account == null || password == null || account.isEmpty() || password.isEmpty()) {
            req.setAttribute("errorMessage", "Vui lòng nhập tài khoản và mật khẩu!");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
            return;
        }

        String hashPass = String.valueOf(password.hashCode());
        UserDAO ud = new UserDAO();
        User user = ud.getUserByAccount(account, hashPass);

        if (user == null) {
            req.setAttribute("errorMessage", "Sai tài khoản hoặc mật khẩu!");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
            return;
        }

        HttpSession session = req.getSession();
        session.setAttribute("user", user);

        if (user.getRole().equalsIgnoreCase("Citizen")) {
            resp.sendRedirect("citizen/home.jsp");
        } else if (user.getRole().equalsIgnoreCase("Police")) {
            resp.sendRedirect("police/home.jsp");
        } else if (user.getRole().equalsIgnoreCase("AreaLead")) {
            resp.sendRedirect("arealeader/home.jsp");
        } else {
            req.setAttribute("errorMessage", "Vai trò không hợp lệ!");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}


