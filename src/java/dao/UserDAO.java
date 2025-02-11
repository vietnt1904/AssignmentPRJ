/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.ArrayList;
import model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.util.List;

/**
 *
 * @author VIET
 */
public class UserDAO extends MyDAO {

    public List<User> getAllUser() {
        List<User> allUsers = new ArrayList<>();
        xSql = "select * from USers";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int userID = rs.getInt("UserID");
            String userName = rs.getString("UserName");
            String password = rs.getString("Password");
            String fullName = rs.getNString("FullName");
            String email = rs.getString("Email");
            String role = rs.getString("Role");
            String address = rs.getNString("Address");
            User user = new User(userID, userName, password, fullName, email, role, address);
                allUsers.add(user);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return allUsers;
    }

    public User getUserByID(int id) {
        xSql = "select * from USers where UserID = " + id;
        User user = new User();
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            int userID = rs.getInt("UserID");
            String userName = rs.getString("UserName");
            String password = rs.getString("Password");
            String fullName = rs.getNString("FullName");
            String email = rs.getString("Email");
            String role = rs.getString("Role");
            String address = rs.getNString("Address");
            user = new User(userID, userName, password, fullName, email, role, address);
        } catch (Exception e) {
            System.out.println(e);
        }
        return user;
    }
    
    public User getUserByAccount(String account) {
        xSql = "select * from USers where UserID = " + account;
        User user = new User();
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            int userID = rs.getInt("UserID");
            String userName = rs.getString("UserName");
            String password = rs.getString("Password");
            String fullName = rs.getNString("FullName");
            String email = rs.getString("Email");
            String role = rs.getString("Role");
            String address = rs.getNString("Address");
            user = new User(userID, userName, password, fullName, email, role, address);
        } catch (Exception e) {
            System.out.println(e);
        }
        return user;
    }
}
