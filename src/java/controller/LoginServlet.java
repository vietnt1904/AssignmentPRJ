/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.MyDAO;
import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
        String hashPass = String.valueOf(password.hashCode());
        UserDAO ud = new UserDAO();
        User user = ud.getUserByAccount(account, hashPass);
        if (user.getRole() != null) {
            if (user.getRole().equalsIgnoreCase("Citizen")) {
                req.getRequestDispatcher("/citizen/home.jsp").forward(req, resp);
            } else if (user.getRole().equalsIgnoreCase("Police")) {
                req.getRequestDispatcher("/police/home.jsp").forward(req, resp);
            } else if (user.getRole().equalsIgnoreCase("AreaLead")) {
                req.getRequestDispatcher("/arealeader/home.jsp").forward(req, resp);
            }
        }
        
    }

}
