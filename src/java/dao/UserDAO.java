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
        xSql = "select * from Users";
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

    public User getOne(int id) {
        xSql = "select * from Users where UserID = " + id;
        User user = new User();
        try {
            PreparedStatement connect = connection.prepareStatement(xSql);
            ResultSet result = connect.executeQuery();
            if (result.next()) {
                String userName = result.getString("userName");
                int age = Integer.parseInt(result.getString("age"));
                String phoneNumber = result.getString("phoneNumber");
                String address = result.getString("address");
                String email = result.getString("email");
                String password = result.getString("password");
                int roleID = Integer.parseInt(result.getString("roleID"));
                Date create_At = result.getDate("Create_At");

                user.setFullName(userName);
            }
            connect.close();
            result.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return user;
    }

    public User getUserByID(int id) {
        String Sql = """
                     select * from Users where UserID = ?
                     """;
        User user = new User();
        try {
            ps.setInt(1, id);
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

    public User getUserByAccount(String username, String hashpass) {
        User user = null;

        try {
            String Sql = "SELECT * FROM Users WHERE (UserName = ? OR Email = ?) AND Password = ?";
            ps = con.prepareStatement(Sql);
            ps.setString(1, username);
            ps.setString(2, username);
            ps.setString(3, hashpass);
            System.out.println(ps);
            rs = ps.executeQuery();

            if (rs.next()) {
                int userID = rs.getInt("UserID");
                String userName = rs.getString("UserName");
                String password = rs.getString("Password");
                String fullName = rs.getNString("FullName");
                String email = rs.getString("Email");
                String role = rs.getString("Role");
                String address = rs.getNString("Address");

                user = new User(userID, userName, password, fullName, email, role, address);
            } else {
                System.out.println("Không tìm thấy người dùng với username: " + username);
            }

        } catch (SQLException e) {
            System.err.println("Lỗi khi truy vấn cơ sở dữ liệu: " + e.getMessage());
            e.printStackTrace();
        }
        return user;
    }
}
